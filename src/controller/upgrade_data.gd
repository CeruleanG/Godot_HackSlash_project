extends Node

var dataDict : Dictionary = {
	0:{
		"Name":"Dash",
		"icon":preload("res://asset/UI_component/icons/dash.png"),
		"Max_Level":3,
		"Description":{
			0: "Able to performe 0 (+1) dash by pressing Shift key",
			1: "Able to performe 1 (+1) dash by pressing Shift key",
			2: "Able to performe 2 (+1) dashes by pressing Shift key",
			3: "Able to performe 3 dashes by pressing Shift key"
		},
		"Stat":{
			0: 0,
			1: 1,
			2: 2,
			3: 3
		},
		"Cost":{
			0: 50,
			1: 100,
			2: 150,
			3: "Max"
		}
	},
	1:{ 
		"Name":"Jump",
		"icon":preload("res://asset/UI_component/icons/jump.png"),
		"Max_Level":2,
		"Description":{
			0: "Able to performe 1 (+1) jump before landing",
			1: "Able to performe 2 (+1) jumps before landing",
			2: "Able to performe 3 jumps before landing"
		},
		"Stat":{
			0: 1,
			1: 2,
			2: 3,
		},
		"Cost":{
			0: 75,
			1: 150,
			2: "Max"
		}
	},
	2:{ 
		"Name":"Attack",
		"icon":preload("res://asset/UI_component/icons/attack.png"),
		"Max_Level":3,
		"Description":{
			0: "Attacks have a base power of 3 (+1)",
			1: "Attacks have a base power of 4 (+1)",
			2: "Attacks have a base power of 5 (+1)",
			3: "Attacks have a base power of 6"
		},
		"Stat":{
			0: 3,
			1: 4,
			2: 5,
			3: 6
		},
		"Cost":{
			0: 75,
			1: 150,
			2: 225,
			3: "Max"
		}
	},
	3:{ 
		"Name":"HP",
		"icon":preload("res://asset/UI_component/icons/HP.png"),
		"Max_Level":3,
		"Description":{
			0: "Max HP is 10 (+5)",
			1: "Max HP is 15 (+5)",
			2: "Max HP is 20 (+5)",
			3: "Max HP is 25"
		},
		"Stat":{
			0: 10,
			1: 15,
			2: 20,
			3: 25
		},
		"Cost":{
			0: 50,
			1: 100,
			2: 150,
			3: "Max"
		}
	},
	4:{ 
		"Name":"PowerDash",
		"icon":preload("res://asset/UI_component/icons/power_dash.png"),
		"Max_Level":1,
		"Description":{
			0: "Grant the ability to dodge attacks while dashing",
			1: "Dodge attacks while dashing"
		},
		"Stat":{
			0: false,
			1: true
		},
		"Cost":{
			0: 250,
			1: "Max"
		}
	},
	5:{ 
		"Name":"PowerJump",
		"icon":preload("res://asset/UI_component/icons/power_jump.png"),
		"Max_Level":1,
		"Description":{
			0: "Grant the ability to Jump higher",
			1: "Jump power is enhanced"
		},
		"Stat":{
			0: 0.0,
			1: 80.0
		},
		"Cost":{
			0: 150,
			1: "Max"
		}
	},
	6:{ 
		"Name":"Combo",
		"icon":preload("res://asset/UI_component/icons/combo.png"),
		"Max_Level":2,
		"Description":{
			0: "Able to chain 1 (+1) attack",
			1: "Able to chain 2 (+1) attacks",
			2: "Able to chain 3 attacks, which finishes with a higher damage stab",
		},
		"Stat":{
			0: [false,false],
			1: [true,false],
			2: [true,true]
		},
		"Cost":{
			0: 100,
			1: 200,
			2: "Max"
		}
	},
	7:{ 
		"Name":"Regen",
		"icon":preload("res://asset/UI_component/icons/Regen.png"),
		"Max_Level":3,
		"Description":{
			0: "0% (+10%) chance to restore HP upon landing an attack",
			1: "10% (+10%) chance to restore HP upon landing an attack",
			2: "20% (+10%) chanceto restore HP upon landing an attack",
			3: "30% chanceto restore HP upon landing an attack"
		},
		"Stat":{
			0: 0.0,
			1: 0.1,
			2: 0.2,
			3: 0.3
		},
		"Cost":{
			0: 100,
			1: 150,
			2: 200,
			3: "Max"
		}
	}
}


var statDict: Dictionary = {
	0:0,	# Dash /3 *
	1:2,	# Jump	/2 *
	2:0,	# Attack /3 *
	3:0,	# HP /3 *
	4:0,	# PowerDash /1 *
	5:1,	# PowerJump /1 *
	6:2,	# Combo /2 *
	7:0		# Regen	/3 *
}

var gold : int = 0
