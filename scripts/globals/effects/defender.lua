-----------------------------------
-- xi.effect.DEFENDER
-----------------------------------
require("scripts/globals/jobpoints")
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    local jpLevel = target:getJobPointLevel(xi.jp.DEFENDER_EFFECT)

    target:addMod(xi.mod.DEFP, 25)

    -- JP Bonus
    target:addMod(xi.mod.DEF, jpLevel * 3)
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    local jpLevel = target:getJobPointLevel(xi.jp.DEFENDER_EFFECT)

    target:delMod(xi.mod.DEF, jpLevel * 3)
    target:delMod(xi.mod.DEFP, 25)
end

return effect_object
