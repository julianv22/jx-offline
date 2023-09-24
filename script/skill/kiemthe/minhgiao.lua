Include("\\script\\skill\\head.lua")

SKILLS ={
	minhgiaokiem1x={ --Minh Giao
		poisondamage_v={{{1,40},{10,100},{20,300},{30,400}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,1},{30,18}}},
		addskilldamage1={
			[1]={{1,1906},{2,1906}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,1908},{2,1908}},
			[3]={{1,1},{20,50}}
		},
		skill_cost_v={{{1,20},{20,20}}},
	},
	minhgiaokiem5x={ --Minh Giao
		poisondamage_v={{{1,80},{10,200},{20,600},{30,800}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,1},{30,18}}},
		addskilldamage1={
			[1]={{1,1908},{2,1908}},
			[3]={{1,1},{20,60}}
		},
		skill_cost_v={{{1,40},{20,40}}},
	},
	minhgiaokiem9x={ --Minh Giao
		poisondamage_v={{{1,1200},{10,3000},{20,9000},{30,12000}},{{1,60},{20,60}},{{1,10},{20,10}}},
		deadlystrike_p={{{1,1},{30,18}}},
		skill_cost_v={{{1,100},{20,100}}},		
	},
}