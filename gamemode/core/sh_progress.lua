local meta = FindMetaTable("Player")

if CLIENT then
	netstream.Hook("StartProgress", function(data)
		GAMEMODE.Progress = data
		GAMEMODE.Progress.StartTime = CurTime()
	end)

	netstream.Hook("StopProgress", function(data)
		GAMEMODE.Progress = nil
	end)
end

if SERVER then
	local function validate(ply, val)
		if IsEntity(val) then
			if not IsValid(val) then
				return false
			end

			if val:GetVelocity():Length() > 4 then
				return false
			end

			if not val:WithinInteractRange(ply) then
				return false
			end
		elseif istable(val) and val:IsTypeOf("base_replicated") then
			if not class.Networked[val.NetworkGroup][val.NetworkID] then -- Destroyed
				return false
			end

			if val:IsTypeOf("base_item") and not val:CanInteract(ply) then
				return false
			end
		end

		return true
	end

	local function stop(ply, tab)
		netstream.Send("StopProgress", {}, ply)

		if tab.Notify then
			netstream.Send("StopProgress", {}, tab.Notify)
		end

		if tab.Coroutine then
			coroutine.resume(tab.Coroutine, false)
		else
			tab.Callback(false)
		end

		ply.Progress = nil
	end

	function meta:WaitFor(time, text, validation, notifytext, notify, cb)
		local cr = nil

		if not cb then
			cr = coroutine.running()

			if not cr then
				error("WaitFor has to be ran inside of a coroutine when not provided a callback!")
			end
		end

		validation = validation or {}

		table.insert(validation, self)

		self.Progress = {
			EndTime = CurTime() + time,
			Coroutine = cr,
			Callback = cb,
			Validation = validation,
			Pos = self:GetPos(),
			Notify = notify
		}

		netstream.Send("StartProgress", {
			EndTime = self.Progress.EndTime,
			Text = text or "PLACEHOLDER"
		}, self)

		if notify then
			netstream.Send("StartProgress", {
				EndTime = self.Progress.EndTime,
				Text = notifytext
			}, notify)
		end

		if not cb then
			return coroutine.yield()
		end
	end

	hook.Add("PlayerThink", "progress.PlayerThink", function(ply)
		local tab = ply.Progress

		if not tab then
			return
		end

		if not ply:Alive() then
			stop(ply, tab)
		end

		if ply:GetPos():Distance(tab.Pos) > 2 then
			stop(ply, tab)

			return
		end

		for _, v in pairs(tab.Validation) do
			if not validate(ply, v) then
				stop(ply, tab)

				return
			end
		end

		if CurTime() >= tab.EndTime then
			if tab.Coroutine then
				coroutine.resume(tab.Coroutine, true)
			else
				ply.Progress = nil
				tab.Callback(true)
			end
		end
	end)
end