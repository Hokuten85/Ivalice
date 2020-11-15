---------------------------------------------------------------------------------------------------
-- func: jail
-- desc: Sends the target player to jail. (Mordion Gaol)
---------------------------------------------------------------------------------------------------

require("scripts/globals/commands")

cmdprops =
{
    permission = 1,
    parameters = "tis"
}

function onTrigger(caller, entity, target, cellId, reason)
    local targ = tpz.commands.getTargetPC(caller, entity, target)
    local usage = "!jail {player}"

    if (targ == nil) then
        tpz.commands.error(caller, entity, "You must target or enter a player name.", usage)
        return
    end

    local jailCells =
    {
        -- Floor 1 (Bottom)
        {-620, 11,  660, 0},  {-180, 11,  660, 0}, {260, 11,  660, 0}, {700, 11,  660, 0},
        {-620, 11,  220, 0},  {-180, 11,  220, 0}, {260, 11,  220, 0}, {700, 11,  220, 0},
        {-620, 11, -220, 0},  {-180, 11, -220, 0}, {260, 11, -220, 0}, {700, 11, -220, 0},
        {-620, 11, -620, 0},  {-180, 11, -620, 0}, {260, 11, -620, 0}, {700, 11, -620, 0},

        -- Floor 2 (Top)
        {-620, -400,  660, 0},  {-180, -400,  660, 0}, {260, -400,  660, 0}, {700, -400,  660, 0},
        {-620, -400,  220, 0},  {-180, -400,  220, 0}, {260, -400,  220, 0}, {700, -400,  220, 0},
        {-620, -400, -220, 0},  {-180, -400, -220, 0}, {260, -400, -220, 0}, {700, -400, -220, 0},
        {-620, -400, -620, 0},  {-180, -400, -620, 0}, {260, -400, -620, 0}, {700, -400, -620, 0},
    }

    -- Validate the cell id..
    if (cellId == nil or cellId == 0 or cellId > 32) then
        cellId = 1
    end

    -- Validate the reason..
    if (reason == nil) then
        reason = "Unspecified."
    end

    -- Print that we have jailed someone..
    local message = string.format('%s jailed %s(%d) into cell %d. Reason: %s', player:getName(), target, targ:getID(), cellId, reason)
    printf(message)

    -- Send the target to jail..
    local dest = jailCells[cellId]
    targ:setCharVar("inJail", cellId)
    targ:setPos(dest[1], dest[2], dest[3], dest[4], 131)
end
