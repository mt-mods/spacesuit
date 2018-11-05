


local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 2 then

		for _,player in ipairs(minetest.get_connected_players()) do
			local name = player:get_player_name()

			local name, armor_inv = armor.get_valid_player(armor, player, "[spacesuit]")
			local has_helmet = armor_inv:contains_item("armor", "spacesuit:helmet")
			local has_chestplate = armor_inv:contains_item("armor", "spacesuit:chestplate")
			local has_pants = armor_inv:contains_item("armor", "spacesuit:pants")
			local has_boots = armor_inv:contains_item("armor", "spacesuit:boots")

			if has_helmet and has_chestplate and has_pants and has_boots and player:get_breath() < 10 then

				for i, stack in pairs(armor_inv:get_list("armor")) do
					if not stack:is_empty() then
						local name = stack:get_name()
						local use = minetest.get_item_group(name, "armor_use") or 0
						armor:damage(player, i, stack, use)
					end
				end

				player:set_breath(10)
			end
		end
		timer = 0
	end
end)
