-----------------------------------
-- Judgment Bolt
-- Deals lightning elemental damage to enemies within area of effect.
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = 3
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 9, xi.magic.ele.THUNDER, dmgmod, TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.LIGHTNING, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.LIGHTNING)
    return dmg
end

return mobskill_object
