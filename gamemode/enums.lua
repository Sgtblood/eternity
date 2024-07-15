ETERNITY_GAMEMODULE_SHARED = 0
ETERNITY_GAMEMODULE_HALFLIFE = 1
ETERNITY_GAMEMODULE_ZOMBIES = 2
SPECIES_HUMAN = 1
SPECIES_VORTIGAUNT = 2
SPECIES_CMB_SOLDIER = 3
SPECIES_CMB_TYRANT = 4
SPECIES_CMB_HUNTER = 5
SPECIES_CMB_SCANNER = 6
SPECIES_XENIAN = 7
SPECIES_RACEX = 8
--[[----------------------------------------------------------------
	Name: STOREBLOCK (STOREBLOCK_)
	Desc: Defines inventory metatype restrictions. 
				
	Two items with the same type cannot be stored within one 
	another. Additionnally, STOREBLOCK_INVENTORY prevents any
	item with an inventory from being kept inside of it.
-------------------------------------------------------------------]]
STOREBLOCK_NONE = 0
STOREBLOCK_INVENTORY = 1
STOREBLOCK_BACKPACK = 2
--[[----------------------------------------------------------------
	Name: STORE (STORE_)
	Desc: Defines inventory metatype classes. 

	Hints to the gamemode what kind of inventory or item store
	is being accessed, and how those items should be handled.
-------------------------------------------------------------------]]
STORE_NONE = 0
STORE_PLAYER = 1
STORE_ITEM = 2
STORE_CONTAINER = 3
STORE_WORLD = 4
STORE_STASH = 5
COMBINE_DOORS_NEXUS = 0 -- Access to normal, Combine-only doors.
COMBINE_DOORS_LOCKS = 1 -- Access to lock/unlock other CCA doors.
COMBINE_TECHNOLOGY_FORCEFIELD = 2 -- Access to control forcefields.
COMBINE_TECHNOLOGY_APC = 3 -- Access to drive Combine APCs.
COMBINE_TECHNOLOGY_LOCK = 4 -- Access to apply Combine locks to doors.
COMBINE_SQUADHUD_JOINTEAM = 5 -- Access to join a squad on the squad menu.
COMBINE_SQUADHUD_CREATETEAM = 6 -- Access to create a squad on the squad menu.
COMBINE_SURVEILANCE_BASIC = 7 -- Access to view Combine cameras. 
COMBINE_SURVEILANCE_UNITS = 8 -- Access to view Combine body-cameras.
COMBINE_RECORDS_READONLY = 9 -- Access to only read criminal records.
COMBINE_RECORDS_WRITEABLE = 10 -- Access to read criminal records
COMBINE_ADMINS_DISPATCH = 11 -- Access to play Dispatch voice effects.
COMBINE_ADMINS_WAIVER = 12 -- Access to manage Judgement/Autonomous waivers.
COMBINE_ADMINS_PROMOTE = 13 -- Access to promote, demote, fire, and change unit squads.
COMBINE_ADMINS_PROMOTE_SQL = 14 -- Access to promote, demote, fire, and change SqL squads.
COMBINE_GEARBOX_LOWRISK = 15 -- Access to spawn Combine radios, only.
COMBINE_GEARBOX_POLICE = 16 -- Access to spawn Combine radios, zipties, baton, and smoke grenades.
COMBINE_GEARBOX_COMMAND = 17 -- Access to spawn everything.
COMBINE_MESSAGE_BROADCAST = 18 -- Access to /bc
COMBINE_MESSAGE_DISPATCH = 19 -- Access to /dis
COMBINE_MESSAGE_RADIO = 20 -- Access to /rdis
COMBINE_RATION_LOWQUALITY = 21 -- Self explanatory.
COMBINE_RATION_STANDARD = 22 -- Self explanatory.
COMBINE_RATION_ELEVATED = 23 -- Self explanatory.
COMBINE_RATION_CIVPRO = 24 -- Self explanatory.
COMBINE_RATION_LOYALIST = 25 -- Self explanatory.
COMBINE_RATION_HIGHPRIORITY = 26 -- Self explanatory.
COMBINE_GEARBOX_INTELLIGENCE = 27 -- Access to intelligence items.
COMBINE_GEARBOX_COTA = 28
COMBINE_RATION_HIGHQUALITY = 29 -- Self explanatory.
COMBINE_LEVEL_CITIZEN = 0 -- Citizens, etc
COMBINE_LEVEL_LOWERASSET = 1 -- Units
COMBINE_LEVEL_LOWERADMIN = 2 -- EU, SqL, City Ministers, Inspectors
COMBINE_LEVEL_UPPERASSET = 3 -- PrC, COTA, Synths, etc
COMBINE_LEVEL_UPPERADMIN = 4 -- Chief Inspector, City Admin
COMBINE_LEVEL_GLOBAL = 5 -- Special things, probably event only.
EQUIPMENT_TO_TEXT = {}
local function AddEquipment(id, var, name)
	var = "EQUIPMENT_" .. var
	_G[var] = id
	_G.EQUIPMENT_TO_TEXT[id] = name
