GM.Config.ServerName = "Wolfram HL2RP: Stories of City 34"

GM.Config.UIColors = {
	Border = Color(20, 20, 20),
	-- Fills
	FillLight = Color(60, 60, 60),
	FillMedium = Color(40, 40, 40),
	FillDark = Color(30, 30, 30),
	-- Primary color
	Primary = Color(150, 20, 20),
	PrimaryAlt = Color(100, 0, 0),
	PrimaryDark = Color(60, 0, 0),
	-- Text color
	TextNormal = Color(200, 200, 200),
	TextHover = Color(255, 255, 255),
	TextPrimary = Color(255, 0, 0),
	TextDisabled = Color(150, 150, 150),
	TextHighlight = Color(40, 40, 40),
	TextBad = Color(200, 0, 0),
	-- Other stuff
	MenuAlt = Color(50, 50, 50),
	MenuHovered = Color(70, 70, 70),
	TextEntry = Color(35, 35, 35),
	ItemDeny = Color(150, 20, 20),
	ItemAllow = Color(40, 150, 20),
}

GM.Config.PermaPropLimit = 1000

GM.Config.MaxCharacters = 20

GM.Config.MinNameLength = 3
GM.Config.MaxNameLength = 30

GM.Config.MaxDescLength 	= 2048

GM.Config.MaxPropDescLength = 255
GM.Config.MaxItemDescLength = 255

GM.Config.AllowedCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ áàâäçéèêëíìîïóòôöúùûüÿÁÀÂÄßÇÉÈÊËÍÌÎÏÓÒÔÖÚÙÛÜŸ.-0123456789'"
GM.Config.AllowedTitleCharacters = "\'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ áàâäçéèêëíìîïóòôöúùûüÿÁÀÂÄßÇÉÈÊËÍÌÎÏÓÒÔÖÚÙÛÜŸ.-0123456789'"

GM.Config.DefaultCurrency = "currency_credits"

-- Used for character creation and other character displays
GM.Config.IdleAnimations = {
	-- Half-Life 2 Models
	["models/vortigaunt.mdl"] = {Sequence = "idle01", Offset = Vector(0, 3, -10)},
	["models/vortigaunt_blue.mdl"] = {Sequence = "idle01", Offset = Vector(0, 3, -10)},
	["models/vortigaunt_doctor.mdl"] = {Sequence = "idle01", Offset = Vector(0, 3, -10)},
	["models/vortigaunt_slave.mdl"] = {Sequence = "idle01", Offset = Vector(0, 3, -10)},
	["models/antlion.mdl"] = {Sequence = "distractidle2", Offset = Vector(40, -10, -40)},
	["models/antlion_worker.mdl"] = {Sequence = "distractidle2", Offset = Vector(55, -10, -40)},
	["models/headcrabclassic.mdl"] = {Offset = Vector(0, 0, -55)},
	["models/headcrab.mdl"] = {Offset = Vector(10, 0, -50)},
	["models/headcrabblack.mdl"] = {Sequence = "idle01", Offset = Vector(0, 0, -55)},
	["models/zombie/fast.mdl"] = {Sequence = "idle", Offset = Vector(30, 0, -20)},
	["models/zombie/poison.mdl"] = {Sequence = "idle01", Offset = Vector(20, 0, -20)},
	["models/zombie/classic_torso.mdl"] = {Sequence = "idle02", Offset = Vector(0, 5, -50)},
	["models/Zombie/classic.mdl"] = {Sequence = "idle01", Offset = Vector(0, 0, 0)},
	["models/antlion_guard.mdl"] = {Sequence = "idle", Offset = Vector(200, -60, 10)},
	["models/hunter.mdl"] = {Sequence = "idle_2", Offset = Vector(100, -30, 15)},
	["models/combine_scanner.mdl"] = {Sequence = "idle", Offset = Vector(65, -20, -60)},
	["models/shield_scanner.mdl"] = {Sequence = "hoverclosed", Offset = Vector(65, -20, -60)},
	-- TnB Creatures Pack
	["models/tor.mdl"] = {Sequence = "idle", Offset = Vector(50, -20, 15)},
	["models/half-life/islave.mdl"] = {Offset = Vector(0, 0, 20)},
	["models/half-life/panthereye.mdl"] = {Offset = Vector(0, 0, 20)},
	["models/charger/charger.mdl"] = {Offset = Vector(90, -20, -8)},
	-- TnB Combine Pack
	["combine_heavy_hlvr_player.mdl"] = {Sequence = "idle_all_01", Offset = Vector(0, 0, 12)},
	["combine_suppressor_hlvr_player.mdl"] = {Sequence = "idle_all_01", Offset = Vector(0, 0, 8)},
	["combine_elite_soldier_redone.mdl"] = {Sequence = "idle_all_01", Offset = Vector(0, 0, 2)},
	["synth_soldier.mdl"] = {Sequence = "idle_all_01", Offset = Vector(35, -12.5, 12.5)},
} 

