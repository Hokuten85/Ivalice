-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Goblin Ambusher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 631, 2, tpz.regime.type.GROUNDS)
    tpz.regime.checkRegime(player, mob, 633, 1, tpz.regime.type.GROUNDS)
end

return entity
