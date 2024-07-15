local meta = FindMetaTable("Player")

hook.Add("PlayerBindPress", "context.PlayerBindPress", function(ply, bind, down)
	local weapon = ply:GetActiveWeapon()
	local trust = ply:ToolTrust()
	
	if bind != "+menu_context" or IsValid(weapon) and weapon:GetClass() == "gmod_tool" and not ply:InVehicle() then
		return
	end

	if down then
		ply.ContextMenu = EternityDermaMenu()

		ply:CreateSelfContext(ply.ContextMenu)
		ply:CreateVoiceContext(ply.ContextMenu)
		ply:CreateGestureContext(ply.ContextMenu)
		ply:CreateEntityContext(ply.ContextMenu)

		local transition = ply:GetZone("ent_zone_transition")

		if ply.ContextMenu:ChildCount() > 0 and transition ~= nil then
			ply.ContextMenu:AddSpacer()

			ply.ContextMenu:AddOption("Move To: " .. transition:GetAreaName(), function()
				netstream.Send("RequestServerTransition", {
					Zone = transition:GetEntityID()
				})
			end)
		end

		if ply.ContextMenu:ChildCount() > 0 and ply:IsAdmin() then
			ply.ContextMenu:AddSpacer()
			ply.ContextMenu:AddSpacer()
		end

		ply:CreateAdminContext(ply.ContextMenu)

		if ply.ContextMenu:ChildCount() < 1 then
			ply.ContextMenu:Remove()

			return true
		end

		gui.EnableScreenClicker(true)

		ply.ContextMenu:Open()
	else
		if IsValid(ply.ContextMenu) then
			ply.ContextMenu:Remove()
		end

		gui.EnableScreenClicker(false)
	end

	return true
end)

function meta:GetContextEntity()
	local range = self:GetExamineRange()
	local origin = self:EyePos()

	local tab = ents.FindInSphere(origin, range)

	table.Filter(tab, function(key, val)
		return not val:IsDormant()
	end)

	table.sort(tab, function(a, b)
		return a:WorldSpaceCenter():DistToSqr(self:EyePos()) > b:WorldSpaceCenter():DistToSqr(self:EyePos())
	end)

	for _, v in pairs(tab) do
		if v:GetCollisionGroup() == COLLISION_GROUP_IN_VEHICLE then
			local hit = util.IntersectRayWithOBB(origin, self:EyeAngles():Forward() * range, v:GetPos(), v:GetAngles(), v:OBBMins(), v:OBBMaxs())

			if hit then
				return v
			end
		end
	end

	local ent = self:GetEyeTrace().Entity

	if not IsValid(ent) then
		return
	end

	if not ent:WithinInteractRange(self, range) then
		return
	end

	return ent
end

function meta:CreateSelfContextItems(pnl, name, items)
	local sub = nil

	for _,item in pairs(items) do
		local group = nil

		for _, v in pairs(item:GetContextOptions(self)) do
			if sub == nil then
				sub = pnl:AddSubMenu(name)
			end

			if group == nil then
				group = sub:AddSubMenu(item:GetName())
			end

			local target = nil
			local option = v.Name

			if v.ContextTarget then
				target = self:GetContextEntity()
				local targetAllowed, targetName = v.ContextTarget(target)

				if not targetAllowed then
					continue
				end

				option = targetName
			end

			group:AddOption(option, function()
				if v.Client then
					coroutine.WrapFunc(function()
						local val = v.Client()

						if val then
							netstream.Send("RunItemContext", {
								ID = item.NetworkID,
								Name = v.Name,
								Value = val,
								Target = target
							})
						end
					end)
				else
					netstream.Send("RunItemContext", {
						ID = item.NetworkID,
						Name = v.Name,
						Target = target
					})
				end
			end)
		end
	end
end

function meta:CreateSelfContext(pnl)
	local createsub = true
	local sub = nil

	local equipment = {}
	for _,id in SortedPairs(GAMEMODE:GetSpecies(self:Species()).WeaponSlots) do
		local object = self:GetEquipment(id)

		if object then
			table.insert(equipment, object)
		end
	end

	if #equipment > 0 then
		self:CreateSelfContextItems(pnl, "Equipment", equipment)
	end

	local appearance = {}
	for _,id in SortedPairs(GAMEMODE:GetSpecies(self:Species()).EquipmentSlots) do
		local object = self:GetEquipment(id)

		if object then
			table.insert(appearance, object)
		end
	end

	if #appearance > 0 then
		self:CreateSelfContextItems(pnl, "Appearance", appearance)
	end

	local inventory = {}
	local inventoryClasses = {}
	for _,item in SortedPairs(self:GetInventory("Main"):GetItems()) do
		local itemClass = item:GetClassName()

		if #item:GetContextOptions(self) <= 0 or not item:IsEquipped() or inventoryClasses[itemClass] then
			continue
		end

		inventoryClasses[itemClass] = true
		table.insert(inventory, item)
	end

	if #inventory > 0 then
		table.sort(inventory, function(a, b) return a:GetName():upper() < b:GetName():upper() end)
		self:CreateSelfContextItems(pnl, "Inventory", inventory)
	end	
