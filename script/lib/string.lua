--========�ļ�����==================================--
--�ļ�����string.lua
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-24
--����������
--	��չluaδ�ṩ���ַ���������
--
--��Ϸ�ű���������Ե�����
--��ɽ����ɷ����޹�˾��copyright 1992-2005
--==================================================--

if not STRING_HEAD then
STRING_HEAD = 1


--��������������replace()��split()��join()������һЩ�׶ˣ���common.lua�����¶���������ͬ������
--Ϊ�˱��Ȿ�ļ���common.lua�еĺ������ǵ��������˴������ж�
--by fanzai	2005-12-28 20:46
-- if (not COMMON_HEAD) then
if (1) then

--========��������==================================--
--����ԭ�Σ�replace(str,pattern,s)
--���ߣ�yfeng
--�������ڣ�2005-1-27
--����޸����ڣ�2005-1-27
--����������
--	���ַ���s�滻�ַ���str�е�pattern
--������
--	str��Դ�ַ���n
--	pattern��Ҫ�滻���ַ���
--	s���滻pattern���ַ���
--����ֵ��
--	�滻����ַ�����
--������
--	��
--==================================================--
function replace(str,pattern,s)
	/*
	local startS,endS = strfind(str,pattern)
	while(startS) do
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern)
	end
	return str
	*/
	PushString(str)
	ReplaceString(pattern, s)
	return PopString()
end
--========��������==================================--
--����ԭ�Σ�split(str,splitor)
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2004-6-1
--����������
--	���ַ���str�÷��ѷ�splitor���ѳ�������ʽ
--������
--	str�������ѵ��ַ���
--	splitor�����ѷ�,����ò���û�У�Ĭ��Ϊ��,��
--����ֵ��
--	�����ѵ����飮����ַ���str��û�а������ѷ�splitor��
--�򷵻ص�����ֻ�У���Ԫ�أ�Ԫ�����ݾ���str����
--������
--	local s = "aaa,bbb,ccc,ddd"
--	local arr = splite(s,",")
--	��arr������Ϊ��
--	arr[1]��aaa
--	arr[2]��bbb
--	arr[3]��ccc
--	arr[4]��ddd
--==================================================--
function split(str,splitor)
	if(splitor==nil) then
		splitor=","
	end
	local strArray={}
	local strStart=1
	local splitorLen = strlen(splitor)
	local index=strfind(str,splitor,strStart)
	if(index==nil) then
		strArray[1]=str
		return strArray
	end
	local i=1
	while index do
		strArray[i]=strsub(str,strStart,index-1)
		i=i+1
		strStart=index+splitorLen
		index = strfind(str,splitor,strStart)
	end
	strArray[i]=strsub(str,strStart,strlen(str))
	return strArray
end

--========��������==================================--
--����ԭ�Σ�join(arr,insertor)
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-24
--����������
--	��һά����arr�ڵ�Ԫ��������insertor����������arr��
--Ԫ�����Ϊ�ַ������ͣ���������Ҳ���ԣ�
--������
--	arr�������ӵ�����
--	insertor����������ò���û�У�Ĭ�ϲ����Ϊ��,��
--����ֵ��
--	��������֮����ַ��������arrû���κ�Ԫ�أ��򷵻�
--nil��
--������
--	local sarr = {"a","b","c","d"}
--	local s = join(sarr,",")
--	��s�Ľ��Ϊ
--	s��"a,b,c,d"
--==================================================--
function join(tb, str_sep)
	if (not str_sep) then
		str_sep = ","
	end
	local str = ""
	if (getn(tb) > 0) then
		PushString(tb[1])
		for i = 2, getn(tb) do
			AppendString(str_sep)
			AppendString(tb[i])
		end
		str = PopString()
	end
	return str
end

end	--if (not COMMON_HEAD) then

--========��������==================================--
--����ԭ�Σ�trim(str)
--���ߣ�yfeng
--�������ڣ�2004-6-1
--����޸����ڣ�2005-1-24
--����������
--	ɾ���ַ���str���˵Ŀհ׷��ţ����û�пհ׷��ţ���
--��ɾ����
--������
--	str����ɾ���հ׷��ŵ��ַ���
--����ֵ��
--	��ɾ���˿հ׷����ַ���
--������
--	local s = "   dddd     "
--	s = trim(s)
--	��s�Ľ��Ϊ��
--	s��"dddd"
--==================================================--
function trim(str)
	/*
	local start,last = strfind(str,"%S+.*%S+")
	print(tostring(start).."|"..tostring(last))
	if(start==nil or last==nil) then
		return str
	end
	return strsub(str,start,last)
	*/
	PushString(str)
	TrimString()
	return PopString()
