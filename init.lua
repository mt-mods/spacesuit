if minetest.get_modpath("default") then
	local stats = {
		space = { name="Space", armor=1, heal=0, use=75 },
	}
	local mats = {
		--PLACEHOLDER
		space="default:dirt",
	}
	for k, v in pairs(stats) do
		minetest.register_tool("moontest_spacesuit:helmet_"..k, {
			description = v.name.." Helmet",
			inventory_image = "moontest_spacesuit_inv_helmet_"..k..".png",
			groups = {armor_head=math.floor(5*v.armor), armor_heal=v.heal, armor_use=v.use},
			wear = 0,
		})
		minetest.register_tool("moontest_spacesuit:chestplate_"..k, {
			description = v.name.." Chestplate",
			inventory_image = "moontest_spacesuit_inv_chestplate_"..k..".png",
			groups = {armor_torso=math.floor(8*v.armor), armor_heal=v.heal, armor_use=v.use},
			wear = 0,
		})
		minetest.register_tool("moontest_spacesuit:pants_"..k, {
			description = v.name.." Pants",
			inventory_image = "moontest_spacesuit_inv_pants_"..k..".png",
			groups = {armor_legs=math.floor(7*v.armor), armor_heal=v.heal, armor_use=v.use},
			wear = 0,
		})
		minetest.register_tool("moontest_spacesuit:boots_"..k, {
			description = v.name.." Boots",
			inventory_image = "moontest_spacesuit_inv_boots_"..k..".png",
			groups = {armor_feet=math.floor(4*v.armor), armor_heal=v.heal, armor_use=v.use},
			wear = 0,
		})
	end
	for k, v in pairs(mats) do
		minetest.register_craft({
			output = "moontest_spacesuit:helmet_"..k,
			recipe = {
				{v, v, v},
				{v, "", v},
				{"", "", ""},
			},
		})
		minetest.register_craft({
			output = "moontest_spacesuit:chestplate_"..k,
			recipe = {
				{v, "", v},
				{v, v, v},
				{v, v, v},
			},
		})
		minetest.register_craft({
			output = "moontest_spacesuit:pants_"..k,
			recipe = {
				{v, v, v},
				{v, "", v},
				{v, "", v},
			},
		})
		minetest.register_craft({
			output = "moontest_spacesuit:boots_"..k,
			recipe = {
				{v, "", v},
				{v, "", v},
			},
		})
	end
end


--currently broken

minetest.register_globalstep(function(dtime)
	for _, player in ipairs(minetest.get_connected_players()) do
		if math.random() < 0.1 then -- spacesuit restores breath
			local name = player:get_player_name()
			local inv = player:get_inventory()
			if inv:contains_item("armor", "moontest_spacesuit:helmet_space") and inv:contains_item("armor", "moontest_spacesuit:chestplate_space") and inv:contains_item("armor", "moontest_spacesuit:pants_space") and inv:contains_item("armor", "moontest_spacesuit:boots_space") then
				player:set_breath(10)
			end
		end
	end
end)