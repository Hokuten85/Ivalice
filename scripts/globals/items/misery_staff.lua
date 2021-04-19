-----------------------------------
-- ID: 17116
-- Item: Misery Staff
-- Additional Effect: Curse
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onAdditionalEffect = function(player, target, damage)
    local chance = 25

    if (math.random(0, 99) >= chance or applyResistanceAddEffect(player, target, xi.magic.ele.DARK, 0) <= 0.5) then
        return 0, 0, 0
    else
        target:addStatusEffect(xi.effect.CURSE_I, 5, 0, 30)
        return xi.subEffect.CURSE, xi.msg.basic.ADD_EFFECT_STATUS, xi.effect.CURSE_I
    end
end

return item_object
