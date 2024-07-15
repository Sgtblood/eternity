local PANEL = {}

function PANEL:Init()
	self:SetSize(300, 400)
	self:DockPadding(10, 10, 10, 10)

	self:SetAllowEscape(true)

	self:SetDrawTopBar(true)
	self:SetTitle("Breaker Box")

	local bottom1 = self:Add("eternity_panel")

	bottom1:DockMargin(0, 5, 0, 0)
	bottom1:Dock(BOTTOM)
	bottom1:SetTall(22)

	self.Refresh = bottom1:Add("eternity_button")
	self.Refresh:Dock(LEFT)
	self.Refresh:SetWide(100)
	self.Refresh:SetText("Refresh")

	self.Refresh.DoClick = function()
		self:Populate()
	end

	self.View = bottom1:Add("eternity_button")
	self.View:Dock(RIGHT)
	self.View:SetWide(100)
	self.View:SetText("Flip")

	self.View.DoClick = function()
		netstream.Send("DisableElectricity", {
			Ent = self.Target
		})

		self:Remove()
	end

	self.View:SetDisabled(true)

	self.List = self:Add("eternity_listview")
	self.List:Dock(FILL)

	self.List:SetMultiSelect(false)

	self.List:AddColumn("State"):SetFixedWidth(75)
	self.List:AddColumn("Name")

	self.List.OnRowSelected = function(pnl, index, row)
		self.Target = row.Ent

		self.View:SetDisabled(false)
	end

	self.List.DoDoubleClick = function(pnl, index, row)
		self.Target = row.Ent

		self.View:SetDisabled(false)
		self.View:DoClick()
	end

	self:MakePopup()
	self:Center()

	self:Populate()
end

function PANEL:Populate()
	self.View:SetDisabled(true)
	self.List:Clear()

	local zone = {}

	if (LocalPlayer():HasCombinePermission(COMBINE_SURVEILANCE_UNITS) or LocalPlayer():HasItem("generic_emp_device")) then
		for _, v in pairs(player.GetAll()) do
			if not v:IsCameraTarget(LocalPlayer()) then
				continue
			end

			units[v:ZoneName()] = v
		end
	end

	if (LocalPlayer():HasCombinePermission(COMBINE_SURVEILANCE_BASIC) or LocalPlayer():HasItem("generic_emp_device")) then
		for _, v in pairs(ents.FindByClass("ent_camera")) do
			if not v:IsReady() then
				continue
			end

			cameras[v:ZoneName()] = v
		end

		for _, v in pairs(ents.FindByClass("npc_combine_camera")) do
			npcs[v:ZoneName()] = v
		end
	end

	for k, v in SortedPairs(zone) do
		self.List:AddLine("Active", k).Ent = v
	end

	for k, v in SortedPairs(zoned) do
		self.List:AddLine("Disabled", k).Ent = v
	end
end


vgui.Register("eternity_breakerbox", PANEL, "eternity_basepanel")

GM:RegisterGUI("BreakerBox", function()
	return vgui.Create("eternity_breakerbox")
end, true)