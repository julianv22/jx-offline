Include("\\script\\skill\\head.lua")

SKILLS ={
	kaitianpidi={ 
		seriesdamage_p={{{1,20},{15,20},{20,60},{21,62}}},
		stun_p={{{1,15},{20,40}},{{1,1},{20,10},{21,10}}},
		lightingdamage_v={
			[1]={{1,5000},{15,7500},{20,17500}},
			[3]={{1,10000},{15,15000},{20,35000}}
		},
		skill_cost_v={{{1,20},{20,200}}},
	},
	hengdaolima={ 
		physicsenhance_p={{{1,100},{20,1400}}},
		seriesdamage_p={{{1,5},{20,30}}},
		stun_p={{{1,15},{20,40}},{{1,1},{20,10},{21,10}}},
		deadlystrike_p={{{1,5},{20,40}}},
		attackrating_p={{{1,95},{20,360}}},
		lightingdamage_v={
			[1]={{1,250},{20,550}},
			[3]={{1,250*1.1},{20,550*1.1}}
		},
		skill_cost_v={{{1,100},{20,200}}},
	},
}