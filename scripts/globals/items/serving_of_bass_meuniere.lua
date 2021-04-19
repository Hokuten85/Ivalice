-----------------------------------
-- ID: 4582
-- Item: serving_of_bass_meuniere
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health % 3 (cap 130)
-- Dexterity 3
-- Agility 3
-- Mind -3
-- Ranged ACC % 6
-- Ranged ACC Cap 15
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local result = 0
    if target:hasStatusEffect(xi.effect.FOOD) or target:hasStatusEffect(xi.effect.FIELD_SUPPORT_FOOD) then
        result = xi.msg.basic.IS_FULL
    end
    return result
end

item_object.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 4582)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FOOD_HPP, 3)
    target:addMod(xi.mod.FOOD_HP_CAP, 130)
    target:addMod(xi.mod.DEX, 3)
    target:addMod(xi.mod.AGI, 3)
    target:addMod(xi.mod.MND, -3)
    target:addMod(xi.mod.FOOD_RACCP, 6)
    target:addMod(xi.mod.FOOD_RACC_CAP, 15)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FOOD_HPP, 3)
    target:delMod(xi.mod.FOOD_HP_CAP, 130)
    target:delMod(xi.mod.DEX, 3)
    target:delMod(xi.mod.AGI, 3)
    target:delMod(xi.mod.MND, -3)
    target:delMod(xi.mod.FOOD_RACCP, 6)
    target:delMod(xi.mod.FOOD_RACC_CAP, 15)
end

return item_object
