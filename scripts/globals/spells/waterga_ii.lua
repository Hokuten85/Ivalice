-----------------------------------
-- Spell: Waterga II
-- Deals water damage to enemies within area of effect.
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    local spellParams = {}

    if (caster:isPC() or caster:getObjType() == tpz.objType.TRUST) then
        spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_2, AOE);
    else
        spellParams.hasMultipleTargetReduction = true
        spellParams.resistBonus = 1.0
        spellParams.V = 232
        spellParams.V0 = 280
        spellParams.V50 = 465
        spellParams.V100 = 610
        spellParams.V200 = 805
        spellParams.M = 1
        spellParams.M0 = 3.7
        spellParams.M50 = 2.9
        spellParams.M100 = 1.95
        spellParams.M200 = 1
        spellParams.I = 266
    end    

    return doElementalNuke(caster, spell, target, spellParams)
end

return spell_object
