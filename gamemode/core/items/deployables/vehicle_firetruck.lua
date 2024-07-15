ITEM = class.Create("base_deployable")

ITEM.Name        = "ZIL-131"
ITEM.Description = "A key belonging to a Soviet-era Firetruck."

ITEM.Model       = Model("models/sentry/monolithkey.mdl")
ITEM.ItemGroup   = "Vehicle"

ITEM.DeployText  = "Deploy"
ITEM.ReturnText  = "Return"
ITEM.ClassName   = "sim_fphys_stalkerzilfire"

ITEM.Width       = 1
ITEM.Height      = 1 

return ITEM