end

-- Regular Human Clothing Inventory Slots
AddEquipment(1, "HEAD", "Hat")
AddEquipment(2, "EYES", "Glasses")
AddEquipment(3, "MASK", "Mask")
AddEquipment(4, "SCARF", "Scarf")
AddEquipment(5, "TORSO", "Torso")
AddEquipment(6, "BACK", "Backpack")
AddEquipment(7, "LEGS", "Legs")
AddEquipment(9, "GLOVES", "Gloves")
-- Common Weapon Inventory Slots
AddEquipment(10, "PRIMARY", "Primary")
AddEquipment(11, "SECONDARY", "Sidearm")
AddEquipment(12, "RADIO", "Radio")
AddEquipment(13, "MELEE", "Melee")
AddEquipment(14, "MISC", "Misc")
-- Special Item Inventory Slots
AddEquipment(15, "ARMOR", "Armor")
AddEquipment(16, "COMBINE", "Combine")
AddEquipment(17, "VORTIGAUNT", "Clothing")
AddEquipment(18, "XENIAN", "Model")
TEAMS = {}
local function AddTeam(id, var, name, color, hidden, order)
	var = "TEAM_" .. var
	_G[var] = id
	_G.TEAMS[id] = {
		Id = id,
		Name = name,
		Color = color,
		Hidden = hidden,
		ScoreOrder = order
	}
end

AddTeam(1, "CITIZENS", "Citizens", Color(0, 120, 0), false, 1)
AddTeam(2, "ENGINEERS", "Civil Engineering Core", Color(134, 197, 218), false, 2)
AddTeam(3, "INFCON", "Infestation Control Unit", Color(250, 218, 94), false, 3)
AddTeam(4, "POLICE", "Combine Civil Authority", Color(20, 90, 175), false, 4)
AddTeam(5, "LOWERADMIN", "Lower Administration", Color(240, 128, 128), false, 5)
AddTeam(6, "COMBINEADMIN", "Central Administration", Color(200, 0, 0), false, 6)
AddTeam(7, "MIDDLEADMIN", "Middle Administration", Color(72, 209, 204), false, 7)
AddTeam(8, "INSPECTORS", "Civic Security Board", Color(169, 169, 169), true, 8)
AddTeam(9, "OVERWATCH", "Combine Overwatch", Color(204, 112, 0), true, 9)
AddTeam(10, "AIRWATCH", "Combine Airwatch", Color(219, 112, 147), true, 10)
AddTeam(11, "XENIANS", "Xenians", Color(153, 187, 0), true, 11)
AddTeam(12, "RACEX", "Race-X", Color(115, 30, 215), true, 12)
AddTeam(13, "VORTIGAUNT", "Vortigaunts", Color(162, 243, 178), true, 13)
AddTeam(14, "OUTERRES", "Outer Residents", Color(0, 100, 0), false, 14)
AddTeam(15, "SCIENTIST", "Combine Scientists", Color(140, 110, 150), true, 15)
AddTeam(16, "EVENTCHAR", "Event Characters", Color(0, 120, 0), true, 16)
LANGUAGES = {}
local function AddLanguage(id, command, name, unknown, block)
	local var = "LANG_" .. string.upper(command)
	_G[var] = id
	_G.LANGUAGES[id] = {
		Command = command,
		Name = name,
		Unknown = unknown,
		BlockKnowledge = block
	}
