SKILLS=
{
	
	Block ={ --��
		block_rate={{{1,100},{2,100}},{{1,18*3},{2,18*3},{3,18*3},{4,18*3},{20,18*3}}},
		autorescueskill=
		{
			{
				{1,993*256 + 1},{20,993*256 + 20},
			},
			{
				{1,1},{20,1}
			},
			{
				{1,90*18*256 + 20},
				{2,80*18*256 + 25},
				{3,70*18*256 + 30},
				{4,60*18*256 + 35},
			}
		},
		
		-- skill_desc=
		-- 	function(nLevel)
				
		-- 		local nPercent = 20+(nLevel-1) * 5	
		-- 		return format("��������25%%��˲����<color=orange>%d%%<color>�ĸ����Զ�ʹ��<color=orange>%d<color>��[<color=orange>%s<color>]\n",
		-- 			nPercent,
		-- 			nLevel,
		-- 			"��ȫ��")
				 
		-- 	end,	
		
	},	
	Teleport = 
	{
		
		autorescueskill=
		{
			{
				{1,997*256 + 1},{20,997*256 + 20},
			},
			{
				{1,1},{20,1}
			},
			{
				{1,90*18*256 + 20},
				{2,80*18*256 + 25},
				{3,70*18*256 + 30},
				{4,60*18*256 + 35},
			}
		},
	},
	EnhanceHit=
	{
		autorescueskill=
		{
			{
				{1,998*256 + 1},{20,998*256 + 20},
			},
			{
				{1,1},{20,1}
			},
			{
				{1,90*18*256 + 20},
				{2,80*18*256 + 25},
				{3,70*18*256 + 30},
				{4,60*18*256 + 35},
				
			}
		},
		enhancehit_rate={{{1,100},{2,100}},{{1,18*4},{2,18*4},{3,18*4},{4,18*4},{20,18*4}}},
		-- skill_desc = function(nLevel)
				
		-- 		local nPercent = 20+(nLevel-1) * 5	
		-- 		return format("��������25%%��˲����<color=orange>%d%%<color>�ĸ����Զ�ʹ��<color=orange>%d<color>��[<color=orange>%s<color>]\n",
		-- 			nPercent,
		-- 			nLevel,
		-- 			"�����ػ�")
				 
		-- 	end, 
	},
	Common=
	{
		skill_mintimepercast_v={{{1,90*18},{2,80*18},{3,70*18},{4,60*18},{15,60*18},}},
		skill_mintimepercastonhorse_v={{{1,90*18},{2,80*18},{3,70*18},{4,60*18},{15,60*18},}},
	}
}


Include("\\script\\skill\\head.lua")