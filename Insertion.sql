SELECT PN.ENTITY_NAME
FROM CI_PER_NAME PN 
JOIN CI_PER PER ON PN.PER_ID = PER.PER_ID
join ci_acct_per  acctp on acctp.per_id = per.per_id
join ci_acct acct on acct.acct_id = acctp.acct_id
join ci_prem prem on prem.prem_id = acct.mailing_prem_id
join ci_sa sa on acct.acct_id = sa.acct_id
join ci_sa_sp sasp on sa.sa_id = sasp.sa_id
join ci_sp sp on sasp.sp_id = sp.sp_id
join ci_sp_mtr_hist mtrh on sp.sp_id = mtrh.sp_id
join ci_mtr_config mtrcfg on mtrh.mtr_config_id = mtrcfg.mtr_config_id
join ci_mtr mtr on mtrcfg.mtr_id = mtr.mtr_id
join ci_mr mr on mr.mtr_config_id = mtrcfg.mtr_config_id
WHERE PN.ENTITY_NAME = 'leo';
select * from ci_mr;






SELECT * FROM CI_PER_NAME;

-------------------------------------------------------------------------------


insert into ci_per
(PER_ID, LANGUAGE_CD, PER_OR_BUS_FLG, LS_SL_FLG, LS_SL_DESCR, EMAILID, OVRD_MAIL_NAME1, OVRD_MAIL_NAME2, OVRD_MAIL_NAME3,
ADDRESS1, ADDRESS2, ADDRESS3, ADDRESS4, CITY, NUM1, NUM2, COUNTY, POSTAL, HOUSE_TYPE, GEO_CODE, IN_CITY_LIMIT, STATE, COUNTRY,
VERSION, RECV_MKTG_INFO_FLG, WEB_PASSWD, WEB_PWD_HINT_FLG, WEB_PASSWD_ANS, PER_DATA_AREA, TIME_ZONE_CD)
VALUES
('SAMEER4321','ENG','P','N',' ', 'SAMEER@GMAIL.COM',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','Y',' ',' ',1,' ',' ',' ',' ',
null,' ');-- query ran !!!

insert into ci_per_phone 
(per_id,seq_num,phone_type_cd,country_code,phone,extension,version) 
values
('SAMEER4321',1,'HOME',' ','(415) 123-1111',' ',1);--query ran !!!


insert into ci_per_id
(per_id,id_type_cd,per_id_nbr,prim_sw,version,encr_per_id_nbr,hash_per_id_nbr)
values
('SAMEER4321','SSN','415-123-1111','Y',1,' ',' ');-- query ran !!!


insert into ci_per_name
(per_id,seq_num,entity_name,name_type_flg,version,prim_name_sw,entity_name_upr)
values
('SAMEER4321',1,'SAMEER','PRIM',1,'Y','SAMEER');-- query ran !!!

COMMIT;

--------------------------------------------------------------------------------
SELECT * FROM CI_ACCT;

INSERT INTO CI_ACCT
( ACCT_ID, BILL_CYC_CD, SETUP_DT, CURRENCY_CD, ACCT_MGMT_GRP_CD, ALERT_INFO, BILL_AFTER_DT, PROTECT_CYC_SW, CIS_DIVISION, MAILING_PREM_ID, protect_prem_sw,
COLL_CL_CD, CR_REVIEW_DT, POSTPONE_CR_RVW_DT, INT_CR_REVIEW_SW, CUST_CL_CD, BILL_PRT_INTERCEPT, NO_DEP_RVW_SW, BUD_PLAN_CD, VERSION, PROTECT_DIV_SW,
ACCESS_GRP_CD, ACCT_DATA_AREA)
VALUES
('SAMEER1234', 'M2OH', '01-JAN-23', 'USD', ' ', ' ', NULL, 'N', 'OH', 'SAMOO12345', 'N', 'RESID', NULL, NULL, 'N', 'R', ' ', 'N','RES-BUD',
1, 'N', '***', NULL);

SELECT * FROM CI_ACCT_PER;

insert into ci_acct_per
(acct_id,acct_rel_type_cd,bill_addr_srce_flg,per_id,main_cust_sw,fin_resp_sw,thrd_pty_sw,receive_copy_sw,bill_rte_type_cd,bill_format_flg,nbr_bill_copies,version,cust_po_id,notify_sw,name_pfx_sfx,pfx_sfx_flg,qte_rte_type_cd,recv_qte_sw,web_access_flg,alw_pref_flg,css_access_role_flg)
values
('SAMEER1234','MAIN','PREM','SAMEER4321','Y','Y','N','Y','POSTAL','D',1,1,' ','Y',' ',' ',' ','N','ALWD','CIYS',' ');

