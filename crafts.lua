core.register_craft({
	output = "spacesuit:helmet",
	recipe = {
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"default:steel_ingot", "default:glass", "default:steel_ingot"},
		{"wool:white", "default:steelblock", "wool:white"},
	},
})

core.register_craft({
	output = "spacesuit:chestplate",
	recipe = {
		{"default:steel_ingot", "default:mese", "default:steel_ingot"},
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"default:steel_ingot", "wool:white", "default:steel_ingot"}
	},
})

core.register_craft({
	output = "spacesuit:pants",
	recipe = {
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"wool:white", "wool:white", "wool:white"}
	},
})

core.register_craft({
	output = "spacesuit:boots",
	recipe = {
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"default:steel_ingot", "wool:white", "default:steel_ingot"},
		{"default:steel_ingot", "default:steelblock", "default:steel_ingot"},
	},
})
