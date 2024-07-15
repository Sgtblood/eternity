ITEM = class.Create("base_deployable")

ITEM.Name        = "Kamaz Tent"
ITEM.Description = "A key belonging to a Soviet-era truck."

ITEM.Model       = Model("models/sentry/monolithkey.mdl")
ITEM.ItemGroup   = "Vehicle"

ITEM.DeployText  = "Deploy"
ITEM.ReturnText  = "Return"
ITEM.ClassName   = "sim_fphys_stalkerkamaztent"

ITEM.Width       = 1
ITEM.Height      = 1 

return ITEM
