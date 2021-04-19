-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Akbaba
-----------------------------------
require("scripts/globals/regimes")
require("scripts/quests/tutorial")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 31, 1, xi.regime.type.FIELDS)
    xi.tutorial.onMobDeath(player)
end

return entity