COMMIT;

SELECT * FROM CI_ACCT_K WHERE ACCT_ID = 'SAMEER1234' ;

--------------------------------------------------------------------------------
SELECT * FROM CI_PREM;

INSERT INTO CI_PREM
(PREM_ID, PREM_TYPE_CD, CIS_DIVISION, LL_ID, KEY_SW, KEY_ID, OK_TO_ENTER_SW, MR_INSTR_CD,MR_INSTR_DETAILS,MR_WARN_CD, TREND_AREA_CD, 
ADDRESS1, ADDRESS2,ADDRESS3,ADDRESS4, MAIL_ADDR_SW, CITY, NUM1, NUM2, COUNTY, POSTAL, HOUSE_TYPE,GEO_CODE, IN_CITY_LIMIT, STATE, COUNTRY, 
VERSION, ADDRESS1_UPR, CITY_UPR, TIME_ZONE_CD, LS_SL_FLG, LS_SL_DESCR, PRNT_PREM_ID, PREM_DATA_AREA)

VALUES
('SAMOO12345', 'SFH', 'OH', ' ', 'N', ' ', 'N', ' ', ' ',' ', 'STARK_OH', 'QUAIDABAD',' ',' ',' ','Y', 'CANTON', ' ',' ','STARK', 44702, ' ',' ','Y',
'OH','USA',1,'QUAIDABAD', 'CANTON',' ','N', ' ',' ',NULL);

----------------------------------------------------------------------------------

insert into ci_sp 
(DISCON_LOC_CD, SP_ID, SP_TYPE_CD, PREM_ID, SP_STATUS_FLG, INSTALL_DT, SP_SRC_STATUS_FLG, MR_CYC_CD, MR_RTE_CD, MTR_LOC_CD, MR_CYC_RTE_SEQ, 
FAC_LVL_1_CD, MTR_LOC_DETAILS, FAC_LVL_2_CD, FAC_LVL_3_CD, VERSION, ABOLISH_DT, OVRD_PREM_FLD_INFO_FLG, MR_INSTR_CD, MR_WARN_CD, KEY_SW, KEY_ID,
OK_TO_ENTER_SW, MR_INSTR_DETAILS, SP_DATA_AREA, DESCRLONG)
values
(' ','SAMEERSPID','E-RES-OH','SAMOO12345','R','1-JAN-23','C',' ',' ',' ',0,' ',' ',' ',' ',1,null,'N',' ',' ','N',' ','N',' ',null,' ');

COMMIT;
--------------------------------------------------------------------------------
SELECT * FROM CI_MTR_CONFIG;
insert into ci_mtr_config
(MTR_CONFIG_ID, MTR_ID, EFF_DTTM, VERSION, MTR_CONFIG_TY_CD, MTR_CFG_DATA_AREA)
values
('SAMEERMCID','SAMIRMTRID','2-JAN-23',1,'ELECDFLT',null);

UPDATE CI_MTR_CONFIG 
SET MTR_CONFIG_TY_CD = 'E-SIMPLE'
WHERE MTR_CONFIG_ID = 'SAMEERMCID';
commit;
--------------------------------------------------------------------------------
SELECT * FROM CI_REG;

insert into ci_reg
(REG_ID, MTR_ID, EFF_DTTM, READ_SEQ, UOM_CD, TOU_CD, REG_CONST, CONSUM_SUB_FLG, HOW_TO_USE_FLG, NBR_OF_DGTS_LFT, NBR_OF_DGTS_RGT, FULL_SCALE,
READ_OUT_TYPE_CD, PROTOCOL_CD, TOLERANCE, VERSION, VIRTUAL_CHAN_ID, INTV_REG_TYPE_CD)
values
('SAMIRREGID','SAMIRMTRID','2-JAN-23',1,'KWH',' ',1,'S','+',5,0,99999,' ',' ',0,1,' ',' ');
commit;
-----------------------------------------------------------------------------------
select * from ci_mtr_CONFIG where mtr_id = 'SAMIRMTRID';
DELETE FROM CI_MTR_CONFIG WHERE MTR_CONFIG_ID = 'SAMEERCFID';

---------------------------------------------------------------------------------
SELECT * FROM CI_SP_MTR_HIST;
SELECT * FROM CI_MR;
SELECT * FROM CI_MR WHERE MR_ID = '275639762384';