GM.Config.ItemRange = {
	Dist = 1000,
	AimDist = 50
}

GM.Config.PlayerLabel = {
	Fade = 0.05,
	Desc = 64
}

GM.Config.ItemIconSize = 48
GM.Config.ItemIconMargin = 2

GM.Config.ChatSize = {600, 300}
GM.Config.ChatLimit = 500

GM.Config.ChatAliases = {
	["@"] = "/a",
	["//"] = "/ooc",
	["[["] = "/looc",
	[".//"] = "/looc",
	[":"] = "/me"
}
 
GM.Config.ConsoleAliases = {
	["bring"] = "rpa_bring",
	["goto"] = "rpa_goto",
	["send"] = "rpa_send",
	["tp"] = "rpa_tp",
	["kick"] = "rpa_kick",

	["roll"] = "rp_roll",
	["setcid"] = "rp_setcid",
	["onduty"] = "rp_onduty",
	["offduty"] = "rp_offduty"
}

GM.Config.ScoreboardCommands = {
	{"Kick", "rpa_kick"},
	{"Slap", "rpa_slap"},
	{"Toggle KO", function(ply) return IsValid(ply:GetRagdoll()) and "rpa_wake" or "rpa_ko" end},
	{"Toggle Muted (OOC)", function(ply) return ply:OOCMuted() and "rpa_unmute" or "rpa_mute" end},
	{"Toggle Muted (GME, GIT)", function(ply) return ply:GlobalICMuted() and "rpa_unmuteglobalemotes" or "rpa_muteglobalemotes" end},
	{"Toggle Hidden", "rpa_hide"},
	{"Toggle Infinite ammo", function(ply) return ply:InfiniteAmmo() and "rpa_finiteammo" or "rpa_infiniteammo" end},
	{"Get Character ID", "rpa_charid"},
	{"Copy SteamID", "rpa_getinfo"},
	{"Heal", "rpa_heal"},
	{"Kill", "rpa_kill"},
	{"Goto", "rpa_goto"},
	{"Bring", "rpa_bring"},
	{"Teleport", "rpa_tp"},
	{"Edit Inventory", "rpa_editinventory"},
	{"Edit Stash", "rpa_editstash"}
}

GM.Config.ChatRanges = {
	Yell = 800,
	Speak = 400,
	Whisper = 150
}

GM.Config.ChatColors = {
	IC = Color(91, 166, 221),
	Emote = Color(131, 196, 251),
	Radio = Color(72, 118, 255),
	Language = Color(255, 167, 73),
	Yell = Color(255, 50, 50),
	OOC = Color(200, 0, 0),
	LOOC = Color(138, 185, 209),
	GlobalIC = Color(190, 170, 221),
	Error = Color(200, 0, 0),
	Notice = Color(229, 201, 98),
	Console = Color(0, 125, 255),
	AdminName = Color(255, 107, 218),
	AdminText = Color(255, 156, 230),
	Event = Color(0, 191, 255),
	LocalEvent = Color(255, 117, 48),
	PM = Color(160, 255, 160),
	PEV = Color(229, 201, 98),
	Angry = Color(232, 20, 20),
	Advert = Color(205, 92, 92),
	Dispatch = Color(51, 51, 255),
	Broadcast = Color(204, 0, 0)
}

GM.Config.CollectionID 	= 3276998803
GM.Config.Website 		= "https://discord.gg/UCCuGVaUsV"

GM.Config.Workshop = {}
GM.Config.Workshop.Content 	= { 
	"773402917",    -- Advanced Duplicator 2
	"2927324642", 	-- TnB Prop Pack 2 - hardhat
	"2912816023",	-- LVS Framework
	"2434141567", 	-- Consumer Vehicles
	
}
-- When the current map matches a map name in this table, the relevant workshop download will be added
GM.Config.Workshop.Maps = {
	["rp_industrial17_snow"] = 675505158,
}
-- TODO: not implemented yet
-- When a map has extra content in a separate addon, add it to this table to send it to clients.
GM.Config.Workshop.MapContent = {
	["rp_industrial17_snow"] = "679843970",
	["rp_terminal6_v2"] = "804755013",
	["rp_downpour"] = "1980062764",
	["rp_city17_district47"] = "1532130244", --(v2)
}

GM.Config.ArmorLevels 	= {
	{DamageScale = 1,    Speed = 1.00 },
	{DamageScale = 0.75, Speed = 1.00 },
	{DamageScale = 0.65, Speed = 0.95 },
	{DamageScale = 0.55, Speed = 0.95 },
	{DamageScale = 0.45, Speed = 0.90 },
	{DamageScale = 0.35, Speed = 0.90 }
}

