-----------------------------------
-- Ability: Fire Maneuver
-- Enhances the effect of fire attachments. Must have animator equipped.
-- Obtained: Puppetmaster level 1
-- Recast Time: 10 seconds (shared with all maneuvers)
-- Duration: 1 minute
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    if (player:getWeaponSubSkillType(tpz.slot.RANGED) == 10 and
        not player:hasStatusEffect(tpz.effect.OVERLOAD) and
        player:getPet()) then
        return 0, 0
    else
        return 71, 0
    end
end

ability_object.onUseAbility = function(player, target, ability)

    local burden = 10
    if (target:getStat(tpz.mod.STR) < target:getPet():getStat(tpz.mod.STR)) then
        burden = 15
    end

    local overload = target:addBurden(tpz.magic.ele.FIRE-1, burden)

    if (overload ~= 0 and
        (player:getMod(tpz.mod.PREVENT_OVERLOAD) > 0 or player:getPet():getMod(tpz.mod.PREVENT_OVERLOAD) > 0) and
        player:delStatusEffectSilent(tpz.effect.WATER_MANEUVER)) then
        overload = 0
    end

    if (overload ~= 0) then
        target:removeAllManeuvers()
        target:addStatusEffect(tpz.effect.OVERLOAD, 0, 0, overload)
    else
        local level
        if (target:getMainJob() == tpz.job.PUP) then
            level = target:getMainLvl()
        else
            level = target:getSubLvl()
        end

        local bonus = 1 + (level/15) + target:getMod(tpz.mod.MANEUVER_BONUS)

        if (target:getActiveManeuvers() == 4) then
            target:removeOldestManeuver()
        end

        local dur = player:getPet():getLocalVar("MANEUVER_DURATION")
        target:addStatusEffect(tpz.effect.FIRE_MANEUVER, bonus, 0, utils.clamp(dur, 60, 300))

    end

    return tpz.effect.FIRE_MANEUVER
end

return ability_object
