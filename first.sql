select * from cisadm.ci_per;
select * from cisadm.ci_prem;
select * from cisadm.ci_acct;
select * from cisadm.ci_per_name;
select * from cisadm.ci_acct_per;
SELECT * FROM CI_SA_SP;

select pn.per_id, an.acct_id,pn.entity_name,  ac.coll_cl_cd, p.city, p.country
from  cisadm.ci_per_name pn
left join cisadm.ci_acct_per an 
on pn.per_id = an.per_id
left join cisadm.ci_acct ac
on ac.acct_id= an.acct_id
left join cisadm.ci_per p
on pn.per_id = p.per_id;
--where trim(p.per_id) = '0042114620';
;


SELECT * FROM CI_SA;
SELECT * FROM CI_SP;
--------------------------------------------------------------------------------
SELECT PER.PER_ID, PER.PER_OR_BUS_FLG, PERN.ENTITY_NAME,
ACCTP.ACCT_ID, ACCTP.ACCT_REL_TYPE_CD,
SA.SA_ID,
PREM.PREM_ID,
AP.SA_SP_ID,
SP.SP_ID,
MH.SP_MTR_HIST_ID,
MC.MTR_CONFIG_ID,
MTR.MTR_ID,
MR.MR_ID
--------------------------------------------------------------------------------
FROM CI_PER PER 
JOIN CI_PER_NAME PERN                ON PER.PER_ID = PERN.PER_ID
JOIN CI_ACCT_PER ACCTP               ON PER.PER_ID = ACCTP.PER_ID
JOIN CI_ACCT ACCT                    ON ACCT.ACCT_ID = ACCTP.ACCT_ID
JOIN CI_PREM PREM                    ON ACCT.MAILING_PREM_ID = PREM.PREM_ID
JOIN CI_SA SA                        ON ACCT.ACCT_ID = SA.ACCT_ID
JOIN CI_SA_SP AP                     ON SA.SA_ID = AP.SA_ID
JOIN CI_SP SP                        ON PREM.PREM_ID = SP.PREM_ID
JOIN CI_SP_MTR_HIST MH               ON SP.SP_ID = MH.SP_ID
JOIN CI_MTR_CONFIG MC                ON MC.MTR_CONFIG_ID = MH.MTR_CONFIG_ID
JOIN CI_MTR MTR                      ON MC.MTR_ID = MC.MTR_ID
JOIN CI_MR MR                        ON MC.MTR_CONFIG_ID = MR.MTR_CONFIG_ID
--------------------------------------------------------------------------------
WHERE PERN.ENTITY_NAME= 'leo'
;




select * from ci_sp_mtr_evt;
select * from ci_mr;

--------------------------------------------------------------------------------

select
--p.per_id,p.per_or_bus_flg,
--pn.entity_name,
--ap.acct_id, ap.ACCT_REL_TYPE_CD,
--pr.prem_id,pr.PREM_TYPE_CD,
--sp.SP_ID,sp.SP_STATUS_FLG,
--sasp.sa_id ,
--smh.SP_MTR_HIST_ID,
--mcon.mtr_config_id,
--mtr.mtr_id,
--mr.MR_ID,mr.READ_DTTM,
bll.BILL_ID,--bll.BILL_DT,
adj.adj_id,--adj.ADJ_STATUS_FLG,adj.ADJ_AMT,
pay.PAY_ID,sum(pay.PAY_AMT)
--spmtre.SP_MTR_EVT_FLG,spmtre.MTR_ON_OFF_FLG,
--pay.pay_amt
--------------------------------------------------------------------------------
from ci_per p