end

LANG_NONE = 0
-- !IMPORTANT! Any changes made to this list will be reflected in-game, e.g. replacing German with something else will convert all existing german speakers to that language
AddLanguage(1, "eng", "English", nil, true)
AddLanguage(2, "chi", "Chinese")
AddLanguage(3, "hin", "Hindi")
AddLanguage(4, "ara", "Arabic")
AddLanguage(5, "por", "Portuguese")
AddLanguage(6, "ben", "Bengali")
AddLanguage(7, "rus", "Russian")
AddLanguage(8, "jap", "Japanese")
AddLanguage(9, "ger", "German")
AddLanguage(10, "vie", "Vietnamese")
AddLanguage(11, "kor", "Korean")
AddLanguage(12, "fre", "French")
AddLanguage(13, "urd", "Urdu")
AddLanguage(14, "tur", "Turkish")
AddLanguage(15, "ita", "Italian")
AddLanguage(16, "pol", "Polish")
AddLanguage(17, "afr", "Afrikaans")
AddLanguage(18, "dan", "Danish")
AddLanguage(19, "fin", "Finnish")
AddLanguage(20, "geo", "Georgian")
AddLanguage(21, "heb", "Hebrew")
AddLanguage(22, "nor", "Norwegian")
AddLanguage(23, "swa", "Swahili")
AddLanguage(24, "swe", "Swedish")
AddLanguage(25, "hun", "Hungarian")
AddLanguage(26, "gre", "Greek")
AddLanguage(27, "ukr", "Ukrainian")
AddLanguage(28, "per", "Persian")
AddLanguage(29, "ind", "Indonesian")
AddLanguage(30, "mon", "Mongolian")
AddLanguage(31, "pas", "Pashto")
AddLanguage(32, "tha", "Thai")
AddLanguage(33, "fil", "Filipino")
AddLanguage(34, "spa", "Spanish")
AddLanguage(35, "vort", "Vortigese", "a strange alien language", true)
AddLanguage(36, "xeni", "Xenian", "a strange amalgamation of grunts ", true)
AddLanguage(37, "rcex", "Race-Xian", "a strange amalgamation of phrases", true)
AddLanguage(38, "iri", "Irish")
AddLanguage(39, "sign", "Sign Language", "hand signs")
AddLanguage(40, "bul", "Bulgarian")
AddLanguage(41, "nep", "Nepali")
AddLanguage(42, "mar", "Marathi")
AddLanguage(43, "tel", "Telugu")
AddLanguage(44, "tam", "Tamil")
AddLanguage(45, "arm", "Armenian")
AddLanguage(46, "pun", "Punjabi")
AddLanguage(47, "yor", "Yoruba")
AddLanguage(48, "mal", "Malay")
AddLanguage(49, "rom", "Romanian")
AddLanguage(50, "som", "Somali")
AddLanguage(51, "dut", "Dutch")
AddLanguage(52, "cze", "Czech")
AddLanguage(53, "amh", "Amharic")
AddLanguage(54, "tib", "Tibetic")
AddLanguage(55, "aze", "Azerbaijani")
AddLanguage(56, "ser", "Serbo-Croatian")
AddLanguage(57, "slo", "Slovak")
AddLanguage(58, "mac", "Macedonian")
AddLanguage(59, "lith", "Lithuanian")
AddLanguage(60, "bel", "Belarusian")
AddLanguage(61, "lat", "Latvian")
AddLanguage(62, "lux", "Luxembourgish")
AddLanguage(63, "cre", "Creole")
AddLanguage(64, "viet", "Vietnamese")
AddLanguage(65, "est", "Estonian")
GENDER_MALE = 1
GENDER_FEMALE = 2
GENDER_OTHER = 3
DOOR_NOCONFIG = 0
DOOR_PUBLIC = 1
DOOR_BUYABLE = 2
DOOR_SPECIAL = 3
DOOR_IGNORED = 4
DOOR_ATALAB = 5
DOORS = {
	[DOOR_PUBLIC] = "Public",
	[DOOR_BUYABLE] = "Buyable",
	[DOOR_SPECIAL] = "Combine",
	[DOOR_IGNORED] = "Ignored",
	[DOOR_ATALAB] = "ATA Access"
}

