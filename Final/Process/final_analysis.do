import excel "C:\Users\Zhaonan Zhu\Desktop\DataMangement\Data\data_analysis.x> lsx", sheet("Sheet1") clear
rename B ricf_oid
label variable ricf_oid "Organization ID"
rename C ba_evl
label variable ba_evl "Foundation evaluation scale"
rename D fa_dint
label variable fa_dint "Total donation income"
label variable E "Foundation evaluation scale"
rename F ba_nfe
label variable ba_nfe "The number full-time employee"
rename G cf_govc
label variable cf_govc "Government funding "
rename H sc_gongo
label variable sc_gongo "Is state-linked foundations "
rename I ba_gvof
label variable ba_gvof "Number of government officials serving as principals"
rename J fp_tt
label variable fp_tt "Total liabilities and net assets"
rename K ba_age
label variable ba_age "Organization's age"
rename L ba_bn
label variable ba_bn "Number of board members"
rename M sco_na
label variable sco_na "Scope:National level or Regional level"
rename N ba_ntr
label variable ba_ntr "Fundraising type"
label variable O "province"
rename O province

sum fa_dint
encode fa_dint,gen( fa_dintnew)
tab fa_dintnew
sum fa_dintnew
count
sum fp_tt
encode fp_tt ,gen( fp_ttnew)
encode ba_age ,gen( ba_agenew)
encode ba_bn,gen(ba_bnnew)
tab sco_na
edit
drop in 1
save "C:\Users\Zhaonan Zhu\Desktop\DataMangement\Data\analysis.dta", replace
tab sco_na
tabulate  sco_na ,gen(  sco_na )
tab ba_ntr
tabulate  ba_ntr ,gen(  ba_ntr )
save "C:\Users\Zhaonan Zhu\Desktop\DataMangement\Data\analysis.dta", replace
reg fa_dintnew  fp_ttnew ba_agenew ba_bnnew sco_na2 ba_ntr2
tab ba_evl
save "C:\Users\Zhaonan Zhu\Desktop\DataMangement\Data\analysis.dta", replace
rename ba_evl ba_cn
rename E ba_evl
tab ba_evl
tabulate  ba_evl ,gen(  ba_evl )
sum ba_nfe
encode ba_nfe ,gen( ba_nfenew )
sum ba_nfe
sum ba_nfenew
encode cf_govc ,gen( cf_govcnew )
tab sc_gongo
tabulate  sc_gongo ,gen( sc_gongo )
sum ba_gvof
encode ba_gvof ,gen( ba_gvofnew )
sum cf_govc
encode cf_govc ,gen( cf_govcnew )
reg fa_dintnew  fp_ttnew ba_agenew ba_bnnew sco_na2 ba_ntr2
reg fa_dintnew  fp_ttnew ba_agenew ba_bnnew sco_na2 ba_ntr2 ba_evl1 ba_evl2 ba_evl3 ba_evl4 ba_nfenew
reg fa_dintnew  fp_ttnew ba_agenew ba_bnnew sco_na2 ba_ntr2 cf_govcnew sc_gongo2 ba_gvofnew
reg fa_dintnew  fp_ttnew ba_agenew ba_bnnew sco_na2 ba_ntr2 ba_evl1 ba_evl2 ba_evl3 ba_evl4 ba_nfenew cf_govcnew sc_gongo2 ba_gvofnew
save "C:\Users\Zhaonan Zhu\Desktop\DataMangement\Data\analysis.dta", replace












