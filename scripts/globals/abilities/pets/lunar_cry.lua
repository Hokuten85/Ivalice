-----------------------------------
-- Aerial Armor
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onPetAbility = function(target, pet, skill)
    local moon = VanadielMoonPhase()
    local buffvalue = 0
    if moon > 90 then
        buffvalue = 31
    elseif moon > 75 then
        buffvalue = 26
    elseif moon > 60 then
        buffvalue = 21;
    else
        buffvalue = 16;
    end
    target:delStatusEffect(tpz.effect.ACCURACY_DOWN)
    target:delStatusEffect(tpz.effect.EVASION_DOWN)
    target:addStatusEffect(tpz.effect.ACCURACY_DOWN, buffvalue, 0, 180)
    target:addStatusEffect(tpz.effect.EVASION_DOWN, buffvalue, 0, 180)
    skill:setMsg(tpz.msg.basic.NONE)
    return 0
end

return ability_object
