-----------------------------------
-- Spell: Water V
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
        spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_5, NOT_AOE);
    else
        spellParams.hasMultipleTargetReduction = false
        spellParams.resistBonus = 1.0
        spellParams.V0 = 700
        spellParams.V50 = 980
        spellParams.V100 = 1217
        spellParams.V200 = 1612
        spellParams.M0 = 5.6
        spellParams.M50 = 4.74
        spellParams.M100 = 3.95
        spellParams.M200 = 3
    end

    return doElementalNuke(caster, spell, target, spellParams)
end

return spell_object
