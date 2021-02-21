-----------------------------------
-- Spell: Water II
-- Deals water damage to an enemy.
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
        spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_2, NOT_AOE);
    else
        spellParams.hasMultipleTargetReduction = false
        spellParams.resistBonus = 1.0
        spellParams.V = 95
        spellParams.V0 = 120
        spellParams.V50 = 260
        spellParams.V100 = 355
        spellParams.V200 = 455
        spellParams.M = 1
        spellParams.M0 = 2.8
        spellParams.M50 = 1.9
        spellParams.M100 = 1
        spellParams.M200 = 0
        spellParams.I = 113
    end    

    return doElementalNuke(caster, spell, target, spellParams)
end

return spell_object