INSERT INTO CI_MR
(MR_ID, MTR_CONFIG_ID,READ_DTTM,USE_ON_BILL_SW, VERSION, MR_SOURCE_CD, MTR_READER_ID, MR_DATA_AREA, ILM_DT,ILM_ARCH_SW)
VALUES('SAMEERMRID','SAMEERMCID', '02-JAN-23', 'Y', 1,' ',' ', NULL,'8-JAN-23' ,'N'); 
COMMIT;
-----------------------------------------------------------------------------------------

SELECT * FROM CI_SP_MTR_HIST;

insert into ci_sp_mtr_hist
(SP_MTR_HIST_ID, MTR_CONFIG_ID, SP_ID, REMOVAL_MR_ID, REMOVAL_DTTM, VERSION, INSTALL_CONST)
values
('SAMEERSMID','SAMEERMCID','SAMEERSPID',' ',null,1,1);
COMMIT;

SELECT * FROM CI_SP_MTR_HIST
WHERE SP_MTR_HIST_ID NOT IN (SELECT SP_MTR_HIST_ID FROM CI_SP_MTR_EVT);
WHERE SP_ID = 'SAMEERSPID';

WHERE SP_MTR_HIST_ID = 'SAMEERSMID';
WHERE MTR_ID = 'SAMIRMTRID';



-----------------------------------------------------------------------------




---------------------------------------------------------------------------------------
SELECT * FROM CI_REG_READ;
insert into ci_reg_read
(REG_READ_ID, MR_ID, READ_SEQ, REG_ID, READ_TYPE_FLG, REG_READING, LO_LIMIT, HI_LIMIT, REVIEW_HILO_SW, TRENDED_SW, VERSION)
values
('SAMEERRDID','SAMEERMRID',1,'SAMIRREGID','60',0,0,0,'N','Y',1);
COMMIT;
----------------------------------------------------------------------------------------

SELECT * FROM CI_FA;

insert into ci_fa
(FA_ID, FA_TYPE_CD, FA_CAN_RSN_CD, SP_ID, FA_PRIORITY_FLG, FA_CREATED_BY_FLG, SCHED_DTTM, FA_STATUS_FLG, ELIG_DISPATCH_SW, DISP_GRP_CD, FO_ID,
CRE_DTTM, TEST_SEL_ID, USER_ID, INSTRUCTIONS, VERSION, APP_SCHED_ID, FA_EXT_ID, FA_INT_STATUS_FLG, FA_RESCHED_RSN_CD, FA_DATA_AREA, DESCRLONG,
ILM_DT, ILM_ARCH_SW)
values
('SAMEERFAID','M-INSMTR','SASP','SAMEERSPID','50','SS','2-JAN-23','C','Y','S-E-RC-N',' ','2-JAN-23',' ','EXPLORER',' ',2,' ',' ',' ',' ',
null,' ','2-JAN-23','N');

COMMIT;
--------------------------------------------------------------------------------------

SELECT * FROM CI_FA_STAGE_UP;

insert into ci_fa_stage_up
(FA_ID, FA_UP_STATUS_FLG, WORKED_BY, WORK_DTTM, VERSION, DESCRLONG)
values
('SAMEERFAID','C',' ','2-JAN-23',1,' ');

COMMIT;
-------------------------------------------------------------------------------------

SELECT * FROM CI_FA_STEP;

insert into ci_fa_step
(FA_ID, STEP_SEQ_NBR, FA_STEP_TY_ACT_FLG, SPAWNED_FA_ID, ACCT_ID, CC_ID, STP_ENTITY_FLG, SP_ITEM_HIST_ID, SP_MTR_HIST_ID, SP_ID, ITEM_ID, MR_ID, MTR_CFG_MTR_ID, MTR_ID, VERSION, DV_TEST_ID)
values
('SAMEERFAID',1,'IM',' ',' ',' ','SPM',' ','SAMEERSMID','SAMEERSPID',' ','SAMEERMRID',' ','SAMIRMTRID',1,' ');
COMMIT;
-----------------------------------------------------------------------------------

SELECT * FROM CI_SP_MTR_EVT;
SELECT * FROM CI_FA_STGUP_EXC;

INSERT INTO CI_FA_STP_STGUP
(FA_ID, STEP_SEQ_NBR, FA_STP_UP_STAT_FLG, FA_STEP_TY_ACT_FLG, BADGE_NBR, READ_DTTM, DISCON_LOC_CD, ON_OFF_FLG, VERSION, EVENT_DTTM, STK_LOC_CD)
VALUES 
('SAMEERFAID', 1, 'C', 'IM','SAM123', '02-JAN-23', ' ', 1, 1, NULL, ' ');