GM.Config.HitGroupMultipliers = {
	[HITGROUP_HEAD] = 1.75,
	[HITGROUP_LEFTARM] = 0.8,
	[HITGROUP_RIGHTARM] = 0.8,
	[HITGROUP_LEFTLEG] = 0.75,
	[HITGROUP_RIGHTLEG] = 0.75
}

GM.Config.ExamineRange = 1024
GM.Config.InteractRange = 82 -- Source default for +use

GM.Config.EntityRange = {
	Min = 100,
	Max = 256
}

GM.Config.SandboxLimits = {
	[TOOLTRUST_BASIC] = {
		props = 50,
		effects = 10,
		ragdolls = 0
	},
	[TOOLTRUST_ADVANCED] = {
		props = 150,
		effects = 20,
		ragdolls = 0
	}
}

GM.Config.SandboxLimitsExtra = {
	[DONATORPACKAGE_BRONZE] = {
		props = 50,
		effects = 10,
		ragdolls = 5
	},
	[DONATORPACKAGE_SILVER] = {
		props = 100,
		effects = 20,
		ragdolls = 10
	},
	[DONATORPACKAGE_GOLD] = {
		props = 200,
		effects = 50,
		ragdolls = 20
	}
}

GM.Config.SandboxBlacklist = {
	Props = {
		"models/props_explosive/",
		"models/props_c17/oildrum001_explosive.mdl",
		"models/props_junk/gascan001a.mdl",
		"models/props_junk/propane_tank001a.mdl",
		"models/props_combine/breen_tube.mdl",
		"models/props_combine/combine_bunker01.mdl",
		"models/props_combine/combine_tptimer.mdl",
		"models/props_combine/prison01.mdl",
		"models/props_combine/prison01c.mdl",
		"models/props_combine/prison01b.mdl",
		"models/props_phx/huge/",
		"models/props_phx/misc/",
		"models/props_phx/trains/",
		"models/props_phx/amraam.mdl",
		"models/props_phx/ball.mdl",
		"models/props_phx/mk-82.mdl",
		"models/props_phx/oildrum001_explosive.mdl",
		"models/props_phx/torpedo.mdl",
		"models/props_phx/ww2bomb.mdl",
		"models/props_equipment/oxygentank01.mdl",
		"models/props/industrial17/warehouse_e120_1.mdl",
		"models/props_citizen_tech/ied_shoebox.mdl",
		"models/props_citizen_tech/ied.mdl"
	},
	Entities = {
		"animprop_spawn",
		"item_battery",
		"item_suitcharger"
	}
}

GM.Config.ProtectedEntities = {
	"prop_door_rotating",
	"func_*",
	"prop_dynamic*",
	"class C_BaseEntity"
}

GM.Config.PropRadius = {
	[TOOLTRUST_BASIC] = 200,
	[TOOLTRUST_ADVANCED] = 800
}

GM.Config.ToolTrust = {
	[TOOLTRUST_BASIC] = {
		"weld",
		"camera",
		"physprop",
		"remover",
		"colour",
		"material",
		"submaterial",
		"advmat",
		"nocollideworld"
	},
	[TOOLTRUST_ADVANCED] = {
		"axis",
		"ballsocket",
		"elastic",
		"hydraulic",
		"motor",
		"muscle",
		"pulley",
		"rope",
		"winch",
		"balloon",
		"button",
		"emitter",
		"hoverball",
		"lamp",
		"light",
		"nocollide",
		"thruster",
		"wheel",
		"eyeposer",
		"faceposer",
		"fingerposer",
		"paint",
		"advdupe2",
		"precision",
		"precision_align",
		"weight",
		"stacker_improved",
		"streamradio",
		"streamradio_color",
		"unbreakable"
	}
}

GM.Config.HUDData = {
	Margin = 2,
	Offset = 20
}

GM.Config.NPCDrops = {
	["npc_headcrab"] = {0.25, "food_headcrabgib"},
	["npc_zombie"]   = {0.3, "food_headcrabgib"},
	["npc_zombie_torso"] = {0.3, "food_headcrabgib"},
	["npc_headcrab_fast"] = {0.35, "food_headcrabgib"},
	["npc_fastzombie"] = {0.35, "food_headcrabgib"},
	["npc_fastzombie_torso"] = {0.35, "food_headcrabgib"},
	["npc_headcrab_black"] = {0.35, "food_poisongib"},
	["npc_poisonzombie"] = {0.35, "food_poisongib"},
	["npc_antlion"] = {0.3, "food_antliongib"},
	["npc_antlionguard"] = {0.8, "food_guardgib"},
	["npc_crow"] = {0.25, "food_birdgib"},
	["npc_pigeon"] = {0.25, "food_birdgib"},
	["npc_seagull"] = {0.25, "food_birdgib"},
}

