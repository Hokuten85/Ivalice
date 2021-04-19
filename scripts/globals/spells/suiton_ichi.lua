-----------------------------------
-- Spell: Suiton: Ichi
-- Deals water damage to an enemy and lowers its resistance against lightning.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    --doNinjutsuNuke(V, M, caster, spell, target, hasMultipleTargetReduction, resistBonus)
    local duration = 15 + caster:getMerit(xi.merit.SUITON_EFFECT) -- T1 bonus debuff duration
    local bonusAcc = 0
    local bonusMab = caster:getMerit(xi.merit.SUITON_EFFECT) -- T1 mag atk

    local params = {}

    params.dmg = 28;

    params.multiplier = 0.5

    params.hasMultipleTargetReduction = false

    params.resistBonus = bonusAcc

    params.bonusmab = bonusMab

    dmg = doNinjutsuNuke(caster, target, spell, params)
    handleNinjutsuDebuff(caster, target, spell, 30, duration, xi.mod.THUNDERRES)

    return dmg
end

return spell_object
