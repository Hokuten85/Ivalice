-----------------------------------
-- Area: Beadeaux (254)
--   NM: Ge'Dha Evileye
-- !pos -238 1 -202 254
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.hunts.checkHunt(mob, player, 240)
end

return entity
