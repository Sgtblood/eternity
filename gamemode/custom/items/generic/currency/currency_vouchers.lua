ITEM = class.Create("base_stacking")

ITEM.SingularName 		= "%s Ration Voucher"
ITEM.PluralName 		= "%s Ration Vouchers"

ITEM.Description 		= "Your ticket to skipping the waiting line at the ration dispenser."

ITEM.Model 				= Model("models/willardnetworks/props/rationcoupon.mdl")

ITEM.ItemGroup 			= "Currency"

ITEM.MaxStack 			= 10

return ITEM 