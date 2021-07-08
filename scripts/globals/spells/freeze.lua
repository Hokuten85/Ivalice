-----------------------------------
-- Spell: Freeze
-- Deals ice damage to an enemy and lowers its resistance against fire.
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
    
    if (caster:isPC() or caster:getObjType() == xi.objType.TRUST) then
        spellParams = calculateElementalNukeSpellParams(caster, ANCIENT_MAGIC, NOT_AOE);
    else
        spellParams.hasMultipleTargetReduction = false
        spellParams.resistBonus = 1.0
        spellParams.V = 526
        spellParams.V0 = 700
        spellParams.V50 = 800
        spellParams.V100 = 900
        spellParams.V200 = 1100
        spellParams.M = 2
        spellParams.M0 = 2
        spellParams.M50 = 2
        spellParams.M100 = 2
        spellParams.M200 = 2
        spellParams.I = 552   
    end
    
    -- no point in making a separate function for this if the only thing they won't have in common is the name
    handleNinjutsuDebuff(caster, target, spell, 30, 10, xi.mod.FIRE_RES)

    return doElementalNuke(caster, spell, target, spellParams)
end

return spell_object
