-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Goblin Leecher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 777, 2, tpz.regime.type.GROUNDS)
end

return entity
