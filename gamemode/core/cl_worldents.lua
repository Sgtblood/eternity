local menu_base_classes = {
  ["ent_worldent"] = true,
  ["ent_zone"] = true,
  ["ent_baseportal"] = true,
  ["ent_picker"] = true
}

hook.Add("PopulateEternityEntities", "CL.worldents.PopulateEternityEntities", function(pnlContent, tree, node)
  local categorized = {}

  for k, entity in pairs(scripted_ents.GetList()) do
    if not menu_base_classes[entity.Base] then
      continue
    end

    local group = entity.t.Category

    if not group then
      group = "Uncategorized"
    end
 
    if not categorized[group] then
      categorized[group] = {}
    end

    table.insert(categorized[group], entity.t)
  end  

  for category, entities in SortedPairs(categorized) do
    local node = tree:AddNode(category, "icon16/book.png")

    node.DoPopulate = function(listing)
      if listing.PropPanel then
        return
      end

      listing.PropPanel = vgui.Create("ContentContainer", pnlContent)
      listing.PropPanel:SetVisible(false)
      listing.PropPanel:SetTriggerSpawnlistChange(false)

      for _, entity in SortedPairsByMemberValue(entities, "PrintName") do
        spawnmenu.CreateContentIcon("EternityEntityContentType", listing.PropPanel, {
          nicename = entity.PrintName,
          spawnname = entity.ClassName
        })
      end
    end

    node.DoClick = function(listing)
      listing:DoPopulate()
      pnlContent:SwitchPanel(listing.PropPanel)
    end
  end
end)

spawnmenu.AddCreationTab("Eternity", function()
  local ctrl = vgui.Create("SpawnmenuContentPanel")
  ctrl:CallPopulateHook("PopulateEternityEntities")

  return ctrl
end, "icon16/book_addresses.png", 25)

spawnmenu.AddContentType("EternityEntityContentType", function(container, obj)
  if not obj.nicename then return end
  if not obj.spawnname then return end

  local icon = vgui.Create("ContentIcon", container)
  icon:SetContentType("EternityEntityContentType")
  
  icon:SetSpawnName(obj.spawnname)
  icon:SetName(obj.nicename)
  icon:SetAdminOnly(true)
  icon:SetColor(Color(0, 0, 0, 255))

  icon.DoClick = function()
    RunConsoleCommand("gm_spawnsent", obj.spawnname)
    surface.PlaySound("ui/buttonclickrelease.wav")
  end

  icon.OpenMenu = function()
    local menu = DermaMenu()

    menu:AddOption("#spawnmenu.menu.copy", function() 
      SetClipboardText(obj.spawnname) 
    end):SetIcon("icon16/page_copy.png")

    menu:AddOption("#spawnmenu.menu.spawn_with_toolgun", function() 
      RunConsoleCommand("gmod_tool", "creator") 
      RunConsoleCommand("creator_type", "0") 
      RunConsoleCommand("creator_name", obj.spawnname) 
    end):SetIcon("icon16/brick_add.png")

    menu:Open()
  end
  
  if IsValid(container) then
    container:Add(icon)
  end

  return icon
end)