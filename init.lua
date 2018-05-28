

minetest.register_tool("spacesuit:helmet", {
	description = "Spacesuit Helmet",
	inventory_image = "spacesuit_inv_helmet.png",
	groups = {armor_head=5, armor_heal=1, armor_use=75},
	wear = 0,
})

minetest.register_tool("spacesuit:chestplate", {
	description = "Spacesuit Chestplate",
	inventory_image = "spacesuit_inv_chestplate.png",
	groups = {armor_torso=8, armor_heal=1, armor_use=75},
	wear = 0,
})

minetest.register_tool("spacesuit:pants", {
	description = "Spacesuit Pants",
	inventory_image = "spacesuit_inv_pants.png",
	groups = {armor_legs=7, armor_heal=1, armor_use=75},
	wear = 0,
})

minetest.register_tool("spacesuit:boots", {
	description = "Spacesuit Boots",
	inventory_image = "spacesuit_inv_boots.png",
	groups = {armor_feet=4, armor_heal=1, armor_use=75},
	wear = 0,
})


minetest.register_craft({
	output = "spacesuit:helmet",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:glass", "default:steel_ingot"},
		{"wool:white", "default:steelblock", "wool:white"},
	},
})

minetest.register_craft({
	output = "spacesuit:chestplate",
	recipe = {
		{"default:steel_ingot", "default:mese", "default:steel_ingot"},
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"default:steel_ingot", "wool:white", "default:steel_ingot"}
	},
})

minetest.register_craft({
	output = "spacesuit:pants",
	recipe = {
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"wool:white", "wool:white", "wool:white"}
	},
})

minetest.register_craft({
	output = "spacesuit:boots",
	recipe = {
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"default:steel_ingot", "default:steelblock", "default:steel_ingot"},
	},
})


local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 2 then

		for _,player in ipairs(minetest.get_connected_players()) do
			local name = player:get_player_name()
			local inv = player:get_inventory()

			local name, armor_inv = armor.get_valid_player(armor, player, "[spacesuit]")
			local has_helmet = armor_inv:contains_item("armor", "spacesuit:helmet")
			local has_chestplate = armor_inv:contains_item("armor", "spacesuit:chestplate")
			local has_pants = armor_inv:contains_item("armor", "spacesuit:pants")
			local has_boots = armor_inv:contains_item("armor", "spacesuit:boots")

			if has_helmet and has_chestplate and has_pants and has_boots then
				player:set_breath(10)
			end
		end
		timer = 0
	end
end)


print("[OK] Spacesuit")