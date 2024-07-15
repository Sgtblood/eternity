local PANEL = {}

function PANEL:Init()
	self.MusicOptions = self:Add("eternity_panel")
	self.MusicOptions:Dock(LEFT)
	self.MusicOptions:SetWide(790)
	self.MusicOptions:SetTall(300)

	self.MusicOptions.Title = self.MusicOptions:Add("eternity_label")
	self.MusicOptions.Title:DockMargin(5, 0, 5, 0)
	self.MusicOptions.Title:Dock(TOP)
	self.MusicOptions.Title:SetWide(500)
	self.MusicOptions.Title:SetTall(20)
	self.MusicOptions.Title:SetFont("eternity.labelmediumbold")
	self.MusicOptions.Title:SetText("In-Game Music Presets")

	self.MusicOptions.Types = {
		[SONG_IDLE] = "Idle",
		[SONG_ALERT] = "Alert",
		[SONG_ACTION] = "Action",
		[SONG_STINGER] =  "Stinger"
	}

	self.MusicOptions.Right = self.MusicOptions:Add("eternity_panel")
	self.MusicOptions.Right:SetWide(160)
	self.MusicOptions.Right:DockMargin(5, 0, 0, 0)
	self.MusicOptions.Right:Dock(RIGHT)

	for k,v in SortedPairs(self.MusicOptions.Types) do
		local music = self:GetMusicForType(k)
		local button = self.MusicOptions.Right:Add("eternity_button")

		button:DockMargin(0, #self.MusicOptions.Right:GetChildren() == 1 and 0 or 5, 0, 0)
		button:Dock(TOP)
		button:SetText(string.format("Select Random %s", v))
		button:SetDisabled(#music == 0)

		button.DoClick = function(pnl)
			self.MusicOptions.FileText:SetText(table.Random(music))
		end
	end

	self.MusicOptions.Right.StopAll = self.MusicOptions.Right:Add("eternity_button")
	self.MusicOptions.Right.StopAll:DockMargin(0, 0, 0, 0)
	self.MusicOptions.Right.StopAll:Dock(BOTTOM)
	self.MusicOptions.Right.StopAll:SetTall(53)
	self.MusicOptions.Right.StopAll:SetText("Force Stopsound")
	self.MusicOptions.Right.StopAll.DoClick = function(pnl)
		RunConsoleCommand("rpa_stopsound")
	end

	self.MusicOptions.List = self.MusicOptions:Add("eternity_listview")
	self.MusicOptions.List:Dock(TOP)
	self.MusicOptions.List:SetWide(500)
	self.MusicOptions.List:SetTall(305)
	self.MusicOptions.List:SetMultiSelect(false)
	self.MusicOptions.List:AddColumn("Type"):SetWidth(50)
	self.MusicOptions.List:AddColumn("Duration"):SetWidth(60)
	self.MusicOptions.List:AddColumn("Title"):SetWidth(395)
	self.MusicOptions.List.OnRowSelected = function(pnl, index, row)
		self.MusicOptions.FileText:SetText(row.File)
	end

	for k,v in pairs(GAMEMODE:GetConfig("ServerMusic")) do
		self.MusicOptions.List:AddLine(self:ServerMusicType(v[3]), string.ToMinutesSeconds(v[2]), v[4]).File = v[1]
	end

	self.MusicOptions.FileLabel = self.MusicOptions:Add("eternity_label")
	self.MusicOptions.FileLabel:DockMargin(5, 10, 5, 0)
	self.MusicOptions.FileLabel:Dock(TOP)
	self.MusicOptions.FileLabel:SetWide(500)
	self.MusicOptions.FileLabel:SetTall(20)
	self.MusicOptions.FileLabel:SetFont("eternity.labelmediumbold")
	self.MusicOptions.FileLabel:SetText("In-Game File or Custom URL")

	self.MusicOptions.FileText = self.MusicOptions:Add("eternity_textentry")
	self.MusicOptions.FileText:Dock(TOP)
	self.MusicOptions.FileText:SetWide(500)
	self.MusicOptions.FileText:SetTall(20)

	self.MusicOptions.ButtonsPlay = self.MusicOptions:Add("eternity_panel")
	self.MusicOptions.ButtonsPlay:DockMargin(0, 10, 0, 0)
	self.MusicOptions.ButtonsPlay:Dock(TOP)
	self.MusicOptions.ButtonsPlay:SetWide(650)

	self.MusicOptions.ButtonsStop = self.MusicOptions:Add("eternity_panel")
	self.MusicOptions.ButtonsStop:DockMargin(0, 5, 0, 0)
	self.MusicOptions.ButtonsStop:Dock(TOP)
	self.MusicOptions.ButtonsStop:SetWide(650)

	local MusicOptions = { 
		{ "Play Preview", "rpa_playpreview", nil,            nil },
		{ "Play Music",   "rpa_playmusic",   "Stop Music",   "rpa_stopmusic" },
		{ "Play Effect",  "rpa_playeffect",  "Stop Effect",  "rpa_stopeffect" }
	}

	for k,v in pairs(MusicOptions) do
		local w = (self.MusicOptions.ButtonsPlay:GetSize() - 1) - (#MusicOptions * 10)
		local width = w / #MusicOptions

		if v[1] then
			local buttonPlay = self.MusicOptions.ButtonsPlay:Add("eternity_button")
			buttonPlay:DockMargin(0, 0, 5, 0)
			buttonPlay:Dock(LEFT)
			buttonPlay:SetWide(width)
			buttonPlay:SetText(v[1])
			buttonPlay.DoClick = function(pnl)
				local text = string.Trim(self.MusicOptions.FileText:GetText())

				if string.len(text) == 0 then
					return
				end

				RunConsoleCommand(v[2], self.MusicOptions.FileText:GetText())
			end
		else
			local empty = self.MusicOptions.ButtonsPlay:Add("eternity_label")
			empty:DockMargin(0, 0, 5, 0)
			empty:Dock(LEFT)
			empty:SetWide(width)
			empty:SetText("")
		end

		if v[3] then
			local buttomStop = self.MusicOptions.ButtonsStop:Add("eternity_button")
			buttomStop:DockMargin(0, 0, 5, 0)
			buttomStop:Dock(LEFT)
			buttomStop:SetWide(width)
			buttomStop:SetText(v[3])
			buttomStop.DoClick = function(pnl)
				RunConsoleCommand(v[4])
			end
		else
			local empty = self.MusicOptions.ButtonsStop:Add("eternity_label")
			empty:DockMargin(0, 0, 5, 0)
			empty:Dock(LEFT)
			empty:SetWide(width)
			empty:SetText("")
		end
	end
end

function PANEL:GetMusicForType(enum)
	local music = GAMEMODE:GetConfig("ServerMusic")
	local valid = {}

	for k,v in pairs(music) do
		if v[3] ~= enum then
			continue
		end

		table.insert(valid, v[1])
	end

	return valid
end

function PANEL:ServerMusicType(enum)
	return self.MusicOptions.Types[enum] or "None"
end

vgui.Register("eternity_admin_musicpanel", PANEL, "eternity_panel")