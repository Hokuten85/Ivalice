-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Poison Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 85, 2, xi.regime.type.FIELDS)
end

return entity
