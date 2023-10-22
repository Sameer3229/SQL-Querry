select * from cisadm.ci_per;
select * from cisadm.ci_acct;
select * from cisadm.ci_prem;
select * from cisadm.ci_sp;
select * from cisadm.ci_sa;
select * from ci_per_name;
select * from ci_sa;
select * from ci_sp_mtr_hist;
select * from ci_mtr_config;
select * from ci_mtr;
select * from ci_mr;
select * from ci_bill;
select * from ci_bseg;
select * from ci_bill_sa where sa_id = '7660165955';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
select 
per.per_id,
pern.entity_name,
acctp.acct_id,
prem.prem_id,
prem.prem_type_cd,
--acct.coll_cl_cd
sa.sa_id,
sa.sa_type_cd,
sp.sp_id, sp.sp_type_cd,
mtr_hist.mtr_config_id,
mtr.mtr_id,
mtr.badge_nbr,
mr.read_dttm, mr.mr_id
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
from ci_per                per
join ci_per_name           pern     on per.per_id = pern.per_id
join ci_acct_per           acctp    on per.per_id = acctp.per_id
join ci_acct               acct     on acctp.acct_id = acct.acct_id
join ci_prem               prem     on acct.mailing_prem_id = prem.prem_id
join ci_sa                 sa       on acct.acct_id = sa.acct_id
join ci_sa_sp              sasp     on sasp.sa_id = sa.sa_id
join ci_sp                 sp       on sasp.sp_id = sp.sp_id
join ci_sp_mtr_hist        mtr_hist on sp.sp_id = mtr_hist.sp_id   
join ci_mtr_config         mtr_cnfg on mtr_hist.mtr_config_id = mtr_cnfg.mtr_config_id   
join ci_mtr                mtr      on mtr_cnfg.mtr_id = mtr.mtr_id
join ci_mr                 mr       on mtr_cnfg.mtr_config_id = mr.mtr_config_id

where pern.entity_name = 'leo' ;
--and sa.sa_id= '7664928913';
--------------------------------------------------------------------------------

select 
acct.acct_id,
bill.bill_id,
bseg.bseg_id,
bill_sa.sa_id,
bill_sa.cur_amt,
bill_sa.tot_amt

--------------------------------------------------------------------------------
from ci_acct    acct
join ci_bill    bill          on acct.acct_id = bill.acct_id
join ci_bseg    bseg          on bill.bill_id = bseg.bill_id 
join ci_bill_sa bill_sa       on bseg.bill_id = bill_sa.bill_id

--------------------------------------------------------------------------------
where acct.acct_id = '7664633442' 
and bill_sa.sa_id = '7660165955';

---------------------------------------------------






--take data of exchange meter 


select * from ci_sp_mtr_hist where sp_id = '2721631917' ;



--------------------------------------------------------------------------------
select
pn.per_id, --                     PER_ID
pn.entity_name,--                   ENTITY_NAME
--perr.per_or_bus_flg,--              PER_OR_BUS_FLG
acp.acct_id,--                      ACCT_ID
--act.MAILING_PREM_ID,--              PREM_ID
--acp.acct_rel_type_cd,--             ACCT TYPE
sa.sa_id,--                        SA_ID
spp.sp_id,--                        SP_ID
spmtrhis.mtr_config_id,--           MTR_CONFIG_ID
mtrc.MTR_CONFIG_TY_CD,--            MTR_CONFIG_TYPE_CD
mtr.mtr_id,--                       MTR_ID

spmtrhis.REMOVAL_MR_ID,
spmtrhis.REMOVAL_DTTM,
spmtrhis.version

--------------------------------------------------------------------------------
from ci_per perr

join ci_per_name pn                         on perr.per_id = pn.per_id
join ci_acct_per acp                        on acp.per_id = perr.per_id
join ci_acct act                            on act.acct_id = acp.acct_id
join ci_prem prem                           on prem.prem_id = act.mailing_prem_id
join ci_sa sa                               on sa.acct_id = act.acct_id
join ci_sa_sp sasp                          on sasp.sa_id = sa.sa_id
join ci_sp spp                              on spp.sp_id = sasp.sp_id

join ci_sp_mtr_hist spmtrhis                on spmtrhis.sp_id = spp.sp_id
join ci_mtr_config mtrc                     on mtrc.mtr_config_id = spmtrhis.mtr_config_id
join ci_mtr mtr                             on mtr.mtr_id = mtrc.mtr_id


where 

pn.entity_name='leo' 
 
;
 -------------------------------------------------------------------------------
 
 

select * from ci_mr_char ;
select * from ci_reg_read;
select * from ci_reg_read;