SKINTONE_WHITE = 0
SKINTONE_BLACK = 1
PERMISSIONS = {}
local function AddPlayerPermission(id, perm, name, icon)
	local var = "PERMISSION_" .. string.upper(perm)
	_G[var] = id
	_G.PERMISSIONS[id] = {
		Name = name,
		Perm = perm,
		Material = Material(icon)
	}
end

AddPlayerPermission(1, "events", "Event Command Access", "icon16/report.png")
AddPlayerPermission(2, "observer", "Observer Mode Access", "icon16/weather_clouds.png")
AddPlayerPermission(3, "music", "Music Command Access", "icon16/music.png")
AddPlayerPermission(4, "vehicles", "Generic Vehicle Access", "icon16/car.png")
AddPlayerPermission(5, "cmbvehicles", "Combine Vehicle Access", "icon16/cart.png")
AddPlayerPermission(6, "customitems", "Custom Items Access", "icon16/sport_8ball.png")
DONATORPACKAGES = {}
local function AddDonatorPackage(id, package, name, icon, credits)
	local var = "DONATORPACKAGE_" .. string.upper(package)
	_G[var] = id
	_G.DONATORPACKAGES[id] = {
		Package = package,
		Name = name,
		Material = Material(icon),
		Credits = credits
	}
end

AddDonatorPackage(1, "bronze", "Bronze Contributor", "icon16/award_star_bronze_2.png", 50)
AddDonatorPackage(2, "silver", "Silver Contributor", "icon16/award_star_silver_2.png", 100)
AddDonatorPackage(3, "gold", "Gold Contributor", "icon16/award_star_gold_2.png", 200)
BADGES = {}
local badges = 1
local function AddBadge(badge, name, material)
	local var = "BADGE_" .. string.upper(badge)
	_G[var] = badges
	_G.BADGES[badges] = {
		Badge = badge,
		Name = name,
		Material = material
	}

	badges = badges + 1
end

AddBadge("developer_bughunter", "Bug Hunter", Material("icon16/bug.png"))
AddBadge("developer_betatest", "Beta Tester", Material("icon16/controller.png"))
WORLDAREAS = {}
local worldareas = 1
local function AddWorldArea(name, fancy, address)
	local var = "WORLDAREA_" .. string.upper(name)
	_G[var] = worldareas
	_G.WORLDAREAS[worldareas] = {
		Name = name,
		Fancy = fancy,
		Address = address
	}

	worldareas = worldareas + 1
end

AddWorldArea("none", "None", "51.81.120.189:27016")
AddWorldArea("city", "City", "51.81.120.188:27015")
AddWorldArea("canals", "Canals", "51.81.120.185:27017")
AddWorldArea("outlands", "Outlands", "51.81.120.188:27016")
LICENSES = {}
local licenses = 1
local function AddLicense(license, name, price, city)
	local var = "LICENSE_" .. string.upper(license)
	_G[var] = licenses
	_G.LICENSES[licenses] = {
		License = license,
		Name = name,
		Price = price,
		City = city
	}

	licenses = licenses + 1
end

AddLicense("food", "Food & Drinks")
AddLicense("clothing", "Clothing")
AddLicense("miscgoods", "Miscellaneous Goods")
AddLicense("medical", "Pharmaceutical Goods")
AddLicense("greymarket", "Grey Market")
AddLicense("blackmarket", "Black Market")

--[[----------------------------------------------------------------
	Name: SONG (SONG_)
	Desc: Defines song classes for the admin music menu.
-------------------------------------------------------------------]]
SONG_IDLE = 1
SONG_ALERT = 2
SONG_ACTION = 3
SONG_STINGER = 4
--[[----------------------------------------------------------------
	Name: LOOT_CLASSES (LOOT_)
	Desc: Defines loot classes for player lootable entities.
-------------------------------------------------------------------]]
LOOT_CLASSES = {}
local loot_classes = 1
local function AddLootClass(class, printname, delay, chance)
	local var = "LOOT_" .. string.upper(class)
	_G[var] = loot_classes
	_G.LOOT_CLASSES[loot_classes] = {
		PrintName = printname,
		LootDelay = delay,
		SuccessChance = chance,
		Items = {}
	}

	loot_classes = loot_classes + 1
