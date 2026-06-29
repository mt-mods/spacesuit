spacesuit = {
	armor_use = tonumber(core.settings:get("spacesuit.armor_use")) or 70,
}

local MP = core.get_modpath("spacesuit")

dofile(MP.."/suit.lua")
dofile(MP.."/crafts.lua")
dofile(MP.."/hud.lua")
dofile(MP.."/drowning.lua")
