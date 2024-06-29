if (GetProductRegion() == "cn_ib") then
	QY_GOLDBOSS_DPOS_INFO = {
					--{"单思南", 746, 95, 341, 4, "江湖传闻曾经叱咤风云的 单思南 在漠北草原出现!势必掀起一场腥风血雨！", "\\settings\\maps\\东北区\\漠北草原\\shansinanboss.txt"},
					{"B筩h Doanh Doanh", 742, 95, 336, 1, "Giang h� truy襫 r籲g B筩h Doanh Doanh t鮪g danh tr蕁 giang h�  xu蕋 hi謓 t筰 Phong L╪g ч b� B綾! Giang h� s緋 c� m閠 tr薾 m m竨!", "\\settings\\maps\\中原北区\\风陵渡北岸\\baiyingyingboss.txt"},
					--{"韩蒙", 748, 95, 342, 1, "江湖传闻曾经叱咤风云的 韩蒙 在西山屿出现!势必掀起一场腥风血雨！", "\\settings\\maps\\江南区\\西山屿\\hanmengboss.txt"}
	}
else
	QY_GOLDBOSS_DPOS_INFO = {
--					{"单思南", 746, 95, 341, 4, "江湖传闻曾经叱咤风云的 单思南 在漠北草原出现!势必掀起一场腥风血雨！", "\\settings\\maps\\东北区\\漠北草原\\shansinanboss.txt"},
					{"B筩h Doanh Doanh", 742, 95, 336, 1, "Giang h� truy襫 r籲g B筩h Doanh Doanh t鮪g danh tr蕁 giang h�  xu蕋 hi謓 t筰 Phong L╪g ч b� B綾! Giang h� s緋 c� m閠 tr薾 m m竨!", "\\settings\\maps\\中原北区\\风陵渡北岸\\baiyingyingboss.txt"},
--					{"韩蒙", 748, 95, 342, 1, "江湖传闻曾经叱咤风云的 韩蒙 在西山屿出现!势必掀起一场腥风血雨！", "\\settings\\maps\\江南区\\西山屿\\hanmengboss.txt"}
					{"Vng T� ", 739, 95, 341, 0, "Giang h� truy襫 r籲g Vng T� t鮪g danh tr蕁 giang h�  xu蕋 hi謓 t筰 M筩 B綾 th秓 nguy猲! Giang h� s緋 c� m閠 tr薾 m m竨!", "\\settings\\maps\\东北区\\漠北草原\\wangzuoboss.txt"},
					{"an M閏 Du� ", 565, 95, 227, 3,"C� k� nh譶 th蕐 an M閏 Du� b� m藅 xu蕋 hi謓 t筰 M� Cung Sa m筩 Йn Ho祅g.", "\\settings\\maps\\西北北区\\沙漠迷宫\\duanmuruiboss.txt"},
					{"Lam Y Y", 582, 95, 181, 1, "Con g竔 Lam Y Y c馻 H綾 Di謓 Lang Qu﹏ 產ng luy謓 c玭g � Lng Th駓 ng.", "\\settings\\maps\\江南区\\两水洞迷宫\\lanyiyiboss.txt"},
					{"Л阯g Phi Y課", 1366, 95, 342, 1, "Nhi襲 ngi n r籲g Л阯g Phi Y課  xu蕋 hi謓 t筰 Vi S琻 o! Giang h� t� y l筰 th猰 m閠 phen s鉵g gi�!", "\\settings\\maps\\江南区\\西山屿\\big_goldboss.txt"},
	}
end

Include("\\RelaySetting\\Task\\callboss_incityhead.lua")
function TaskShedule()
	-- 设置方案名称
	TaskName( "MAKE GOLDBOSS 21:00" );
	TaskInterval( 1440 );
	TaskTime( 21, 0 );
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "MAKE GOLDBOSS AT CITY OR OUTTER  :  21:00" );
end

function TaskContent()
TAB_CITY_EMPTY = {}
	qy_makeboss_lotsof_pos()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
