--�������ͼ��,һ��б��45�ȵľ���,���ظþ���point���table
--tbRectangle = 
--{
--	tbtoppoint={1583,2989},
--	nleftstep = 6,
--	nrightstep = 3,
--}
--�þ��ε���߱߳�Ϊ6,�ұ߱߳�Ϊ5,����nleftstep=6,nrightstep=3
--					           ��   --tbtoppoint{x,y} ��������
--					         ��  ��
--					       ��  ��  ��
--					     ��  ��  ��  ��
--					   ��  ��  ��  ��  ��
--					 ��  ��  ��  ��  ��
--				     ��  ��  ��  ��
--		           ��  ��  ��
--					       ��  ��
--					         ��
--
--tbRectangleΪ���ϸ�ʽ��tb
--����ֵΪtable,��ʽ����
--tb ={
--	{x1,y1},
--	{x2,y2},
--}
--
function getRectanglePoint(tbRectangle)
	local ntopx = tbRectangle.tbtoppoint[1]
	local ntopy = tbRectangle.tbtoppoint[2]
	local nleftstep = tbRectangle.nleftstep
	local nrightstep = tbRectangle.nrightstep
	local ny = ntopy
	local tbpoint = {}
	local ni = 1
	for nx=ntopx,ntopx-nleftstep,-1 do
		for nk = 0,nrightstep-1,1 do 
			tbpoint[ni]={}
			tbpoint[ni][1] = nx+nk;
			tbpoint[ni][2] = ny+nk;
			ni = ni + 1
		end
		ny = ny + 1
	end;
	return tbpoint
end;