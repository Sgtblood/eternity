ITEM = class.Create("base_deployable")

ITEM.Name        = "Combine APC"
ITEM.Description = "A key belonging to a dangerous APC."

ITEM.Model       = Model("models/sentry/monolithkey.mdl")
ITEM.ItemGroup   = "Vehicle"

ITEM.DeployText  = "Deploy"
ITEM.ReturnText  = "Return"
ITEM.ClassName   = "sim_fphys_combineapc_armed"

ITEM.Width       = 1
ITEM.Height      = 1 

return ITEM