join ci_per_name pn                        on p.per_id = pn.per_id
join ci_acct_per ap                        on p.per_id = ap.per_id
join ci_acct ac                            on ac.acct_id = ap.acct_id
join ci_prem pr                            on pr.prem_id = ac.mailing_prem_id
join ci_sp sp                              on sp.prem_id = pr.prem_id
join ci_sa_sp sasp                         on sasp.sp_id=sp.sp_id
join ci_sa sa                              on sa.sa_id = sasp.sa_id
join CI_SP_MTR_HIST smh                    on smh.sp_id=sp.SP_ID
join ci_mtr_config mcon                    on mcon.mtr_config_id=smh.mtr_config_id
join ci_mtr mtr                            on mtr.mtr_id=mcon.MTR_ID
join ci_mr mr                              on mr.mtr_config_id =mcon.mtr_config_id
join ci_bill bll                           on bll.acct_id = ac.ACCT_ID
join ci_adj adj                            on adj.sa_id = sa.sa_id
join ci_pay pay                            on pay.acct_id = ac.ACCT_ID
join ci_sp_mtr_evt spmtre                  on spmtre.MR_ID=mr.MR_ID
join CI_ACCT_FT_HST_VW afth                on afth.acct_id=ac.acct_id
join CI_PAY_EVENT pe                       on pe.PAY_EVENT_ID=pay.PAY_EVENT_ID 

where bll.bill_id ='497560669633'
and pay.PAY_ID='497388395487';

--------------------------------------------------------------------------------
where pn.entity_name='leo'
;

describe schema local_ccb2_6;
select * from ci_pay_seg where pay_id = '766960267582'; --where sa_id = '7660165955' ;
select * from ci_ft where sa_id = '7660165955';
select * from ci_adj where adj_id = '766142045920';

--------------------------------------------------------------------------------
select distinct
--pn.per_id, --                   PER_ID
--pn.entity_name,--               ENTITY_NAME
--perr.per_or_bus_flg,--          PER_OR_BUS_FLG
--acp.acct_id,--                  ACCT_ID
--act.MAILING_PREM_ID,--          PREM_ID
--acp.acct_rel_type_cd,--         ACCT TYPE
--asy.sa_id,--                    SA_ID
--spp.sp_id,--                    SP_ID
--spmtrhis.mtr_config_id,--       MTR_CONFIG_ID
--mtrc.MTR_CONFIG_TY_CD,--        MTR_CONFIG_TYPE_CD
--mtr.mtr_id,--                   MTR_ID
--mr.mr_id,--                     MR_ID
--mr.read_dttm,--                 READ_DTTM
--sasp.sa_sp_id,--                SA_SP_ID
--ft.cur_amt,--                   CUR_AMT
--spmtrhisevt.sp_mtr_hist_id,--   SP_MTR_HIST_ID
ft.ft_id,--                       FT_ID
billsa.bill_id,--                                        BILL_ID
pay.pay_amt pay_amt,--                      PAY_AMT
adj.adj_amt total_adjustment, --                 ADJ_AMT
billsa.tot_amt total_amount,
(billsa.tot_amt)+(pay.pay_amt*-1) ending_balance
--bill.complete_dttm

from ci_per perr

join ci_per_name pn                         on perr.per_id = pn.per_id
join ci_acct_per acp                        on acp.per_id = perr.per_id
join ci_acct act                            on act.acct_id = acp.acct_id
join ci_prem prem                           on prem.prem_id = act.mailing_prem_id
join ci_sa asy                              on asy.acct_id = act.acct_id
join ci_sa_sp sasp                          on sasp.sa_id = asy.sa_id
join ci_sp spp                              on spp.sp_id = sasp.sp_id and spp.prem_id = prem.prem_id
join ci_sp_mtr_hist spmtrhis                on spmtrhis.sp_id = spp.sp_id
join ci_mtr_config mtrc                     on mtrc.mtr_config_id = spmtrhis.mtr_config_id
join ci_mtr mtr                             on mtr.mtr_id = mtrc.mtr_id
join ci_mr mr                               on mr.mtr_config_id = mtrc.mtr_config_id
join ci_ft ft                               on ft.sa_id = asy.sa_id
join ci_sp_mtr_evt spmtrhisevt              on spmtrhisevt.mr_id = mr.mr_id
join ci_pay pay                             on pay.acct_id = acp.acct_id
join ci_adj adj                             on adj.sa_id = asy.sa_id
join ci_bill_sa billsa                      on billsa.sa_id = asy.sa_id
join ci_bill bill                           on bill.acct_id =acp.acct_id

where 
--ft.ft_id='557875485800'
pn.entity_name='leo' 
--billsa.bill_id='557665143194'
--group by ft.ft_id
;