----------------------------------------------------------------------------------
update ci_sp set MR_CYC_CD='M-D1' where sp_id='SAMEERSPID';
update ci_sp set MR_RTE_CD = 1,MTR_LOC_CD='LEFT' where sp_id='SAMEERSPID';


-----------------------------------------------------------------------------------
SELECT * FROM CI_SP_MTR_EVT;

INSERT INTO CI_SP_MTR_EVT
(SP_MTR_HIST_ID, SEQNO, MR_ID, SP_MTR_EVT_FLG, MTR_ON_OFF_FLG, VERSION)
VALUES
('SAMEERSMID', 1, 'SAMEERMRID', 'I', 1,1);

COMMIT;

------------------------------------------------------------------------------------
select * from ci_bill;

SELECT * FROM CI_REG_READ where mr_id = 'SAMEERMRID';
insert into ci_reg_read
(REG_READ_ID, MR_ID, READ_SEQ, REG_ID, READ_TYPE_FLG, REG_READING, LO_LIMIT, HI_LIMIT, REVIEW_HILO_SW, TRENDED_SW, VERSION)
values
('SAMIRRDID1','SAMEERMRID',1,'SAMIRREGID','60',300,0,0,'N','Y',1);
COMMIT;
   SELECT * FROM CI_MR;7
   SELECT * FROM CI_REG_READ;
------------------------------------------------------------------------------------
select * from ci_bill;

insert into ci_bill
(BILL_ID, BILL_CYC_CD, WIN_START_DT, ACCT_ID, BILL_STAT_FLG, BILL_DT, DUE_DT, CRE_DTTM, COMPLETE_DTTM, LATE_PAY_CHARGE_SW, LATE_PAY_CHARGE_DT,
ALLOW_REOPEN_SW, VERSION, NEXT_CR_RVW_DT, CR_NOTE_FR_BILL_ID, ALT_BILL_ID, APAY_CRE_DT, APAY_AMT, ARCHIVE_SW, APAY_STOP_USER_ID, APAY_STOP_DTTM,
APAY_STOP_AMT, APAY_STOP_CRE_DT, DOC_ID, DOC_TYPE_FLG, OFFCYC_BGEN_ID, BILL_SIGN, ILM_DT, ILM_ARCH_SW)
values 
('SAMEERBILL', ' ', NULL, 'SAMEER1234', 'C', '30-JAN-23', '31-JAN-23', '30-JAN-23', '30-JAN-23', 'N', '01-FEB-23', 'Y', 1, 
'01-FEB-23', ' ', 0, NULL, 0, 'N',' ', NULL, 0 , NULL, 9999, ' ', ' ', ' ', NULL, NULL);
-----------------------------------------------------------------------------------
select * from ci_bill_SA WHERE BILL_ID = 'SAMEERBILL';

INSERT INTO CI_BILL_SA
(BILL_ID, SA_ID, CUR_AMT, TOT_AMT, CURRENCY_CD, VERSION)
VALUES 
('SAMEERBILL','SAMEERSAID',100, 100, 'USD',1);



-------------------------------------------------------------------------------------
select * from ci_bSEG_READ;

INSERT INTO CI_BSEG
(BSEG_ID, BILL_CYC_CD, WIN_START_DT, CAN_RSN_CD, CAN_BSEG_ID, SA_ID, BILL_ID, START_DT, END_DT, EST_SW, CLOSING_BSEG_SW, 
SQ_OVERRIDE_SW, ITEM_OVERRIDE_SW, PREM_ID, BSEG_STAT_FLG, CRE_DTTM, STAT_CHG_DTTM, REBILL_SEG_ID, VERSION, MASTER_BSEG_ID, 
QUOTE_DTL_ID, BILL_SCNR_ID, MDM_START_DTTM, MDM_END_DTTM, BSEG_DATA_AREA, ILM_DT, ILM_ARCH_SW)
VALUES
('SAMEERBSEG', ' ', NULL, ' ', ' ', 'SAMEERSAID', 'SAMEERBILL', '30-JAN-23', '31-JAN-23', 'N', 'N','N','N',
'SAMOO12345', 50, '30-JAN-23', '30-JAN-23', ' ', 1, ' ', ' ', ' ', '31-JAN-23','31-JAN-23',NULL, NULL,NULL);




