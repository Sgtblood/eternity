local PANEL = {}

function PANEL:Init()
	self:SetSize(600, 400)
	self:DockPadding(10, 10, 10, 10)

	self:SetAllowEscape(true)

	self:SetDrawTopBar(true)
	self:SetTitle("Purchasable Door Access")

  local submission = self:Add("eternity_panel")

	submission:DockMargin(0, 5, 0, 0)
	submission:Dock(BOTTOM)
	submission:SetTall(22)

	local controls = self:Add("eternity_panel")

	controls:DockMargin(0, 5, 0, 0)
	controls:Dock(BOTTOM)
	controls:SetTall(22)

  local right = self:Add("eternity_panel")
	right:Dock(RIGHT)
	right:SetWide(280)

  local left = self:Add("eternity_panel")
	left:Dock(LEFT)
	left:SetWide(280)

  self.SelectedCharacterRow = nil

  self.HasAccessList = right:Add("eternity_listview")
	self.HasAccessList:Dock(FILL)
	self.HasAccessList:SetMultiSelect(false)
	self.HasAccessList:AddColumn("Provided Lock Controls")

  self.HasAccessList.OnRowSelected = function(pnl, index, row)
		self.SelectedHasAccessListRow = row
    self.SelectedHasAccessListRowIndex = index

    self.RevokeAccess:SetDisabled(false)
	end

	self.NoAccessList = left:Add("eternity_listview")
	self.NoAccessList:Dock(FILL)
	self.NoAccessList:SetMultiSelect(false)
	self.NoAccessList:AddColumn("Restricted Lock Controls")

  self.NoAccessList.OnRowSelected = function(pnl, index, row)
		self.SelectedNoAccessListRow = row
    self.SelectedNoAccessListRowIndex = index

    self.GrantAccess:SetDisabled(false)
	end

  self.GrantAccess = controls:Add("eternity_button")
	self.GrantAccess:Dock(LEFT)
	self.GrantAccess:SetWide(280)
	self.GrantAccess:SetText("Grant Door Access")

	self.GrantAccess.DoClick = function()
    local line = self.HasAccessList:AddLine(self.SelectedNoAccessListRow.RPName)
    line.CharID = self.SelectedNoAccessListRow.CharID
    line.RPName = self.SelectedNoAccessListRow.RPName

    self.NoAccessList:RemoveLine(self.SelectedNoAccessListRowIndex)
    self.Internal.AccessList[line.CharID] = {
      CharID = line.CharID,
      RPName = line.RPName
    }

    self.SelectedNoAccessListRow = nil
    self.SelectedNoAccessListRowIndex = nil

    self.GrantAccess:SetDisabled(true)
	end

	self.RevokeAccess = controls:Add("eternity_button")
	self.RevokeAccess:Dock(RIGHT)
	self.RevokeAccess:SetWide(280)
	self.RevokeAccess:SetText("Revoke Door Access")

	self.RevokeAccess.DoClick = function()
    local line = self.NoAccessList:AddLine(self.SelectedHasAccessListRow.RPName)
    line.CharID = self.SelectedHasAccessListRow.CharID
    line.RPName = self.SelectedHasAccessListRow.RPName

    self.HasAccessList:RemoveLine(self.SelectedHasAccessListRowIndex)
    self.Internal.AccessList[line.CharID] = nil

    self.SelectedHasAccessListRow = nil
    self.SelectedHasAccessListRowIndex = nil

    self.RevokeAccess:SetDisabled(true)
	end

  self.Submit = submission:Add("eternity_button")
	self.Submit:Dock(RIGHT)
	self.Submit:SetText("Save Configuration")
  self.Submit:SetWide(110)
	self.Submit.DoClick = function()
		self:DoSubmit()
	end

  self.Refresh = submission:Add("eternity_button")
	self.Refresh:Dock(LEFT)
	self.Refresh:SetText("Refresh Character Listing")
  self.Refresh:SetWide(140)
	self.Refresh.DoClick = function()
		self:Populate()
	end
end

function PANEL:Populate()
  self.HasAccessList:Clear()
  self.NoAccessList:Clear()

  self.SelectedHasAccessListRow = nil
  self.SelectedHasAccessListRowIndex = nil
  self.SelectedNoAccessListRow = nil
  self.SelectedNoAccessListRowIndex = nil

  self.RevokeAccess:SetDisabled(true)
  self.GrantAccess:SetDisabled(true)

	local characters = {}

	for _,v in pairs(player.GetAll()) do
		if not v:HasCharacter() then
			continue
		end

    if v == LocalPlayer() then
      continue
    end

    if not v:CanSeeOnScoreboard() then
      continue
    end

    local name = v:RPName()
    local id = v:CharID()

    if not self.Internal.AccessList[id] then
      local line = self.NoAccessList:AddLine(name)
      line.CharID = id
      line.RPName = name
    else
      self.Internal.AccessList[id].RPName = name
    end
	end

	for k, v in pairs(self.Internal.AccessList) do
    local line = self.HasAccessList:AddLine(v.RPName)
    line.CharID = v.CharID
    line.RPName = v.RPName
	end
end

function PANEL:Setup(data)
  self.Internal = { }
  self.Internal.DoorEntity = data.Door
  self.Internal.AccessList = table.Copy(data.Door:DoorAccessList())

  self:Populate()

  self.Coroutine = coroutine.running()
end

function PANEL:DoSubmit()
	local val = self.Internal.AccessList

	self:Remove()

	local ok, res = coroutine.resume(self.Coroutine, val)

	if not ok then
		error(res)
		return
	end
end

vgui.Register("eternity_dooraccess", PANEL, "eternity_basepanel")

GM:RegisterGUI("DoorAccess", function(data)
	local pnl = vgui.Create("eternity_dooraccess")
	
  pnl:Setup(data)
	pnl:MakePopup()
	pnl:Center()

	return coroutine.yield()
end)