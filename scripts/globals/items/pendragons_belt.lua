-----------------------------------
-- ID: 15869
-- Item: pendragons_belt
-- Item Effect: DEX +10
-- Duration: 60 seconds
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local item_object = {}

item_object.onItemCheck = function(target)
    local effect = target:getStatusEffect(xi.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 15869 then
        target:delStatusEffect(xi.effect.ENCHANTMENT)
    end
    return 0
end

item_object.onItemUse = function(target)
    target:addStatusEffect(xi.effect.ENCHANTMENT, 0, 0, 60, 15869)
end

item_object.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, 10)
end

item_object.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, 10)
end

return item_object