GM.Config.NPCSkill = {
	["npc_metropolice"] = WEAPON_PROFICIENCY_AVERAGE,
	["CombinePrison"] = WEAPON_PROFICIENCY_VERY_GOOD,
	["PrisonShotgunner"] = WEAPON_PROFICIENCY_GOOD,
	["ShotgunSoldier"] = WEAPON_PROFICIENCY_GOOD,
	["CombineElite"] = WEAPON_PROFICIENCY_PERFECT,
	["npc_combine_s"] = WEAPON_PROFICIENCY_VERY_GOOD,
	["npc_turret_ceiling"] = WEAPON_PROFICIENCY_PERFECT,
	["npc_turret_floor"] = WEAPON_PROFICIENCY_PERFECT,
	["npc_alyx"] = WEAPON_PROFICIENCY_PERFECT,
	["npc_barney"] = WEAPON_PROFICIENCY_PERFECT,
	["npc_citizen"] = WEAPON_PROFICIENCY_POOR,
	["npc_dog"] = WEAPON_PROFICIENCY_POOR,
	["npc_magnusson"] = WEAPON_PROFICIENCY_POOR,
	["npc_kleiner"] = WEAPON_PROFICIENCY_POOR,
	["npc_mossman"] = WEAPON_PROFICIENCY_POOR,
	["npc_eli"] = WEAPON_PROFICIENCY_POOR,
	["Medic"] = WEAPON_PROFICIENCY_AVERAGE,
	["npc_odessa"] = WEAPON_PROFICIENCY_AVERAGE,
	["Rebel"] = WEAPON_PROFICIENCY_GOOD,
	["Refugee"] = WEAPON_PROFICIENCY_AVERAGE,
	["VortigauntUriah"] = WEAPON_PROFICIENCY_VERY_GOOD,
	["npc_vortigaunt"] = WEAPON_PROFICIENCY_VERY_GOOD,
	["VortigauntSlave"] = WEAPON_PROFICIENCY_VERY_GOOD,
}

GM.Config.NPCDamage = {
	["npc_antlion"] = 0.25,
	["npc_antlion_worker"] = 0.30,
	["npc_antlionguard"] = 0.7,
	["npc_antlionguardian"] = 0.6,
	["npc_barnacle"] = 0.5,
	["npc_headcrab_fast"] = 1,
	["npc_headcrab"] = 1,
	["npc_headcrab_black"] = 1,
	["npc_fastzombie"] = 0.4,
	["npc_fastzombie_torso"] = 1,
	["npc_zombie"] = 0.65,
	["npc_zombie_torso"] = 0.65,
	["npc_zombine"] = 0.45,
	["npc_poisonzombie"] = 0.65,
	["npc_cscanner"] = 0.3,
	["npc_manhack"] = 1,
	["npc_clawscanner"] = 0.3
}

GM.Config.NPCRelationships = {
	["npc_metropolice"] = RELATIONSHIP_METROPOLICE,
	["CombinePrison"] = RELATIONSHIP_COMBINESOLDIER,
	["PrisonShotgunner"] = RELATIONSHIP_COMBINESOLDIER,
	["ShotgunSoldier"] = RELATIONSHIP_COMBINESOLDIER,
	["CombineElite"] = RELATIONSHIP_COMBINESOLDIER,
	["npc_combine_s"] = RELATIONSHIP_COMBINESOLDIER,
	["npc_turret_ceiling"] = RELATIONSHIP_COMBINETURRET,
	["npc_turret_floor"] = RELATIONSHIP_COMBINETURRET,
	["npc_rollermine"] = RELATIONSHIP_COMBINETURRET,
	["npc_clawscanner"] = RELATIONSHIP_COMBINETURRET,
	["npc_cscanner"] = RELATIONSHIP_COMBINETURRET,
	["npc_combine_camera"] = RELATIONSHIP_COMBINETURRET,
	["npc_manhack"] = RELATIONSHIP_COMBINETURRET,
	["npc_helicopter"] = RELATIONSHIP_COMBINETURRET,
	["npc_combinedropship"] = RELATIONSHIP_COMBINESYNTH,
	["npc_combinegunship"] = RELATIONSHIP_COMBINESYNTH,
	["npc_hunter"] = RELATIONSHIP_COMBINESYNTH,
	["npc_strider"] = RELATIONSHIP_COMBINESYNTH,
	["npc_stalker"] = RELATIONSHIP_METROPOLICE,
	["npc_antlion"] = RELATIONSHIP_XENIAN,
	["npc_antlionguard"] = RELATIONSHIP_XENIAN,
	["npc_antlionguardian"] = RELATIONSHIP_XENIAN,
	["npc_antlion_worker"] = RELATIONSHIP_XENIAN,
	["npc_headcrab_fast"] = RELATIONSHIP_XENIAN,
	["npc_fastzombie"] = RELATIONSHIP_XENIAN,
	["npc_fastzombie_torso"] = RELATIONSHIP_XENIAN,
	["npc_headcrab"] = RELATIONSHIP_XENIAN,
	["npc_headcrab_black"] = RELATIONSHIP_XENIAN,
	["npc_poisonzombie"] = RELATIONSHIP_XENIAN,
	["npc_zombie"] = RELATIONSHIP_XENIAN,
	["npc_zombie_torso"] = RELATIONSHIP_XENIAN,
	["npc_zombine"] = RELATIONSHIP_XENIAN,
	["npc_alyx"] = RELATIONSHIP_RESISTANCE,
	["npc_barney"] = RELATIONSHIP_RESISTANCE,
	["npc_citizen"] = RELATIONSHIP_RESISTANCE,
	["npc_dog"] = RELATIONSHIP_RESISTANCE,
	["npc_magnusson"] = RELATIONSHIP_RESISTANCE,
	["npc_kleiner"] = RELATIONSHIP_RESISTANCE,
	["npc_mossman"] = RELATIONSHIP_RESISTANCE,
	["npc_eli"] = RELATIONSHIP_RESISTANCE,
	["Medic"] = RELATIONSHIP_RESISTANCE,
	["npc_odessa"] = RELATIONSHIP_RESISTANCE,
	["Rebel"] = RELATIONSHIP_RESISTANCE,
	["Refugee"] = RELATIONSHIP_RESISTANCE,
	["VortigauntUriah"] = RELATIONSHIP_RESISTANCE,
	["npc_vortigaunt"] = RELATIONSHIP_RESISTANCE,
	["VortigauntSlave"] = RELATIONSHIP_RESISTANCE,
	
}