end

AddLootClass("CRAFTING", "Crafting Resources", 7200, 0.6)
--[[----------------------------------------------------------------
	Name: LOOTWEIGHT (LOOTWEIGHT_)
	Desc: Defines the rarity for various lootable items.
-------------------------------------------------------------------]]
LOOTWEIGHT_COMMON = 50
LOOTWEIGHT_UNCOMMON = 40
LOOTWEIGHT_RARE = 30
LOOGWEIGHT_VERYRARE = 20
LOOTWEIGHT_LEGENDARY = 10
LOOTWEIGHT_IMPOSSIBLE = 0
--[[----------------------------------------------------------------
	Name: CRAFTING (CRAFTING_)
	Desc: Defines crafting groups for crafting entities.
-------------------------------------------------------------------]]
CRAFTING = {}
local crafting = 1
local function AddCrafting(category, printname, recipes)
	local var = "CRAFTING_" .. string.upper(category)
	_G[var] = crafting
	_G.CRAFTING[crafting] = {
		PrintName = printname,
		Recipes = recipes
	}

	crafting = crafting + 1
end

AddCrafting("GUNSMITH", "Weapon Crafting", {
	["weapon_firearm_sawnoff"] = {
		["weapon_firearm_doublebarrel"] = 1,
		["tool_saw"] = 1,
		Returns = {
			["tool_saw"] = 1,
		}
	},
})

AddCrafting("GENERIC", "General Crafting", {
	["weapon_throwable_firebomb"] = {
		["drug_whiskey"] = 1,
		["crafting_cloth"] = 1
	},
	["weapon_throwable_pipebomb"] = {
		["crafting_refinedmetal"] = 2,
		["crafting_nails"] = 3,
		["crafting_gpredexplosive"] = 1,
	},
	["clothing_mask_cigarette_homemade"] = {
		["crafting_oil"] = 1,
		["crafting_rollingpaper"] = 1
	},
	["weapon_melee_knife_bottle"] = {
		["drug_alcohol"] = 1,
	},
	["weapon_melee_pipe"] = {
		["crafting_nail"] = 2,
		["crafting_scrapmetal"] = 1,
	},
	["rationparcel_standard"] = {
		["crafting_foodprocessorcoin"] = 1,
		["crafting_foodprocessorinjector"] = 1,
		["crafting_foodprocessorliquid"] = 1,
		["crafting_foodprocessormeal"] = 1,
		["crafting_foodprocessorpackage"] = 1,
	},
	["crafting_cleaningfoam"] = {
		["crafting_xenfluid"] = 1,
		["crafting_disinfectant"] = 1,
	},
	["crafting_gasfilter"] = {
		["crafting_plastic"] = 3,
		["crafting_disinfectant"] = 1,
		["crafting_rubber"] = 1,
	},
	["crafting_ironbar"] = {
		["crafting_coal"] = 1,
		["crafting_ironrock"] = 1,
	}
})

AddCrafting("COOKEDFOOD", "Food Preparation", {
	["food_antliongib_cooked"] = {
		["food_antliongib"] = 1,
		["tool_pan"] = 1,
		Returns = {
			["tool_pan"] = 1,
		}
	},
	["food_sardines_cooked"] = {
		["food_sardines"] = 1
	},
	["food_bread"] = {
		["food_flour"] = 1
	}
})

