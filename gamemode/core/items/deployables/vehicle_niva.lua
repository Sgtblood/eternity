ITEM = class.Create("base_deployable")

ITEM.Name        = "Lada Niva"
ITEM.Description = "A key belonging to a Soviet-era off-road car. It's actually decent for once."

ITEM.Model       = Model("models/sentry/monolithkey.mdl")
ITEM.ItemGroup   = "Vehicle"

ITEM.DeployText  = "Deploy"
ITEM.ReturnText  = "Return"
ITEM.ClassName   = "sim_fphys_hlalyxniva"

ITEM.Width       = 1
ITEM.Height      = 1 

return ITEM
