GM.RequisitionableItems = {
	[COMBINE_GEARBOX_LOWRISK] = {
		"clothing_backpack_combine",
		"generic_zipties",
		"radio_cityadmin",
	},
	[COMBINE_GEARBOX_POLICE] = {
		"clothing_backpack_combine",
		"generic_zipties",
		"med_cmb_injector",
		"weapon_throwable_smoke",
		"attachment_ub_laser",
		"attachment_si_eotech",
		"attachment_si_2xrds",
	},
	[COMBINE_GEARBOX_COMMAND] = {
		"clothing_backpack_combine",
		"generic_zipties",
		"radio_metropolice",
		"med_cmb_injector",
		"med_cmb_gelkit",
		"generic_combinelock",
		"weapon_melee_stunstick",
		"weapon_firearm_usp",
		"weapon_firearm_mp7",
		"weapon_firearm_spas12",
		"weapon_throwable_concussion",
		"weapon_throwable_flashbang",
		"weapon_throwable_smoke",
		"weapon_throwable_signal_green",
		"weapon_throwable_signal_blue",
		"weapon_throwable_signal_red",
		"weapon_throwable_csgas",
		"attachment_ub_laser",
		"attachment_si_eotech",
		"attachment_si_2xrds",
	},
	[COMBINE_GEARBOX_INTELLIGENCE] = {
		"clothing_backpack_combine",
		"generic_zipties",
		"radio_intelligence",
		"med_cmb_injector",
		"med_cmb_gelkit",
		"generic_combinelock",
		"weapon_melee_stunstick",
		"weapon_firearm_glock17",
		"weapon_firearm_mp7",
		"weapon_throwable_concussion",
		"weapon_throwable_flashbang",
		"weapon_throwable_smoke",
		"weapon_throwable_signal_green",
		"weapon_throwable_signal_blue",
		"weapon_throwable_signal_red",
		"weapon_throwable_csgas",
		"attachment_ub_laser",
		"attachment_si_eotech",
		"attachment_si_2xrds",
	},
	[COMBINE_GEARBOX_COTA] = {
		"soldier_infantry",
		"soldier_mopp",
		"med_cmb_injector",
		"med_cmb_gelkit",
		"weapon_throwable_smoke",
		"weapon_melee_knife",
		"weapon_pulse_pdw",
		"weapon_pulse_ar2",
		"radio_overwatch",
		"generic_zipties",
		"attachment_ub_laser",
		"attachment_si_eotech",
		"attachment_si_2xrds",
	}
}

function GM:GetPlayerRequisitionItems(ply)
	for k, v in pairs(self.RequisitionableItems) do
		if ply:HasCombinePermission(k) then
			return v
		end
	end

	return {}
end

if SERVER then
	netstream.Hook("RequestCombineArmoryItem", function(ply, data)
		local class = data.Class

		local allowed = GAMEMODE:GetPlayerRequisitionItems(ply)

		if table.HasValue(allowed, class) then
			ply:GiveItem(class, 1, false, function(instance)
				GAMEMODE:WriteLog("combine_requisition", {
					Char = GAMEMODE:LogCharacter(ply),
					Item = GAMEMODE:LogItem(instance)
				})

				return instance
			end)

			ply:EmitSound("items/ammo_pickup.wav")
		end
	end)
end