TOOLTRUST_BANNED = -1
TOOLTRUST_BASIC = 0
TOOLTRUST_ADVANCED = 1
HPTYPE_BAR = 1
HPTYPE_HEARTBEAT = 2
-- ARTYPE_BAR			= 1
CCOLORS_DEFAULT = 1
CCOLORS_CUSTOM = 2
ITEMTYPE_LABEL = 1
ITEMTYPE_GLOW = 2
ITEMTYPE_BOTH = 3
AMMOTYPE_SINGLE = 1
AMMOTYPE_DOUBLE = 2
FIRETYPE_MODE = 1
FIRETYPE_AMMO = 2
FIRETYPE_BOTH = 3
USERGROUPS = {}
local function AddUsergroup(id, name, title)
	local var = "USERGROUP_" .. string.upper(name)
	_G[var] = id
	_G.USERGROUPS[id] = {
		Name = name,
		Title = title
	}
end

AddUsergroup(0, "user", "Player")
AddUsergroup(0, "player", "Player")
AddUsergroup(1, "admin", "Administrator")
AddUsergroup(2, "sa", "Super Administrator")
AddUsergroup(2, "superadmin", "Super Administrator")
AddUsergroup(3, "dev", "Eternity Developer")
AddUsergroup(3, "developer", "Eternity Developer")
AddUsergroup(4, "rda", "Roleplayer Department Administrator")
AddUsergroup(5, "sea", "Senior Executive Administrator")
CFLAG_CHECKIMMUNITY = 1
CFLAG_FORCESINGLETARGET = 2
CFLAG_NOSELFTARGET = 3
CFLAG_FORCENICK = 4
CFLAG_NOCONSOLE = 5
CFLAG_NOADMIN = 6
RADIOSETS = {}
local radiosets = 0
local function AddRadioPreset(name, title)
	local var = "RADIOSET_" .. string.upper(name)
	local frequency = radiosets + 1000
	_G[var] = frequency
	_G.RADIOSETS[frequency] = {
		Frequency = frequency,
		Name = name,
		Title = title
	}

	radiosets = radiosets + 1
end

AddRadioPreset("CCAMAIN", "CCA-MAIN")
AddRadioPreset("CCATACA", "CCA-TAC1")
AddRadioPreset("CCATACB", "CCA-TAC2")
AddRadioPreset("COTAMAIN", "COTA-MAIN")
AddRadioPreset("COTATACA", "COTA-TAC1")
AddRadioPreset("COTATACB", "COTA-TAC2")
AddRadioPreset("WORKERMAIN", "CMC-MAIN")
AddRadioPreset("WORKERA", "CEC")
AddRadioPreset("WORKERB", "CIC")
AddRadioPreset("ADMINSMAIN", "CA-MAIN")
AddRadioPreset("ADMINSALT", "CA-INTERNAL")
AddRadioPreset("INTELMAIN", "VOID-MAIN")
AddRadioPreset("INTELOPA", "VOID-1")
AddRadioPreset("INTELOPB", "VOID-2")
RADIOGROUPS = {}
local radiogroups = 0
local function AddRadioGroup(name)
	local var = "RADIOGROUP_" .. string.upper(name)
	_G[var] = radiogroups
	_G.RADIOGROUPS[radiogroups] = {
		Name = name
	}

	radiogroups = radiogroups + 1
end

AddRadioGroup("cca")
AddRadioGroup("cota")
AddRadioGroup("intel")
AddRadioGroup("ca")
CHATINDICATOR_NONE = 0
CHATINDICATOR_TYPING = 1
CHATINDICATOR_RADIOING = 2
-- These indexes map to the enums just above
CHATINDICATORS = {"Typing...", "Radioing..."}
LOG_NONE = 0
LOG_SECURITY = 1
LOG_SANDBOX = 2
LOG_ITEMS = 3
LOG_CHARACTER = 4
LOG_CHAT = 5
LOG_ADMIN = 6
LOG_DEVELOPER = 7
LOG_COMBINE = 8
CONSCIOUSNESS_HURT_GENERIC = 0
CONSCIOUSNESS_HURT_GAS = 1
META_CHAR = 1
META_ITEM = 2
META_PLY = 3
PERMAPROP_CLASSES = {
	["prop_physics"] = true,
	["prop_effect"] = true,
	["edit_fog"] = true,
	["edit_sky"] = true,
	["edit_sun"] = true
}

