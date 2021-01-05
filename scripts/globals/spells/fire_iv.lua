-----------------------------------------
-- Spell: Fire IV
-- Deals fire damage to an enemy.
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
        spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_4, NOT_AOE);
    else
        spellParams.hasMultipleTargetReduction = false
        spellParams.resistBonus = 1.0
        spellParams.V = 472
        spellParams.V0 = 520
        spellParams.V50 = 730
        spellParams.V100 = 915
        spellParams.V200 = 1200
        spellParams.M = 2
        spellParams.M0 = 4.2
        spellParams.M50 = 3.7
        spellParams.M100 = 2.85
        spellParams.M200 = 2
        spellParams.I = 506
    end    

    return doElementalNuke(caster, spell, target, spellParams)
end