GM.Config.RagdollTimeout = 300

GM.Config.BanRealm = "hl2"

GM.Config.StashSize = {4, 4}

GM.Config.DefaultLogs 	= 200
GM.Config.MaxLogs 		= 500

GM.Config.AFKKicker 	= {
	Enabled = false,
	Threshold = 0.90,
	Timer = 600
}

GM.Config.ConsciousnessRate = 0.75

GM.Config.HungerEnabled = true
GM.Config.HungerMax = 1000 -- Total number of hunger points.
GM.Config.HungerTick = 720 -- Minutes it takes to become "hungry" from 0 to max (12 hours)

GM.Config.CleanupTimer = 900 -- Seconds

-- ["item_to_change"] = "new_item" for deprecation of classes.
GM.Config.ItemRemappings = {
	["crafting_combinemedicaltool"] = "tool_combinemedicaltool",
	["crafting_wrench"] = "tool_wrench",
	["crafting_pan"] = "tool_pan",
	["crafting_saucepan"] = "tool_saucepan",
	["crafting_paintroller"] = "tool_paintroller",
	["crafting_medtoolkit"] = "tool_medtoolkit",
	["crafting_hammer"] = "tool_hammer",
	["crafting_welder"] = "tool_welder",
	["crafting_saw"] = "tool_saw",
	["crafting_screwdriver"] = "tool_screwdriver",
	["crafting_pliers"] = "tool_pliers"
}

-- Allows custom functions to be run on player spawn.
GM.Config.SpecialItemFunctions = {
	["vortigaunt_shackles_disabled"] = {
		Class = "vortigaunt_shackles",
		Function = function(item) item:Break() end
	},
	["rationparcel_lowquality_sealed"] = {
		Class = "rationparcel_lowquality",
		Function = function(item) item:CreateInventory() end
	},
	["rationparcel_standard_sealed"] = {
		Class = "rationparcel_standard",
		Function = function(item) item:CreateInventory() end
	},
	["rationparcel_elevated_sealed"] = {
		Class = "rationparcel_elevated",
		Function = function(item) item:CreateInventory() end
	},
	["rationparcel_cota_nutrient_sealed"] = {
		Class = "rationparcel_cota_nutrient",
		Function = function(item) item:CreateInventory() end
	},
	["rationparcel_loyalist_sealed"] = {
		Class = "rationparcel_loyalist",
		Function = function(item) item:CreateInventory() end
	},
	["rationparcel_highpriority_sealed"] = {
		Class = "rationparcel_highpriority",
		Function = function(item) item:CreateInventory() end
	},
	["rationparcel_civpro_sealed"] = {
		Class = "rationparcel_civpro",
		Function = function(item) item:CreateInventory() end
	},
}