end

---RGB����ת����16���Ʊ�ʾ���ַ���
function toColor(r,g,b)
	if(not tonumber(r)) then r=0 end
	if(not tonumber(g)) then g=0 end
	if(not tonumber(b)) then b=0 end
	if(r<0) then r=0 end
	if(g<0) then g=0 end
	if(b<0) then g=0 end
	if(r>255) then r=255 end
	if(g>255) then g=255 end
	if(b>255) then b=255 end
	return r*65536+g*256+b
end
-------------------------------------

---��������ֵת���ɲ�ɫ���к���
SERIESWORD = {
	{ "Kim",	"metal"	},
	{ "M�c",	"wood"	},
	{ "Th�y ",	"water"	},
	{ "H�a",	"fire"	},
	{ "Th� ",	"earth"	}
}

function toSeriesColorText(text, sno)
	if (sno < 0 or sno >= getn(SERIESWORD)) then
		return text;
	else
		return "<color="..SERIESWORD[sno+1][2]..">"..text.."<color>";
	end
end

function toSeries(sno, bUnColorful)
	if(not tonumber(sno)) then return "error" end
	if(sno < 0 or sno > 4) then return "V� h� " end
	if (bUnColorful == 1) then
		return SERIESWORD[sno+1][1];
	else
		return toSeriesColorText(SERIESWORD[sno+1][1], sno);
	end
end
------------------------------

---���ȼ�����ת���ɲ�ɫ�ȼ�����
LEVELWORD = {
	"<color="..toColor(200,200,200).."> c�p1 <color>",
	"<color="..toColor(0,200,0).."> c�p2 <color>",
	"<color="..toColor(200,0,0).."> c�p3 <color>",
	"<color="..toColor(200,0,200).."> c�p4 <color>",
	"<color="..toColor(200,200,0).."> c�p5 <color>",
	"<color="..toColor(0,0,255).."> c�p6 <color>",
	"<color="..toColor(0,255,0).."> c�p7 <color>",
	"<color="..toColor(255,0,0).."> c�p8 <color>",
	"<color="..toColor(255,0,255).."> c�p9 <color>",
	"<color="..toColor(255,255,0).."> c�p10 <color>",	
}

function toLevel(lvl)
	if(not tonumber(lvl)) then return "error" end
	if(lvl < 0 or lvl > 10) then return "Ch�a bi�t" end
	return LEVELWORD[lvl]
end
---------------------------------

function transferDigit2CnNum(nDigit)
	local tbModelUnit = {
		[1]	= "",
		[2]	= " v�n",
		[3] = " tr�m tri�u", 	
	};
	
	local nDigitTmp = nDigit;	-- ��ʱ����,
	local n4LenNum	= 0;		-- ÿһ�ζ�nDigitȡ4λ����,n4LenNum��ʾȡ����������ֵ
	local nPreNum	= 0;		-- ��¼ǰһ�ν���ȡ4λ������n4LenNum��ֵ
	local szCnNum	= "";		-- ������Ҫ��Ľ��
	local szNumTmp	= "";		-- ��ʱ����,ÿȡ��λ�Ĳ����еõ�����������
	
	if (nDigit == 0) then
		szCnNum = "0";
		return szCnNum;
	end

	if (nDigit < 0) then
		nDigitTmp = -nDigit;
	end
	
	-- �ֱ�Ӹ�,��,�����ο���,��ΪnDigit��ֵС��1����,����ÿһ�ζ�������4λ
	for i = 1, getn(tbModelUnit) do
		szNumTmp	= "";
		n4LenNum	= mod(nDigitTmp , 10000);
		if (n4LenNum ~= 0) then
			--szNumTmp = transfer4LenDigit2CnNum(n4LenNum);					-- �õ�����λ�����ı��ʽ
			szNumTmp = n4LenNum
			szNumTmp = szNumTmp..tbModelUnit[i];								-- ���ϵ�λ
		end
		szCnNum	= szNumTmp..szCnNum;
		
		nPreNum	= n4LenNum;
		nDigitTmp = floor(nDigitTmp / 10000);
		if (nDigitTmp == 0) then
			break;
		end
	end
	if (nDigit < 0) then
		szCnNum = "-"..szCnNum;
	end
	return szCnNum;
end

end
