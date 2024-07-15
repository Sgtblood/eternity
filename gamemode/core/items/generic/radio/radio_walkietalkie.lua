ITEM = class.Create("base_radio")

ITEM.Name 					= "Walkie-Talkie"
ITEM.Description 			= "A handheld radio designed to work on common, local frequencies."

ITEM.Model					= Model("models/stunsticks/items/radio.mdl")

ITEM.OutlineColor 			= Color(127, 159, 255)

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 200
ITEM.SellPrice          = 50

ITEM.ChannelCount 			= 1
ITEM.CanEncrypt 			= false

return ITEM