GM.Config.PlayerHulls = {
	Default = {
		Standing = {Vector(-10, -10, 0), Vector(10, 10, 71)},
		Crouching = {Vector(-10, -10, 0), Vector(10, 10, 37)},
		ViewOffset = Vector(0, 0, 64),
		DuckedViewOffset = Vector(0, 0, 33)
	},
	["models/combine_scanner.mdl"] = {
		Standing = {Vector(-16, -16, -16), Vector(16, 16, 16)},
		ViewOffset = Vector(0, 0, 0)
	},
	["models/shield_scanner.mdl"] = {
		Standing = {Vector(-16, -16, -16), Vector(16, 16, 16)},
		ViewOffset = Vector(0, 0, 0)
	},
	["models/antlion.mdl"] = {
		Standing = {Vector(-16, -16, 0), Vector(16, 16, 64)},
		ViewOffset = Vector(0, 0, 32)
	},
	["models/antlion_worker.mdl"] = {
		Standing = {Vector(-16, -16, 0), Vector(16, 16, 64)},
		ViewOffset = Vector(0, 0, 32)
	},
	["models/antlion_guard.mdl"] = {
		Standing = {Vector(-40, -40, 0), Vector(40, 40, 100)},
		ViewOffset = Vector(0, 0, 70)
	},
	["models/gargantua.mdl"] = {
		Standing = {Vector(-80, -80, 0), Vector(80, 80, 220)},
		ViewOffset = Vector(0, 0, 125)
	},
	["models/babygarg.mdl"] = {
		Standing = {Vector(-40, -40, 0), Vector(40, 40, 120)},
		ViewOffset = Vector(0, 0, 65)
	},
	["models/half-life/big_mom.mdl"] = {
		Standing = {Vector(-100, -100, 0), Vector(100, 100, 190)},
		ViewOffset = Vector(0, 0, 160)
	},
	["models/opfor/gonome.mdl"] = {
		Standing = {Vector(-20, -20, 0), Vector(20, 20, 90)},
		ViewOffset = Vector(0, 0, 75)
	},
	["models/half-life/agrunt.mdl"] = {
		Standing = {Vector(-20, -20, 0), Vector(20, 20, 90)},
		ViewOffset = Vector(0, 0, 80)
	},
	["models/headcrabclassic.mdl"] = {
		Standing = {Vector(-10, -10, 0), Vector(10, 10, 15)},
		ViewOffset = Vector(0, 0, 10)
	},
	["models/headcrab.mdl"] = {
		Standing = {Vector(-10, -10, 0), Vector(10, 10, 25)},
		ViewOffset = Vector(0, 0, 20)
	},
	["models/headcrabblack.mdl"] = {
		Standing = {Vector(-15, -15, 0), Vector(15, 15, 15)},
		ViewOffset = Vector(0, 0, 10)
	},
	["models/half-life/kingpin.mdl"] = {
		Standing = {Vector(-35, -35, 0), Vector(35, 35, 120)},
		ViewOffset = Vector(0, 0, 80)
	},
	["models/half-life/panthereye.mdl"] = {
		Standing = {Vector(-15, -15, 0), Vector(15, 15, 50)},
		ViewOffset = Vector(0, 0, 35),
		DuckedViewOffset = Vector(0, 0, 25)
	},
	["models/half-life/islave.mdl"] = {
		Standing = {Vector(-10, -10, 0), Vector(10, 10, 65)},
		ViewOffset = Vector(0, 0, 45)
	},
	["models/tor.mdl"] = {
		Standing = {Vector(-20, -20, 0), Vector(20, 20, 95)},
		ViewOffset = Vector(0, 0, 75)
	},
	["models/zombie/fast_torso.mdl"] = {
		Standing = {Vector(-12, -12, 0), Vector(12, 12, 24)},
		ViewOffset = Vector(0, 0, 15)
	},
	["models/zombie/classic_torso.mdl"] = {
		Standing = {Vector(-12, -12, 0), Vector(12, 12, 24)},
		ViewOffset = Vector(0, 0, 15)
	}
}

GM.Config.DropOnDeath = false

