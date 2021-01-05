-----------------------------------------
-- Spell: Stonega III
-- Deals earth damage to enemies within area of effect.
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
        spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_3, AOE);
    else
        spellParams.hasMultipleTargetReduction = true
        spellParams.resistBonus = 1.0
        spellParams.V = 434
        spellParams.V0 = 500
        spellParams.V50 = 750
        spellParams.V100 = 950
        spellParams.V200 = 1250
        spellParams.M = 1.5
        spellParams.M0 = 5
        spellParams.M50 = 4
        spellParams.M100 = 3
        spellParams.M200 = 2
        spellParams.I = 480
    end    

    return doElementalNuke(caster, spell, target, spellParams)
end
