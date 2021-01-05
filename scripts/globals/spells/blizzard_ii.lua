-----------------------------------------
-- Spell: Blizzard II
-- Deals ice damage to an enemy.
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
        spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_2, NOT_AOE);
    else
        spellParams.hasMultipleTargetReduction = false
        spellParams.resistBonus = 1.0
        spellParams.V = 155
        spellParams.V0 = 180
        spellParams.V50 = 290
        spellParams.V100 = 370
        spellParams.V200 = 470
        spellParams.M = 1
        spellParams.M0 = 2.2
        spellParams.M50 = 1.6
        spellParams.M100 = 1
        spellParams.M200 = 0
        spellParams.I = 178    
    end

    return doElementalNuke(caster, spell, target, spellParams)
end
