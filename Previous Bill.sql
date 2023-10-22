select * from ci_bill where acct_id = '7664633442'
order by bill_dt desc;

select * from ci_bill_sa;

select * from ci_bill where 
(select max(bill_dt) from ci_bill
where acct_id = '7664633442') and 
bill_dt !=(select max(bill_dt) from ci_bill where acct_id = '7664633442' );

select bill.* from ci_bill bill where acct_id = '7664633442' and bill_dt in
(select max(bill_dt) from ci_bill
where acct_id = '7664633442' and bill_dt < (select max(bill_dt) from ci_bill where acct_id = '7664633442'));

--select 
--bilsa.bill_id, bilsa.sa_id, bilsa.tot_amt,
--bill.bill_dt
--
--from ci_bill_sa     bilsa
--join ci_bill        bill           on bilsa.bill_id = bill.bill_id
--where bill.bill_id =
--(select bill._bill_id from ci_bill bill where bill.acct_id = '7664633442' and bill.bill_dt in
--(select max(bill.bill_dt) from ci_bill
--where bill.acct_id = '7664633442' and bill.bill_dt < (select max(bill.bill_dt) from ci_bill where bill.acct_id = '7664633442')));


SELECT
    bilsa.bill_id,
    bilsa.sa_id,
    bilsa.tot_amt,
    bill.bill_dt
FROM
    ci_bill_sa bilsa
JOIN
    ci_bill bill ON bilsa.bill_id = bill.bill_id
WHERE
bill.bill_dt = (
SELECT MAX(bill_dt)         FROM ci_bill 
WHERE acct_id = '7664633442' 
AND bill_dt = (
SELECT MAX(bill_dt) FROM ci_bill
WHERE acct_id = '7664633442' 
AND bill_dt < (SELECT MAX(bill_dt) FROM ci_bill
WHERE acct_id = '7664633442' and sa_id = '7663898745')));

select *-- sum(calc_amt)
from ci_bseg_calc
where bseg_id = '766769930118';
