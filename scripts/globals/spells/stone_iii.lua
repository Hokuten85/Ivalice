-----------------------------------------
-- Spell: Stone III
-- Deals earth damage to an enemy.
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
        spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_3, NOT_AOE);
    else
        spellParams.hasMultipleTargetReduction = false
        spellParams.resistBonus = 1.0
        spellParams.V = 210
        spellParams.V0 = 200
        spellParams.V50 = 400
        spellParams.V100 = 550
        spellParams.V200 = 750
        spellParams.M = 1.5
        spellParams.M0 = 4
        spellParams.M50 = 3
        spellParams.M100 = 2
        spellParams.M200 = 1
        spellParams.I = 236
    end    

    return doElementalNuke(caster, spell, target, spellParams)
end
