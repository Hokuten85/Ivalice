-----------------------------------
-- Area: Arrapago Remnants
--  Mob: Lamia Dartist
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
end

function onMobDespawn(mob)
    local instance = mob:getInstance()
    if instance:getStage() == 1 then
        instance:setProgress(instance:getProgress() + 1)
    end
end

return entity
