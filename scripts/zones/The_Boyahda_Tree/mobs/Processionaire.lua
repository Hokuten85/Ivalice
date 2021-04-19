-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Processionaire
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 724, 1, xi.regime.type.GROUNDS)
end

return entity
