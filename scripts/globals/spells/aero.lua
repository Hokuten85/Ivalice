-----------------------------------------
-- Spell: Aero
-- Deals wind damage to an enemy.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local spellParams = {}
    
    if (caster:isPC() or caster:getObjType() == tpz.objType.TRUST) then
        spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_1, NOT_AOE);
    else
        spellParams.hasMultipleTargetReduction = false
        spellParams.resistBonus = 1.0
        spellParams.V = 25
        spellParams.V0 = 40
        spellParams.V50 = 120
        spellParams.V100 = 170
        spellParams.V200 = 170
        spellParams.M = 1
        spellParams.M0 = 1.6
        spellParams.M50 = 1
        spellParams.M100 = 0
        spellParams.M200 = 0
        spellParams.I = 35
    end

    return doElementalNuke(caster, spell, target, spellParams)
end
