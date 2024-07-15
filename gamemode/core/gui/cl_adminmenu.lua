local PANEL = {}

function PANEL:Init()
	self:SetSize(800, 500)

	self:SetToggleKey("gm_showspare2")
	self:SetAllowEscape(true)

	self:AddMenu("Server")
	self:AddMenu("Ambience")
	self:AddMenu("Logs")

	self:SetupTopbar()

	self:MakePopup()
	self:Center()

	self.MenuItems[1]:DoClick()
end

function PANEL:Think()
	if self.OOCLabel.Current then
		local delay = GAMEMODE:OOCDelay()

		if delay == -1 then
			self.OOCLabel.Current:SetText("[disabled]")
		elseif delay == 0 then
			self.OOCLabel.Current:SetText("[no delay]")
		else
			self.OOCLabel.Current:SetText(string.format("[%s]", string.NiceTime(delay)))
		end
	end

	if self.GlobalEmotes.Current then
		if GAMEMODE:EnableGlobalEmotes() then
			self.GlobalEmotes.Current:SetText("[enabled]")
		else
			self.GlobalEmotes.Current:SetText("[disabled]")
		end
	end
end

function PANEL:CreateServer()
	self.OOCLabel = self.Content:Add("eternity_panel")

	self.OOCLabel:DockMargin(0, 5, 0, 0)
	self.OOCLabel:Dock(TOP)
	self.OOCLabel:SetTall(22)

	self.OOCLabel.Title = self.OOCLabel:Add("eternity_label")

	self.OOCLabel.Title:DockMargin(5, 0, 5, 0)
	self.OOCLabel.Title:Dock(LEFT)
	self.OOCLabel.Title:SetWide(70)
	self.OOCLabel.Title:SetFont("eternity.labelmediumbold")
	self.OOCLabel.Title:SetText("OOC Delay")

	self.OOCLabel.Current = self.OOCLabel:Add("eternity_label")

	self.OOCLabel.Current:DockMargin(0, 0, 5, 0)
	self.OOCLabel.Current:Dock(LEFT)
	self.OOCLabel.Current:SetWide(75)
	self.OOCLabel.Current:SetFont("eternity.labelsmall")

	local delay = GAMEMODE:OOCDelay()

	if delay == -1 then
		self.OOCLabel.Current:SetText("[disabled]")
	elseif delay == 0 then
		self.OOCLabel.Current:SetText("[no delay]")
	else
		self.OOCLabel.Current:SetText(string.format("[%s]", string.NiceTime(delay)))
	end

	local function AddOOCDelay(title, time)
		local button = self.OOCLabel:Add("eternity_button")

		button:DockMargin(0, 0, 5, 0)
		button:Dock(LEFT)
		button:SetWide(90)
		button:SetText(title)

		button.DoClick = function(pnl)
			RunConsoleCommand("rpa_oocdelay", time)
		end
	end

	AddOOCDelay("OOC Disabled", "-1")
	AddOOCDelay("No Delay", "0")
	AddOOCDelay("One Minute", "60")
	AddOOCDelay("Five Minutes", "300")
	AddOOCDelay("Ten Minutes", "600")
	AddOOCDelay("One Hour", "3600")

	self.VFireLabel = self.Content:Add("eternity_panel")

	self.VFireLabel:DockMargin(0, 15, 0, 0)
	self.VFireLabel:Dock(TOP)
	self.VFireLabel:SetTall(22)

	self.VFireLabel.Title = self.VFireLabel:Add("eternity_label")

	self.VFireLabel.Title:DockMargin(5, 0, 5, 0)
	self.VFireLabel.Title:Dock(LEFT)
	self.VFireLabel.Title:SetWide(90)
	self.VFireLabel.Title:SetFont("eternity.labelmediumbold")
	self.VFireLabel.Title:SetText("VFire Controls")

	local VFireRemove = self.VFireLabel:Add("eternity_button")

	VFireRemove:DockMargin(0, 0, 5, 0)
	VFireRemove:Dock(LEFT)
	VFireRemove:SetWide(90)
	VFireRemove:SetText("Remove Fires")

	VFireRemove.DoClick = function(pnl)
		RunConsoleCommand("vfire_remove_all")
	end

	self.GlobalEmotes = self.Content:Add("eternity_panel")

	self.GlobalEmotes:DockMargin(0, 15, 0, 0)
	self.GlobalEmotes:Dock(TOP)
	self.GlobalEmotes:SetTall(22)

	self.GlobalEmotes.Title = self.GlobalEmotes:Add("eternity_label")

	self.GlobalEmotes.Title:DockMargin(5, 0, 5, 0)
	self.GlobalEmotes.Title:Dock(LEFT)
	self.GlobalEmotes.Title:SetWide(90)
	self.GlobalEmotes.Title:SetFont("eternity.labelmediumbold")
	self.GlobalEmotes.Title:SetText("Global Emotes")

	self.GlobalEmotes.Current = self.GlobalEmotes:Add("eternity_label")

	self.GlobalEmotes.Current:DockMargin(0, 0, 5, 0)
	self.GlobalEmotes.Current:Dock(LEFT)
	self.GlobalEmotes.Current:SetWide(75)
	self.GlobalEmotes.Current:SetFont("eternity.labelsmall")

	if GAMEMODE:EnableGlobalEmotes() then
		self.GlobalEmotes.Current:SetText("[enabled]")
	else
		self.GlobalEmotes.Current:SetText("[disabled]")
	end

	local function AddGlobalEmotes(title, bool)
		local button = self.GlobalEmotes:Add("eternity_button")

		button:DockMargin(0, 0, 5, 0)
		button:Dock(LEFT)
		button:SetWide(90)
		button:SetText(title)

		button.DoClick = function(pnl)
			RunConsoleCommand("rpa_enableglobalemotes", bool)
		end
	end

	AddGlobalEmotes("Disable", "false")
	AddGlobalEmotes("Enable",  "true")
end

function PANEL:CreateAmbience()
	self.Ambience = self.Content:Add("eternity_admin_musicpanel")
	self.Ambience:Dock(FILL)
end

function PANEL:CreateLogs()
	self.Logs = self.Content:Add("eternity_admin_logpanel")
	self.Logs:Dock(FILL)
end

vgui.Register("eternity_adminmenu", PANEL, "eternity_basemenu")

GM:RegisterGUI("AdminMenu", function()
	return vgui.Create("eternity_adminmenu")
end, true)