SEEALL_PROPS_NEVER = 1
SEEALL_PROPS_PHYS = 2
SEEALL_PROPS_ALWAYS = 3
PHYSGUNMODE_DEFAULT = 1
PHYSGUNMODE_RAINBOW_CLASSIC = 2
PHYSGUNMODE_RAINBOW_NEW = 3
PROPOWNER_NAME = 1
PROPOWNER_STEAMID = 2
PROPOWNER_BOTH = 3
TAB_LOOC = 2 ^ 1
TAB_OOC = 2 ^ 2
TAB_IC = 2 ^ 3
TAB_ADMIN = 2 ^ 4
TAB_PM = 2 ^ 5
TAB_RADIO = 2 ^ 6
TAB_NOTICE = 2 ^ 7
TAB_GIC = 2 ^ 8
ARMOR_NONE = 0
ARMOR_BASIC = 1
ARMOR_LIGHT = 2
ARMOR_HEAVY = 3
ARMOR_SUPER = 4
ARMOR_ELITE = 5
-- D_NU: Will only fire if their equipment has ITEM.TriggersNPCs
-- D_LI: Don't fire unless they piss us off first
-- D_HT: Kill
RELATIONSHIP_METROPOLICE = {
	[TEAM_CITIZENS] = D_NU,
	[TEAM_ENGINEERS] = D_LI,
	[TEAM_INFCON] = D_LI,
	[TEAM_POLICE] = D_LI,
	[TEAM_LOWERADMIN] = D_LI,
	[TEAM_MIDDLEADMIN] = D_LI,
	[TEAM_COMBINEADMIN] = D_LI,
	[TEAM_OUTERRES] = D_HT,
	[TEAM_SCIENTIST] = D_LI,
	[TEAM_INSPECTORS] = D_LI,
	[TEAM_OVERWATCH] = D_LI,
	[TEAM_AIRWATCH] = D_LI,
	[TEAM_VORTIGAUNT] = D_HT,
	[TEAM_RACEX] = D_HT,
	[TEAM_EVENTCHAR] = D_LI,
}

RELATIONSHIP_ZOMBIES = {
	[TEAM_CITIZENS] = D_HT,
	[TEAM_ENGINEERS] = D_HT,
	[TEAM_INFCON] = DD_HT,
	[TEAM_POLICE] = D_HT,
	[TEAM_LOWERADMIN] = D_HT,
	[TEAM_MIDDLEADMIN] = D_HT,
	[TEAM_COMBINEADMIN] = D_HT,
	[TEAM_OUTERRES] = D_HT,
	[TEAM_SCIENTIST] = D_HT,
	[TEAM_INSPECTORS] = D_HT,
	[TEAM_OVERWATCH] = D_HT,
	[TEAM_AIRWATCH] = D_HT,
	[TEAM_VORTIGAUNT] = D_HT,
	[TEAM_RACEX] = D_LI,
	[TEAM_EVENTCHAR] = D_LI,
}

RELATIONSHIP_COMBINESOLDIER = {
	[TEAM_CITIZENS] = D_NU,
	[TEAM_ENGINEERS] = D_NU,
	[TEAM_INFCON] = D_NU,
	[TEAM_POLICE] = D_LI,
	[TEAM_LOWERADMIN] = D_LI,
	[TEAM_MIDDLEADMIN] = D_LI,
	[TEAM_COMBINEADMIN] = D_LI,
	[TEAM_OUTERRES] = D_HT,
	[TEAM_SCIENTIST] = D_LI,
	[TEAM_INSPECTORS] = D_LI,
	[TEAM_OVERWATCH] = D_LI,
	[TEAM_AIRWATCH] = D_LI,
	[TEAM_VORTIGAUNT] = D_HT,
	[TEAM_RACEX] = D_HT,
	[TEAM_EVENTCHAR] = D_LI,
}

RELATIONSHIP_COMBINETURRET = {
	[TEAM_CITIZENS] = D_HT,
	[TEAM_ENGINEERS] = D_LI,
	[TEAM_INFCON] = D_LI,
	[TEAM_POLICE] = D_LI,
	[TEAM_LOWERADMIN] = D_LI,
	[TEAM_MIDDLEADMIN] = D_LI,
	[TEAM_COMBINEADMIN] = D_LI,
	[TEAM_OUTERRES] = D_HT,
	[TEAM_SCIENTIST] = D_LI,
	[TEAM_INSPECTORS] = D_LI,
	[TEAM_OVERWATCH] = D_LI,
	[TEAM_AIRWATCH] = D_LI,
	[TEAM_VORTIGAUNT] = D_HT,
	[TEAM_RACEX] = D_HT,
	[TEAM_EVENTCHAR] = D_LI,
}

