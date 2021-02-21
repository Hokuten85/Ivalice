-----------------------------------
-- Spell: Boost-MND
--     Boosts MND for Allies in AoE
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    local effect = tpz.effect.MND_BOOST
    doBoostGain(caster, target, spell, effect)
    return effect
end

return spell_object
