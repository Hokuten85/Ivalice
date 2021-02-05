-----------------------------------
-- Ability: Monk's Roll
-- Enhances "Subtle Blow" effect for party members within area of effect
-- Optimal Job: Monk
-- Lucky Number: 3
-- Unlucky Number: 7
-- Level: 31
-- Phantom Roll +1 Value: 4
--
-- Die Roll    |No MNK  |With MNK
-- --------    -------- -----------
-- 1           |+8      |+18
-- 2           |+10     |+20
-- 3           |+32     |+42
-- 4           |+12     |+22
-- 5           |+14     |+24
-- 6           |+16     |+26
-- 7           |+4      |+14
-- 8           |+20     |+30
-- 9           |+22     |+32
-- 10          |+24     |+34
-- 11          |+40     |+50
-- Bust        |-11     |-11
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
corsair = require("scripts/globals/job_utils/corsair")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    local effectID = tpz.effect.MONKS_ROLL
    ability:setRange(ability:getRange() + player:getMod(tpz.mod.ROLL_RANGE))
    if (player:hasStatusEffect(effectID)) then
        return tpz.msg.basic.ROLL_ALREADY_ACTIVE, 0
    elseif atMaxCorsairBusts(player) then
        return tpz.msg.basic.CANNOT_PERFORM, 0
    else
        return 0, 0
    end
end

ability_object.onUseAbility = function(caster, target, ability, action)
    if (caster:getID() == target:getID()) then
        corsairSetup(caster, ability, action, tpz.effect.MONKS_ROLL, tpz.job.MNK)
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return corsair.applyRoll(caster, target, ability, action, total)
end

return ability_object
