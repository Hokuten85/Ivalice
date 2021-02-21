-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Yuhtunga Mandragora
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 124, 1, tpz.regime.type.FIELDS)
end

return entity
