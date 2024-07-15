ITEM = class.Create("base_deployable")

ITEM.Name        = "Combine Prison Transport"
ITEM.Description = "A key belonging to a Combine-Transport."

ITEM.Model       = Model("models/sentry/monolithkey.mdl")
ITEM.ItemGroup   = "Vehicle"

ITEM.DeployText  = "Deploy"
ITEM.ReturnText  = "Return"
ITEM.ClassName   = "ctv_hla_prisoner_transport"

ITEM.Width       = 1
ITEM.Height      = 1 

return ITEM
