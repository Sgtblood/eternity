local meta = FindMetaTable("Player")

function GM:GetLootPool(pool)
	return LOOT_CLASSES[pool]
end

function GM:IsLootPoolValid(pool)
	return self:GetLootPool(pool) ~= nil
end

function GM:IsLootPoolSearchable(pool)
  return self:IsLootPoolValid(pool) and not table.IsEmpty(self:GetLootPool(pool).Items)
end

function GM:GetSearchableLootPools()
  local searchable = {}

  for _,pool in pairs(table.GetKeys(LOOT_CLASSES)) do
    if not self:IsLootPoolSearchable(pool) then
      continue
    end

    table.insert(searchable, pool)
  end
  
  return searchable
end

function GM:GetLootPoolName(pool, default)
  if self:IsLootPoolValid(pool) then
    return self:GetLootPool(pool).PrintName
  end

	return default and default or nil
end

function GM:GetLootPoolDelay(pool, default)
  if self:IsLootPoolValid(pool) then
    return self:GetLootPool(pool).LootDelay
  end

	return default and default or 0
end

function GM:AddItemToLootPool(pool, class, weight, min, max)
	if not self:IsLootPoolValid(pool) then
		return
	end

	table.insert(self:GetLootPool(pool).Items, {
		Class				= class,
		Weight			= weight,
		StackMin		= min,
		StackMax		= max
	})
end

function GM:GetRandomFromLootPool(pool)
  if not self:IsLootPoolSearchable(pool) then
    return nil
  end

	local items = self:GetLootPool(pool).Items
	local weights = 0

	for _, item in pairs(items) do
		weights = weights + item.Weight
	end

	local roll = math.random(1, weights)
	local selection = nil

	for _, item in pairs(items) do
		roll = roll - item.Weight
			
		if roll <= 0 then
			selection = item
			break
		end
	end

	return selection
end

function meta:RollAgainstLootPool(pool)
  if not GAMEMODE:IsLootPoolValid(pool) then
    return false
  end

	return math.Rand(0, 1) > GAMEMODE:GetLootPool(pool).SuccessChance
end
