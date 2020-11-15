---------------------------------------------------------------------------------------------------
-- func: addalltrusts
-- desc: Adds all trust spells to the given target. If no target then to the current player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/commands")

cmdprops =
{
    permission = 1,
    parameters = "t"
}

function onTrigger(caller, entity, target)
    local ValidSpells =
    {
        896,897,898,899,900,901,902,903,904,905,906,907,908,909,910,911,912,913,914,915,916,917,918,919,920,
        921,922,923,924,925,926,927,928,929,930,931,932,933,934,935,936,937,938,939,940,941,942,943,944,945,
        946,947,948,949,950,951,952,953,954,955,956,957,958,959,960,961,962,963,964,965,966,967,968,969,970,
        971,972,973,974,975,976,977,978,979,980,981,982,983,984,985,986,987,1004,1005,1006,1007,1008,1009,
        1010,1011,1012,1013,1014,1015,1016
    }

    local targ = tpz.commands.getTargetPC(caller, entity, target)
    local usage = "addalltrusts {player}"
    
    if (targ == nil) then
        tpz.commands.error(caller, entity, "You must target or enter a player name.", usage)
        return
    end

    -- add all spells
    local save = true
    local silent = true    -- prevent packet spam
    for i = 1, #ValidSpells do
        if i == #ValidSpells then
            silent = false
        end
        targ:addSpell(ValidSpells[i], silent, save)
    end

    tpz.commands.print(caller, entity, string.format("%s now has all spells.", targ:getName()))
end