--------------------------------------------------------------------------------
select * from ci_BSEG_CALC;

INSERT INTO CI_BSEG_CALC
(BSEG_ID, HEADER_SEQ, START_DT, CURRENCY_CD, END_DT, RS_CD, EFFDT, BILLABLE_CHG_ID, CALC_AMT, DESCR_ON_BILL, VERSION)
VALUES
('SAMEERBSEG', 1, '30-JAN-23', 'USD', '31-JAN-23', 'E-R1-OH', '30-JAN-23', ' ', 100, 'Electric residential rate',1);

COMMIT;
---------------------------------------------------------------------------------
SELECT * FROM CI_PAY;
insert into ci_pay
(PAY_ID, PAY_EVENT_ID, CAN_RSN_CD, CURRENCY_CD, ACCT_ID, PAY_STATUS_FLG, PAY_AMT, VERSION, NON_CIS_NAME,
NON_CIS_REF_NBR, NON_CIS_COMMENT, MATCH_TYPE_CD, MATCH_VAL, ILM_DT, ILM_ARCH_SW)
values
('SAMEERPAYT','SAMEERPAY1',' ','USD','SAMEER1234',50,100,1,' ',' ',' ',' ',' ',null,null);

--------------------------------------------------------------------------------
SELECT * FROM CI_PAY_SEG;

insert into ci_pay_seg
(PAY_SEG_ID, CURRENCY_CD, PAY_ID, SA_ID, PAY_SEG_AMT, VERSION, ADJ_ID, MATCH_EVT_ID)
values
('SAMEERPSEG','USD','SAMEERPAYT','SAMEERSAID',100,1,' ',' ');
--------------------------------------------------------------------------------
SELECT * FROM CI_PAY_EVENT;

insert into ci_pay_event
(PAY_EVENT_ID, PAY_DT, VERSION, CRE_DTTM, DOC_ID, ILM_DT, ILM_ARCH_SW)
values
('SAMEERPAY1','5-FEB-23',1,'5-FEB-23',' ',null,null)
;
COMMIT;
--------------------------------------------------------------------------------
SELECT * FROM CI_FT;

insert into ci_ft
(FT_ID, SIBLING_ID, SA_ID, PARENT_ID, GL_DIVISION, CIS_DIVISION, CURRENCY_CD, FT_TYPE_FLG, CUR_AMT, TOT_AMT, CRE_DTTM, FREEZE_SW, FREEZE_USER_ID, 
FREEZE_DTTM, ARS_DT, CORRECTION_SW, REDUNDANT_SW, NEW_DEBIT_SW, SHOW_ON_BILL_SW, NOT_IN_ARS_SW, BILL_ID, ACCOUNTING_DT, VERSION, XFERRED_OUT_SW, 
XFER_TO_GL_DT, GL_DISTRIB_STATUS, SCHED_DISTRIB_DT, BAL_CTL_GRP_ID, MATCH_EVT_ID)
values
('SAMEERFTID','SAMEERBSEG','SAMEERSAID','SAMEERBILL','OH1','OH','USD','PS',-100,-100,'5-FEB-23','Y','SYSUSER','5-FEB-23','5-FEB-23','N','N','N','Y',
'N','SAMEERBILL','5-FEB-23',1,'N','5-FEB-23','D','5-FEB-23',1,' ');

UPDATE CI_FT SET CUR_AMT = 90 WHERE FT_ID = 'SAMEERFTID';
UPDATE CI_FT SET TOT_AMT = 100 WHERE FT_ID = 'SAMEERFTID';
COMMIT;
--------------------------------------------------------------------------------

select * from ci_ft where ft_id = '766345897206';
-------------------------------------------------------------------------------
SELECT * FROM CI_BAL_CTL_GRP;



SELECT P.PER_ID,P.EMAILID, P.LANGUAGE_CD, PC.CHAR_TYPE_CD, PC.EFFDT FROM CI_PER P 
JOIN CI_PER_CHAR PC ON P.PER_ID = PC.PER_ID
WHERE 
PER_OR_BUS_FLG = 'B' AND 
LS_SL_FLG = 'N'
;
SELECT * FROM CI_PER_CHAR WHERE PER_ID = '3716074840';
SELECT * FROM CI_PER WHERE PER_ID = '3716074840';
--------------------------------------------------------------------------------


-------------------------------------------------------------------------------
SELECT * FROM CI_BAL_CTL_MEM;


-----------------------------------------------------------------------------
SELECT * FROM CI_BAL_CTL_TMP;