end

function meta:CreateVoiceContext(pnl)
	local voicelines = self:GetActiveSpecies():GetVoicelines(LocalPlayer())

	if table.Count(voicelines) < 1 then
		return
	end

	local parent = pnl:AddSubMenu("Voicelines")

	for k, v in SortedPairs(voicelines) do
		parent:AddOption(k, function()
			netstream.Send("PlayVoiceline", {
				Voiceline = k
			})
		end)
	end
end

function meta:CreateGestureContext(pnl)
	local gestures = self:GetActiveSpecies():GetGestures(self)

	if table.Count(gestures) < 1 then
		return
	end

	local parent = pnl:AddSubMenu("Gestures")

	parent:AddOption("Cancel", function()
		netstream.Send("CancelGesture")
	end)

	for k, v in SortedPairs(gestures) do
		if istable(v) then
			local sub = parent:AddSubMenu(v.Group)

			for name, anim in SortedPairs(v.Options) do
				sub:AddOption(name, function()
					netstream.Send("PlayGesture", {
						Submenu = k,
						Gesture = name
					})
				end)
			end
		else
			parent:AddOption(k, function()
				netstream.Send("PlayGesture", {
					Gesture = k
				})
			end)
		end
	end
end

function meta:CreateEntityContext(pnl)
	local ent = self:GetContextEntity()

	if not IsValid(ent) or ent == LocalPlayer() then
		return
	end

	local interact = ent:WithinInteractRange(self) and not self:Restrained()
	local options = ent:GetOptions(self, interact)

	pnl.SubMenuRegistry = {}

	for _, v in pairs(options) do
		if v.EditModeOnly then
			continue
		end

		local additive = pnl

		if v.SubMenu then
			pnl.SubMenuRegistry[v.SubMenu] = pnl.SubMenuRegistry[v.SubMenu] or pnl:AddSubMenu(v.SubMenu)

			additive = pnl.SubMenuRegistry[v.SubMenu]
		end

		additive:AddOption(v.Name, function()
			if v.Client then
				coroutine.WrapFunc(function()
					local val = v.Client()

					if val then
						netstream.Send("RunEntityFunction", {
							Ent = ent,
							Name = v.Name,
							Value = val
						})
					end
				end)
			else
				netstream.Send("RunEntityFunction", {
					Ent = ent,
					Name = v.Name
				})
			end
		end)
	end

	return edits
end

function meta:CreateAdminContext(pnl)
	if not self:IsAdmin() then
		return
	end

	local sub = pnl:AddSubMenu("Admin Utilities")
	local categories = {}

	for _, v in pairs(self:GetAdminOptions()) do
		local parent = sub

		if v.Category then
			if not categories[v.Category] then
				categories[v.Category] = sub:AddSubMenu(v.Category)
			end

			parent = categories[v.Category]
		end

		parent:AddOption(v.Name, function()
			if v.Client then
				coroutine.WrapFunc(function()
					local val = v.Client()

					if val then
						netstream.Send("RunAdminFunction", {
							Name = v.Name,
							Value = val
						})
					end
				end)
			else
				netstream.Send("RunAdminFunction", {
					Name = v.Name
				})
			end
		end)
	end

	local ent = self:GetContextEntity()

	if not IsValid(ent) or ent == LocalPlayer() or not self:IsInEditMode() then
		return
	end

	local interact = ent:WithinInteractRange(self) and not self:Restrained()
	local options = ent:GetOptions(self, interact)

	local editor = pnl:AddSubMenu("Entity Editor")

	for _, v in pairs(options) do
		if not v.EditModeOnly then
			continue
		end

		editor:AddOption(v.Name, function()
			if v.Client then
				coroutine.WrapFunc(function()
					local val = v.Client()

					if val then
						netstream.Send("RunEntityFunction", {
							Ent = ent,
							Name = v.Name,
							Value = val
						})
					end
				end)
			else
				netstream.Send("RunEntityFunction", {
					Ent = ent,
					Name = v.Name
				})
			end
		end)
	end
end

function meta:CreateScoreboardContext(target)
	if not self:IsAdmin() then
		return
	end

	local dmenu = EternityDermaMenu()

	for _, v in pairs(GAMEMODE:GetConfig("ScoreboardCommands")) do
		dmenu:AddOption(v[1], function()
			gui.EnableScreenClicker(false)

			if not IsValid(target) then
				return
			end

			local cmd = isstring(v[2]) and v[2] or v[2](target)

			RunConsoleCommand(cmd, target:SteamID())
		end)
	end

	dmenu:Open()
end
