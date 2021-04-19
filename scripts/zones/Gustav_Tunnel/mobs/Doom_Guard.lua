-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Doom Guard
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 765, 2, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 767, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 768, 1, xi.regime.type.GROUNDS)
end

return entity
