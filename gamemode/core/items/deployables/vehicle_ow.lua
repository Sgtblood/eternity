ITEM = class.Create("base_deployable")

ITEM.Name        = "Troop-Transport APC"
ITEM.Description = "A key belonging to a relatively heavy armored APC. It's sturdy and durable."

ITEM.Model       = Model("models/sentry/monolithkey.mdl")
ITEM.ItemGroup   = "Vehicle"

ITEM.DeployText  = "Deploy"
ITEM.ReturnText  = "Return"
ITEM.ClassName   = "sim_fphys_l4d_apc"

ITEM.Width       = 1
ITEM.Height      = 1 

return ITEM
