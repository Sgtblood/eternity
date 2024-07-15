ITEM = class.Create("base_deployable")

ITEM.Name        = "UAZ469"
ITEM.Description = "A key belonging to an off-road military light utility vehicle manufactured since 1971."

ITEM.Model       = Model("models/sentry/monolithkey.mdl")
ITEM.ItemGroup   = "Vehicle"

ITEM.DeployText  = "Deploy"
ITEM.ReturnText  = "Return"
ITEM.ClassName   = "sim_fphys_UAZ1"

ITEM.Width       = 1
ITEM.Height      = 1 

return ITEM
