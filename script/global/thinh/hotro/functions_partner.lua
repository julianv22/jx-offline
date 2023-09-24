IncludeLib("PARTNER");

function functions_for_partner()
    local szTitle = "B¹n muèn sö dông chøc n¨ng g× víi b¹n ®ång hµnh?"
    local tbOpt = {"Chän §ång Hµnh/Create_Pet", "Xãa §ång Hµnh hiÖn t¹i/Delete_Pet",
                   "§æi Ngo¹i H×nh §ång Hµnh/FeaturePet", "§æi Tªn §ång Hµnh/change_name_pet",
                   "T¨ng Emotion/IncreaseEmotion", "LÊy S¸ch Kh¸ng mçi 12 level(Dïng max 20 quyÓn)/HoiLV",
                   "LÊy S¸ch Skill mçi 10 level/SachSkill", "Trë l¹i/main", "Tho¸t./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end
------------------------------------------------ §æi ngo¹i h×nh --------------------------------

function FeaturePet()
    local szTitle = "B¹n muèn ®æi ngo¹i h×nh nµo cho b¹n ®ång hµnh?"
    local tbOpt = {"TiÓu ®ång/#DoiHinhPet(1)", "ThiÕu niªn/#DoiHinhPet(2)", "Thµnh niªn/#DoiHinhPet(3)",
                   "Trë l¹i/Pet", "Tho¸t./no"}
    Say(szTitle, getn(tbOpt), tbOpt)
end

function DoiHinhPet(nP)
    local partner_index = PARTNER_GetCurPartner()
    PARTNER_ChangeFeatureOfPeriod(partner_index, nP)
end

------------------------------------------------ §æi Tªn --------------------------------

function change_name_pet()
    AskClientForString("DoiTenPet", "PYTA Gaming", 1, 500, "<#>NhËp tªn pet")
end

function DoiTenPet(szName)
    local partner_index = PARTNER_GetCurPartner()
    PARTNER_SetName(partner_index, szName)
    Msg2Player("§· ®æi tªn pet thµnh <color=yellow>" .. szName)
end

-------------------------- S¸ch kh¸ng ----------------------------------------------

function HoiLV()
    g_AskClientStringEx("1", 0, 256, "Level S¸ch", {SachKhang1})
end

function SachKhang1(nLV)
    for i = 0, 4 do
        AddItem(6, 1, 834 + i, nLV, 0, 0, 0)
    end
end

---------------------- S¸ch skill ---------------------------------------

function SachSkill()
    local szTitle = "B¹n muèn nhËn s¸ch nµo?"
    local tbOpt = {{"Häc skill Thêi Gian Phôc Håi", learn_skill_special}, {"S¸ch Chung", HoiLVSkill},
                   {"S¸ch T¨ng Kh¸ng TÊt C¶", SachSpecial, {853}},
                   {"S¸ch T¨ng Tèc §é Di ChuyÓn", SachSpecial, {854}},
                   {"S¸ch T¨ng TDD Ngo¹i C«ng", SachSpecial, {855}},
                   {"S¸ch T¨ng Tû LÖ ChÝnh X¸c", SachSpecial, {851}},
                   {"S¸ch T¨ng Sinh Lùc", SachSpecial, {868}}, {"S¸ch Phôc Håi Sinh Lùc", SachSpecial, {869}},
                   {"S¸ch T¨ng May M¾n", SachSpecial, {870}},
    -- {"S¸ch Gi¶m thêi gian tróng ®éc",SachSpecial,{861}},
    -- {"S¸ch Tang Kha nang Choang",SachSpecial,{867}},
    -- {"S¸ch Tang Thoi gian Choang",SachSpecial,{883}},
                   {"S¸ch T¨ng Hç Trî TÊt C¶ Chiªu", SachSpecial, {884}}, {"Trë l¹i", Pet}, {"Tho¸t."}}
    CreateNewSayEx(szTitle, tbOpt)
end

function learn_skill_special()
    local partner_index = PARTNER_GetCurPartner()
    PARTNER_AddSkill(partner_index, 2, 594, 20)
end

function HoiLVSkill()
    g_AskClientStringEx("1", 0, 256, "Level S¸ch", {SachSkillLV})
end

function SachSkillLV(nLV)
    for i = 1, nLV do
        AddItem(6, 1, 864, i, 0, 0, 0)
        AddItem(6, 1, 856, i, 0, 0, 0)
        AddItem(6, 1, 849, i, 0, 0, 0)
        AddItem(6, 1, 867, i, 0, 0, 0)
        AddItem(6, 1, 883, i, 0, 0, 0)
    end
end

function SachSpecial(nS)
    -- local partner_index = PARTNER_GetCurPartner()
    -- if partner_index > 0 then
    -- local partner_level = PARTNER_GetLevel(partner_index)
    -- local book_level = min(10, floor(partner_level/10)+1)
    -- AddItem(6,1,nS,book_level,0,0,0)
    -- end
    for i = 1, 10 do
        AddItem(6, 1, nS, i, 0, 0, 0)
    end
end

function IncreaseEmotion()
    local partner_index = PARTNER_GetCurPartner()
    Msg2Player("Pet ID " .. partner_index)
    PARTNER_AddEmotionDegree(nPartnerIdx, 1)
end

function Create_Pet()
    local szTitle = "B¹n muèn nhËn §ång Hµnh hÖ nµo?"
    local tbOpt = {{"HÖ Kim", Pet_Create, {0}}, {"HÖ Méc", Pet_Create, {1}}, {"HÖ Thñy", Pet_Create, {2}},
                   {"HÖ Háa", Pet_Create, {3}}, {"HÖ Thæ", Pet_Create, {4}}, {"Trë l¹i", Pet}, {"Tho¸t."}}
    CreateNewSayEx(szTitle, tbOpt)
end

function Pet_Create(nSeries)
    local partneridex = PARTNER_AddFightPartner(5 - nSeries, nSeries, 1, 5, 5, 5, 5, 5, 5)
    local nCount = PARTNER_Count()
    PARTNER_SetCurPartner(nCount)
    PARTNER_CallOutCurPartner()
end

---------------------------- Xãa partner -----------------------------------------

function Delete_Pet()
    local partnerindex, partnerstate = PARTNER_GetCurPartner()
    PARTNER_RemovePartner(partnerindex)
end
