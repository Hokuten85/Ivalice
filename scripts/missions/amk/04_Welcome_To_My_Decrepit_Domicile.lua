-----------------------------------
-- Welcome! To My Decrepit Domicile
-- A Moogle Kupo d'Etat M4
-- !addmission 10 3
-- Inconspicuous Door : !pos -15 1.300 68
-- Note: KI aquisition is handled in helm.lua
-----------------------------------
require('scripts/globals/missions')
require('scripts/globals/interaction/mission')
require('scripts/globals/zone')
-----------------------------------

local mission = Mission:new(xi.mission.log_id.AMK, xi.mission.id.amk.WELCOME_TO_MY_DECREPIT_DOMICILE)

mission.reward =
{
    nextMission = { xi.mission.log_id.AMK, xi.mission.id.amk.CURSES_A_HORRIFICALLY_HARROWING_HEX },
}

mission.sections =
{
    -- 0: Sturdy metal strip
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId and vars.Prog == 0
        end,

        [xi.zone.UPPER_JEUNO] =
        {
            ['Inconspicuous_Door'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.STURDY_METAL_STRIP) then
                        return mission:progressEvent(10179)
                    else
                        return mission:progressEvent(10186) -- Reminder
                    end
                end,
            },

            onEventFinish =
            {
                [10178] = function(player, csid, option, npc)
                    player:delKeyItem(xi.ki.STURDY_METAL_STRIP)
                    mission:setVar(player, 'Prog', 1)
                end,
            },
        },
    },

    -- 1: Piece of rugged tree bark
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId and vars.Prog == 1
        end,

        [xi.zone.UPPER_JEUNO] =
        {
            ['Inconspicuous_Door'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.PIECE_OF_RUGGED_TREE_BARK) then
                        return mission:progressEvent(10180)
                    else
                        return mission:progressEvent(10187) -- Reminder
                    end
                end,
            },

            onEventFinish =
            {
                [10178] = function(player, csid, option, npc)
                    player:delKeyItem(xi.ki.PIECE_OF_RUGGED_TREE_BARK)
                    mission:setVar(player, 'Prog', 2)
                end,
            },
        },
    },

    -- 2: Savory lamb roast
    {
        check = function(player, currentMission, missionStatus, vars)
            return currentMission == mission.missionId and vars.Prog == 2
        end,

        [xi.zone.UPPER_JEUNO] =
        {
            ['Inconspicuous_Door'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.SAVORY_LAMB_ROAST) then
                        return mission:progressEvent(10181)
                    else
                        return mission:progressEvent(10188) -- Reminder
                    end
                end,
            },

            onEventFinish =
            {
                [10178] = function(player, csid, option, npc)
                    player:delKeyItem(xi.ki.SAVORY_LAMB_ROAST)
                    mission:complete(player)
                end,
            },
        },
    },
}

return mission
