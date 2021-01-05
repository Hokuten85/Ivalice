-----------------------------------------
-- Spell: Waterga III
-- Deals water damage to enemies within area of effect.
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
        spellParams.V = 480
        spellParams.V0 = 540
        spellParams.V50 = 775
        spellParams.V100 = 970
        spellParams.V200 = 1265
        spellParams.M = 1.5
        spellParams.M0 = 4.7
        spellParams.M50 = 3.9
        spellParams.M100 = 2.95
        spellParams.M200 = 2
        spellParams.I = 527
    end

    return doElementalNuke(caster, spell, target, spellParams)
end
