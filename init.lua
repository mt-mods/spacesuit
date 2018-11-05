
spacesuit = {
	armor_use = tonumber(minetest.settings:get("spacesuit.armor_use")) or 150,
}


local MP = minetest.get_modpath("spacesuit")

dofile(MP.."/suit.lua")
dofile(MP.."/crafts.lua")
dofile(MP.."/drowning.lua")



print("[OK] Spacesuit")
