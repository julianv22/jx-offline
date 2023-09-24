IncludeLib("ITEM");
Include("\\script\\dailogsys\\dailogsay.lua");

----------------------------------------------------Bach Kim -----------------------------------
function bachkim_main()
    local szTitle = " Xin ch�o <color=red>" .. GetName() .. "<color> ! ��i hi�p mu�n s� d�ng ch�c n�ng g�?"
    local tbOpt = {}
    tinsert(tbOpt, "N�ng c�p �� Ho�ng kim l�n B�ch kim c�p 0/make_bachkim")
    tinsert(tbOpt, "N�ng c�p �� Ho�ng kim l�n B�ch kim c�p 10/make_bachkim_max")
    tinsert(tbOpt, "N�ng c�p trang b� B�ch Kim t�ng c�p/up_bachkim")
    tinsert(tbOpt, "Quay l�i/main")
    tinsert(tbOpt, "Th�i./no")
    Say(szTitle, getn(tbOpt), tbOpt)
end

function make_bachkim()
    GiveItemUI("T�o trang b� B�ch Kim", "N�ng c�p trang b� Ho�ng kim th�nh B�ch kim", "do_upgoldeq_process", 1);
end
function do_upgoldeq_process()
    UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
end

function make_bachkim_max()
    GiveItemUI("T�o trang b� B�ch Kim", "N�ng c�p trang b� Ho�ng kim th�nh B�ch kim", "do_upgoldeq_max", 1);
end
function do_upgoldeq_max()
    UpgradePlatinaFromGoldItem(GetGiveItemUnit(1))
    for i = 1, 10 do
        UpgradePlatinaItem(GetGiveItemUnit(1))
    end
end

function up_bachkim()
    GiveItemUI("N�ng c�p trang b� B�ch kim", "B� v�o trang b� B�ch kim", "upgrade_bachkim_process", 1);
end

function upgrade_bachkim_process()
    UpgradePlatinaItem(GetGiveItemUnit(1))
end
