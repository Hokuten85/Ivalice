-----------------------------------
-- Spell: Windstorm
--     Changes the weather around target party member to "windy."
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/status")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    target:delStatusEffectSilent(tpz.effect.FIRESTORM)
    target:delStatusEffectSilent(tpz.effect.SANDSTORM)
    target:delStatusEffectSilent(tpz.effect.RAINSTORM)
    target:delStatusEffectSilent(tpz.effect.WINDSTORM)
    target:delStatusEffectSilent(tpz.effect.HAILSTORM)
    target:delStatusEffectSilent(tpz.effect.THUNDERSTORM)
    target:delStatusEffectSilent(tpz.effect.AURORASTORM)
    target:delStatusEffectSilent(tpz.effect.VOIDSTORM)

    local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    duration = calculateDurationForLvl(duration, 47, target:getMainLvl())

    local merit = caster:getMerit(tpz.merit.STORMSURGE)
    local power = 0
    if merit > 0 then
        power = merit + caster:getMod(tpz.mod.STORMSURGE_EFFECT) + 2
    end

    target:addStatusEffect(tpz.effect.WINDSTORM, power, 0, duration)

    return tpz.effect.WINDSTORM
end

return spell_object
