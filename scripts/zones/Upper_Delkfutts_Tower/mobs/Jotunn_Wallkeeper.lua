-----------------------------------
-- Area: Upper Delkfutt's Tower
--  Mob: Jotunn Wallkeeper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 786, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 789, 2, xi.regime.type.GROUNDS)
end

return entity
