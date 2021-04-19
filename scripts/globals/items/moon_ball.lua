-----------------------------------
-- ID: 4568
-- Item: moon_ball
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 3
-- Magic 3
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
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 4568)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 3)
    target:addMod(xi.mod.MP, 3)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 3)
    target:delMod(xi.mod.MP, 3)
end

return item_object