GM.Config.PermissionWhitelist = {
	[PERMISSION_VEHICLES] = {
		"azlk412(E34D-FSD2-FN2J)", -- azlk2140
		"sim_fphys_stalkergaz52", -- gaz 52
		"sim_fphys_stalkergaz66", -- gaz 66
		"SnowdropEscape_Gaz24", -- gaz 24
		"SnowdropEscape_Gaz24_KGB", -- gaz 24 kgb
		"SnowdropEscape_Gaz24_Police", -- gaz 24 police
		"SnowdropEscape_Gaz24_Police2", -- gaz 24 police 2
		"gaz53(E34D-FSD2-FN2J)", -- gaz 53 
		"gaz53ab(E34D-FSD2-FN2J)", -- gaz 53 cabin
		"gaz53c(E34D-FSD2-FN2J)", -- gaz 53 cargo
		"gaz53e(E34D-FSD2-FN2J)", -- gaz 53 tank
		"gaz66(E34D-FSD2-FN2J)", -- gaz 66
		"gaz66K(E34D-FSD2-FN2J)", -- gaz 66 cabin
		"gaz66F(E34D-FSD2-FN2J)", -- gaz 66 cargo
		"sim_fphys_hlalyxniva", -- HL:Alyx Niva
		"kamaz5410(E34D-FSD2-FN2J)", -- Kamaz 5410
		"sim_fphys_stalkeravtobusgaz", -- KAvZ 685
		"sim_fphys_stalkerlada", -- Lada
		"sim_fphys_stalkerladacabrio", -- Lada Convertible
		"sim_fphys_stalkerlaz", -- Laz
		"liaz677(E34D-FSD2-FN2J)", -- Liaz 677
		"dust_d300", -- mercedez benz w123
		"sim_fphys_stalkermoskvitch", -- moskvitch
		"sim_fphys_stalkerraf", -- raf
		"raf2203(E34D-FSD2-FN2J)", -- raf 2203
		"raf2203Skor(E34D-FSD2-FN2J)", -- raf 2203 ambulance
		"raf2203Sit(E34D-FSD2-FN2J)", -- raf 2203 passenger
		"sim_fphys_stalkertractor", -- tractor
		"uaz452(E34D-FSD2-FN2J)", -- uaz 452
		"uaz452Police2(E34D-FSD2-FN2J)", -- uaz 452 police 1
		"uaz452Police(E34D-FSD2-FN2J)", -- uaz 452 police 2
		"sim_fphys_UAZ1", -- uaz 469
		"sim_fphys_stalkerzaza", -- zaz 965
		"sim_fphys_stalkerzazanew", -- zaz 965 old
		"SnowdropEscape_Zaz968", -- zaz 968
		"SnowdropEscape_Zaz968m", -- zaz 968m
		"sim_fphys_stalkerzil", -- zil 130
		"sim_fphys_stalkerzil131", -- zil 131
		"sim_fphys_stalkerzilfire", -- zil 131 firetruck
		"de_cache_van", -- chevy van g20





	},
	[PERMISSION_CMBVEHICLES] = {
		"ctv_hla_prisoner_transport", -- prisoner transport
		"sim_fphys_maz_535", -- maz 535
		"SnowdropEscape_Gaz24_KGB", -- gaz 24 kgb
		"SnowdropEscape_Gaz24_Police", -- gaz 24 police 1
		"SnowdropEscape_Gaz24_Police2", -- gaz 24 police 2
		"raf2203Skor(E34D-FSD2-FN2J)", -- raf 2203 ambulance
		"uaz452Police2(E34D-FSD2-FN2J)", -- uaz 452 police 1
		"uaz452Police(E34D-FSD2-FN2J)", -- uaz 452 police 2
		"sim_fphys_UAZ1", -- uaz 469
		"ent_apc"
	}
}

GM.Config.SkinTones = {
	["models/tnb/heads/trp/male_01.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/male_03.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/male_13.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/male_32.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/male_44.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/male_49.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/male_77.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/male_78.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/male_101.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/female_03.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/female_45.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/female_53.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/female_81.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/female_87.mdl"] = SKINTONE_BLACK,
									
}

