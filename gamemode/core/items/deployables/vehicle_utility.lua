ITEM = class.Create("base_deployable")

ITEM.Name        = "Utility Truck"
ITEM.Description = "A key belonging to a Utility Truck."

ITEM.Model       = Model("models/sentry/monolithkey.mdl")
ITEM.ItemGroup   = "Vehicle"

ITEM.DeployText  = "Deploy"
ITEM.ReturnText  = "Return"
ITEM.ClassName   = "sim_fphys_l4d_utility_truck"

ITEM.Width       = 1
ITEM.Height      = 1 

return ITEM
