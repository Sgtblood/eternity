ITEM = class.Create("base_ration")

ITEM.Name 				= "Combine Civil Authority Ration Package"
ITEM.Description 		= "A small package containing various goods for the Enforcers of the brutal regime."

ITEM.Model 				= Model("models/uu_branded/weapons/w_packatm.mdl")
ITEM.Color         = Color(127, 255, 159)

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.ItemGroup 			= "Ration"

ITEM.StoreBlock			= STOREBLOCK_INVENTORY
ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

-- 300 Total Hunger
ITEM.Contents 			= {
    "food_smallbread",
    "food_crackers",
    "food_breenwater"
}

ITEM.Money 				= 100

return ITEM
