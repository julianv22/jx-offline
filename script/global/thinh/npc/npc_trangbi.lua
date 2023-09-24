Include("\\script\\global\\thinh\\hotro\\trangbihoangkim.lua")
Include("\\script\\global\\thinh\\hotro\\doxanh.lua")
Include("\\script\\global\\thinh\\hotro\\take_set_goldequipe.lua")
Include("\\script\\global\\thinh\\hotro\\functions_bachkim.lua")
Include("\\script\\global\\thinh\\hotro\\nhancankhon.lua")
Include("\\script\\global\\gm\\functions_goldplatiumitems.lua") -- lÊy ®å hoµng kim, b¹ch kim-----
------------------------------------------------------------------------------------------------------------
function main()
    -- dofile("script/global/thinh/npc/npc_trangbi.lua")
    dialog_trangbi_main()
end

function dialog_trangbi_main()
    local szTitle = "Xin chµo <color=red>" .. GetName() .. "<color> ! §¹i hiÖp muèn nhËn trang bÞ g×?"
    local tbOpt = {"Më réng r­¬ng/moruong", "NhËn LÖnh Bµi Lµm NV D· TÈu/nhandataulenhbai",
                   "§å Xanh - TÝm/dialog_xanhtim", "NhËn Full Ngùa/nhanngua",
                   "NhËn Trang BÞ Hoµng Kim/hoangkim", "NhËn set Hoµng Kim - B¹ch Kim/chose_type_goldquip",
                   "N©ng cÊp Trang BÞ B¹ch Kim/bachkim_main", "Tho¸t./no"}
    Say(szTitle, getn(tbOpt), tbOpt)

end
--------------------NhËn lÖnh bµi D· TÈu--------------------------------------------------
function nhandataulenhbai()
    AddItem(6, 1, 5126, 0, 0, 0, 0)
end
------------------------------------------------------------------------------------------
function dialog_xanhtim()
    local szTitle = "Xin chµo <color=red>" .. GetName() .. "<color> ! §¹i hiÖp muèn nhËn trang bÞ g×?"
    local tbOpt = {"LÊy §å Xanh/laydoxanh", -- "LÊy §å TÝm/laydotim"
    "Th¨ng cÊp ®å Xanh, TÝm/UpgradeDo", "H¹ cÊp ®å Xanh, TÝm/DowngradeDo", "Trë l¹i/main", "Tho¸t./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end
--------------------Hoang Kim -------------------------------------------------
function hoangkim()
    local szTitle = "Xin chµo <color=red>" .. GetName() .. "<color> ! §¹i hiÖp muèn nhËn trang bÞ g×?"
    local tbOpt = {"NhËn ®å Hoµng Kim th­êng/TrangBiHoangKimThuong", "NhËn Set HKMP/SetTrangBiHoangKim",
                   "NhËn TrÊn Bang Chi B¶o/TBCB", "NhËn Trang BÞ HiÕm, Cao CÊp/TrangBiHiem",
                   "NhËn NhÉn Cµn Kh«n cÊp 10/NhanCanKhon", "Trë l¹i/dialog_trangbi_main", "Tho¸t./no"}
    Say(szTitle, getn(tbOpt), tbOpt)

end

----------------------Mo ruong--------------------------------------------------
function moruong()
    OpenStoreBox(1)
    OpenStoreBox(2)
    OpenStoreBox(3)
    SetPartnerBagLevel(10)
end
----------------------Lay ngua --------------------------------------------------

function nhanngua()
    local szTitle = "Xin chµo <color=red>" .. GetName() .. "<color>. Mêi chän ngùa:"
    local tbOpt = {"LÊy tÊt c¶ Ngùa/nhanngua1", "Ngùa 8x/nguathuong", "Ngùa Cao CÊp/nguavolam",
                   "Hæ B¸o S­ Tö/hobaosutu", "Ngùa Hoµng Kim/nguahoangkim", "Heo Rõng/heorung",
                   "Cöu VÜ Hå/holi", "Trë l¹i/dialog_trangbi_main", "Tho¸t./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end
function nhanngua1()
    for i = 1, 55 do
        AddItem(0, 10, i, 10, 0, 0, 0)
    end
end
function nguathuong()
    AddItem(0, 10, 5, 6, 0, 0, 0, 0)
    AddItem(0, 10, 5, 7, 0, 0, 0, 0)
    AddItem(0, 10, 5, 8, 0, 0, 0, 0)
    AddItem(0, 10, 5, 9, 0, 0, 0, 0)
    AddItem(0, 10, 5, 10, 0, 0, 0, 0)
    AddItem(0, 10, 8, 10, 0, 0, 0)
end

function nguavolam()
    AddItem(0, 10, 6, 10, 0, 0, 0)
    AddItem(0, 10, 7, 10, 0, 0, 0)
    AddItem(0, 10, 9, 10, 0, 0, 0)
    AddItem(0, 10, 11, 10, 0, 0, 0)
    AddItem(0, 10, 13, 10, 0, 0, 0)
    AddItem(0, 10, 18, 10, 0, 0, 0)
end

function hobaosutu()
    AddItem(0, 10, 14, 10, 0, 0, 0)
    AddItem(0, 10, 15, 10, 0, 0, 0)
    AddItem(0, 10, 16, 10, 0, 0, 0)
    AddItem(0, 10, 17, 10, 0, 0, 0)
    AddItem(0, 10, 22, 10, 0, 0, 0)
end

function nguahoangkim()
    AddGoldItem(0, 4366)
    for i = 5093, 5096 do
        AddGoldItem(0, i)
    end
end

function heorung()
    AddItem(0, 10, 36, 10, 0, 0, 0)
    AddItem(0, 10, 37, 10, 0, 0, 0)
end

function holi()
    AddItem(0, 10, 38, 10, 0, 0, 0)
    AddItem(0, 10, 39, 10, 0, 0, 0)
    AddItem(0, 10, 40, 10, 0, 0, 0)
    AddItem(0, 10, 41, 10, 0, 0, 0)
end
