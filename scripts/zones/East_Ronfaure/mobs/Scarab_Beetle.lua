-----------------------------------
-- Area: East Ronfaure
--  Mob: Scarab Beetle
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 68, 2, tpz.regime.type.FIELDS)
end

return entity
