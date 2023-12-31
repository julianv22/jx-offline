Include("\\script\\skill\\head.lua")

SKILLS ={
	doanthikiem1x={ 
		physicsenhance_p={{{1,5},{20,85}}},
		seriesdamage_p={{{1,1},{20,10}}},
		colddamage_v={
			[1]={{1,10},{20,75}},
			[3]={{1,10},{20,175}}
		},
		deadlystrike_p={{{1,1},{30,18}}},
		addskilldamage1={
			[1]={{1,1919},{2,1919}},
			[3]={{1,1},{20,60}}
		},
		addskilldamage2={
			[1]={{1,1921},{2,1921}},
			[3]={{1,1},{20,50}}
		},
		skill_cost_v={{{1,20},{20,20}}},
	},
	doanthikiem5x={ 
		physicsenhance_p={{{1,10},{20,140}}},
		seriesdamage_p={{{1,5},{20,30}}},
		colddamage_v={
			[1]={{1,20},{20,175}},
			[3]={{1,20},{20,275}}
		},
		deadlystrike_p={{{1,1},{30,18}}},
		addskilldamage1={
			[1]={{1,1921},{2,1921}},
			[3]={{1,1},{20,60}}
		},
		skill_cost_v={{{1,40},{20,40}}},
	},
	doanthikiem9x={ 
		physicsenhance_p={{{1,10},{20,100}}},
		seriesdamage_p={{{1,10},{20,50},{21,52}}},
		colddamage_v={
			[1]={{1,10},{20,175}},
			[3]={{1,10},{20,275}}
		},
		deadlystrike_p={{{1,1},{30,18}}},
		skill_cost_v={{{1,100},{20,100}}},		
	},
}