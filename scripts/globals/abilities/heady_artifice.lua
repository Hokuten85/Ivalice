-----------------------------------
-- Ability: Heady Artifice
-- Description: Allows automatons to perform a special ability that varies with the head used.
-- Obtained: PUP Level 96
-- Recast Time: 01:00:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    target:addStatusEffect(xi.effect.HEADY_ARTIFICE, 18, 1, 1)
end

return ability_object
