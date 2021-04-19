-----------------------------------
-- Ecliptic Growl
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onPetAbility = function(target, pet, skill, summoner)
    local bonusTime = utils.clamp(summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 300 + bonusTime

    local moon = VanadielMoonPhase()
    local buffvalue = 0
    if moon > 90 then
        buffvalue = 10
    elseif moon > 75 then
        buffvalue = 9
    elseif moon > 60 then
        buffvalue = 8;
    else
        buffvalue = 7;
    end
    target:delStatusEffect(xi.effect.STR_BOOST)
    target:delStatusEffect(xi.effect.DEX_BOOST)
    target:delStatusEffect(xi.effect.VIT_BOOST)
    target:delStatusEffect(xi.effect.AGI_BOOST)
    target:delStatusEffect(xi.effect.MND_BOOST)
    target:delStatusEffect(xi.effect.CHR_BOOST)

    target:addStatusEffect(xi.effect.STR_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(xi.effect.DEX_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(xi.effect.VIT_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(xi.effect.AGI_BOOST, 8-buffvalue, 0, duration)
    target:addStatusEffect(xi.effect.INT_BOOST, 8-buffvalue, 0, duration)
    target:addStatusEffect(xi.effect.MND_BOOST, 8-buffvalue, 0, duration)
    target:addStatusEffect(xi.effect.CHR_BOOST, 8-buffvalue, 0, duration)
    skill:setMsg(xi.msg.basic.NONE)
    return 0
end

return ability_object