GM.Config.ServerMusic = {
	{ "sound/music/hl1_song3.mp3", 131, SONG_IDLE, "Black Mesa Inbound" },
	{ "sound/music/hl1_song20.mp3", 84, SONG_IDLE, "Escape Array" },
	{ "sound/music/hl1_song21.mp3", 84, SONG_IDLE, "Dirac Shore" },
	{ "sound/music/hl2_song0.mp3", 39, SONG_IDLE, "Entanglement" },
	{ "sound/music/hl2_song1.mp3", 98, SONG_IDLE, "Particle Ghost" },
	{ "sound/music/hl2_song2.mp3", 172, SONG_IDLE, "Lab Practicum" },
	{ "sound/music/hl2_song8.mp3", 59, SONG_IDLE, "Highway 17" },
	{ "sound/music/hl2_song10.mp3", 29, SONG_IDLE, "A Red Letter Day" },
	{ "sound/music/hl2_song11.mp3", 34, SONG_IDLE, "Sandtraps" },
	{ "sound/music/hl2_song13.mp3", 53, SONG_IDLE, "Suppression Field" },
	{ "sound/music/hl2_song17.mp3", 61, SONG_IDLE, "Broken Symmetry" },
	{ "sound/music/hl2_song19.mp3", 115, SONG_IDLE, "Nova Prospekt" },
	{ "sound/music/hl2_song26_trainstation1.mp3", 90, SONG_IDLE, "Train Station 1" },
	{ "sound/music/hl2_song27_trainstation2.mp3", 72, SONG_IDLE, "Train Station 2" },
	{ "sound/music/hl2_song30.mp3", 104, SONG_IDLE, "Calabi-Yau Model" },
	{ "sound/music/vlvx_song26.mp3", 110, SONG_IDLE, "Inhuman Frequency" },
	{ "sound/music/vlvx_song3.mp3", 95, SONG_IDLE, "Dark Interval" },
	{ "sound/music/vlvx_song15.mp3", 107, SONG_IDLE, "Nectarium" },
	{ "sound/music/vlvx_song20.mp3", 124, SONG_IDLE, "Extinction Event Horizon" },
	{ "sound/music/vlvx_song23ambient.mp3", 158, SONG_IDLE, "Shu'ulathoi" },
	{ "sound/music/hl1_song5.mp3", 96, SONG_ALERT, "Echoes of a Resonance Cascade" },
	{ "sound/music/hl1_song6.mp3", 99, SONG_ALERT, "Zero Point Energy Field" },
	{ "sound/music/hl1_song9.mp3", 93, SONG_ALERT, "Neutrino Trap" },
	{ "sound/music/hl1_song11.mp3", 34, SONG_ALERT, "Hazardous Environments" },
	{ "sound/music/hl1_song14.mp3", 90, SONG_ALERT, "Triple Entanglement" },
	{ "sound/music/hl1_song17.mp3", 123, SONG_ALERT, "Tau-9" },
	{ "sound/music/hl1_song19.mp3", 115, SONG_ALERT, "Negative Pressure" },
	{ "sound/music/hl1_song24.mp3", 77, SONG_ALERT, "Singularity" },
	{ "sound/music/hl1_song26.mp3", 37, SONG_ALERT, "Xen Relay" },
	{ "sound/music/hl2_song7.mp3", 50, SONG_ALERT, "Ravenholm Reprise" },
	{ "sound/music/hl2_song26.mp3", 69, SONG_ALERT, "Our Resurrected Teleport" },
	{ "sound/music/hl2_song31.mp3", 98, SONG_ALERT, "Brane Scan" },
	{ "sound/music/hl2_song32.mp3", 42, SONG_ALERT, "Slow Light" },
	{ "sound/music/hl2_song33.mp3", 84, SONG_ALERT, "Probably Not a Problem" },
	{ "sound/music/vlvx_song0.mp3", 62, SONG_ALERT, "No One Rides For Free" },
	{ "sound/music/vlvx_song9.mp3", 74, SONG_ALERT, "Crawl Yard" },
	{ "sound/music/vlvx_song25.mp3", 167, SONG_ALERT, "Abandoned In Place" },
	{ "sound/music/vlvx_song28.mp3", 193, SONG_ALERT, "Eon Trap" },
	{ "sound/music/hl1_song10.mp3", 104, SONG_ACTION, "Lambda Core" },
	{ "sound/music/hl1_song15.mp3", 120, SONG_ACTION, "Something Secret Steers Us" },
	{ "sound/music/hl2_song3.mp3", 90, SONG_ACTION, "Dark Energy" },
	{ "sound/music/hl2_song4.mp3", 65, SONG_ACTION, "The Innsbruck Experiment" },
	{ "sound/music/hl2_song6.mp3", 45, SONG_ACTION, "Pulse Phase" },
	{ "sound/music/hl2_song12_long.mp3", 73, SONG_ACTION, "Hard Fought" },
	{ "sound/music/hl2_song14.mp3", 159, SONG_ACTION, "You're Not Supposed to Be Here" },
	{ "sound/music/hl2_song15.mp3", 69, SONG_ACTION, "Kaon" },
	{ "sound/music/hl2_song16.mp3", 170, SONG_ACTION, "LG Orbifold" },
	{ "sound/music/hl2_song20_submix0.mp3", 103, SONG_ACTION, "CP Violation" },
	{ "sound/music/hl2_song20_submix4.mp3", 139, SONG_ACTION, "CP Violation (remix)" },
	{ "sound/music/hl2_song29.mp3", 135, SONG_ACTION, "Apprehension and Evasion" },
	{ "sound/music/vlvx_song22.mp3", 194, SONG_ACTION, "Vortal Combat" },
	{ "sound/music/vlvx_song23.mp3", 166, SONG_ACTION, "Sector Sweep" },
	{ "sound/music/vlvx_song24.mp3", 127, SONG_ACTION, "Last Legs" },
	{ "sound/music/vlvx_song27.mp3", 209, SONG_ACTION, "Hunting Party" },
	{ "sound/music/stingers/hl1_stinger_song7.mp3", 23, SONG_STINGER, "Apprehensive" },
	{ "sound/music/stingers/hl1_stinger_song8.mp3", 9, SONG_STINGER, "Bass String" },
	{ "sound/music/stingers/hl1_stinger_song16.mp3", 16, SONG_STINGER, "Scared Confusion" },
	{ "sound/music/stingers/hl1_stinger_song27.mp3", 17, SONG_STINGER, "Dark Piano" },
	{ "sound/music/stingers/hl1_stinger_song28.mp3", 7, SONG_STINGER, "Sharp Piano" }
}