RELATIONSHIP_COMBINESYNTH = {
	[TEAM_CITIZENS] = D_HT,
	[TEAM_ENGINEERS] = D_NU,
	[TEAM_INFCON] = D_NU,
	[TEAM_POLICE] = D_LI,
	[TEAM_LOWERADMIN] = D_LI,
	[TEAM_MIDDLEADMIN] = D_LI,
	[TEAM_COMBINEADMIN] = D_LI,
	[TEAM_OUTERRES] = D_LI,
	[TEAM_SCIENTIST] = D_LI,
	[TEAM_INSPECTORS] = D_LI,
	[TEAM_OVERWATCH] = D_LI,
	[TEAM_AIRWATCH] = D_LI,
	[TEAM_VORTIGAUNT] = D_HT,
	[TEAM_RACEX] = D_HT,
	[TEAM_EVENTCHAR] = D_LI,
}

RELATIONSHIP_XENIAN = {
	[TEAM_CITIZENS] = D_HT,
	[TEAM_ENGINEERS] = D_HT,
	[TEAM_INFCON] = D_HT,
	[TEAM_POLICE] = D_HT,
	[TEAM_LOWERADMIN] = D_HT,
	[TEAM_MIDDLEADMIN] = D_HT,
	[TEAM_COMBINEADMIN] = D_HT,
	[TEAM_OUTERRES] = D_HT,
	[TEAM_SCIENTIST] = D_HT,
	[TEAM_INSPECTORS] = D_HT,
	[TEAM_OVERWATCH] = DD_HT,
	[TEAM_AIRWATCH] = D_HT,
	[TEAM_VORTIGAUNT] = D_HT,
	[TEAM_RACEX] = D_LI,
	[TEAM_EVENTCHAR] = D_LI,
}

RELATIONSHIP_RESISTANCE = {
	[TEAM_CITIZENS] = D_LI,
	[TEAM_ENGINEERS] = D_LI,
	[TEAM_INFCON] = D_LI,
	[TEAM_POLICE] = D_HT,
	[TEAM_LOWERADMIN] = D_HT,
	[TEAM_MIDDLEADMIN] = D_HT,
	[TEAM_COMBINEADMIN] = D_HT,
	[TEAM_OUTERRES] = D_LI,
	[TEAM_SCIENTIST] = D_HT,
	[TEAM_INSPECTORS] = D_HT,
	[TEAM_OVERWATCH] = D_HT,
	[TEAM_AIRWATCH] = D_HT,
	[TEAM_VORTIGAUNT] = D_LI,
	[TEAM_RACEX] = D_HT,
	[TEAM_EVENTCHAR] = D_LI,
}

RELATIONSHIP_SYNTHSOLDIER = {
	[TEAM_CITIZENS] = D_HT,
	[TEAM_ENGINEERS] = D_HT,
	[TEAM_INFCON] = D_HT,
	[TEAM_POLICE] = D_LI,
	[TEAM_LOWERADMIN] = D_LI,
	[TEAM_MIDDLEADMIN] = D_LI,
	[TEAM_COMBINEADMIN] = D_LI,
	[TEAM_OUTERRES] = D_HT,
	[TEAM_SCIENTIST] = D_LI,
	[TEAM_INSPECTORS] = D_LI,
	[TEAM_OVERWATCH] = D_LI,
	[TEAM_AIRWATCH] = D_LI,
	[TEAM_VORTIGAUNT] = D_HT,
	[TEAM_RACEX] = D_HT,
	[TEAM_EVENTCHAR] = D_LI,
}

THROW_NORMAL = 1
THROW_ROLL = 2
THROW_LOB = 3
EXPLOSION_SPNKR = 1
EXPLOSION_40MM = 2