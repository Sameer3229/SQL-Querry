select * from ci_bseg where sa_id = '7663898745';
select * from ci_bseg_calc where bseg_id = '766769930118';
select * from ci_ft where bill_id = '766409866319' and sa_id = '7663898745';

--select
--
--bsegc.bseg_id, bsegc.rs_cd, 
--sum(bsegc.calc_amt) ,
--ft.ft_id, ft.cur_amt, ft.tot_amt
--
--from ci_bseg_calc            bsegc
--join ci_ft                   ft               on  bsegc.bseg_id = ft.sibling_id
--
--where ft.sa_id = '7663898745' and ft.parent_id = '766409866319';
--group by bsegc.bseg_id;


select
    bsegc.bseg_id,
    bsegc.rs_cd,
    sum(bsegc.calc_amt)  total_calc_amt,
    ft.ft_id,
    ft.cur_amt,
    ft.tot_amt
from
    ci_bseg_calc bsegc
join
    ci_ft ft on bsegc.bseg_id = ft.sibling_id
where 
    ft.sa_id = '7663898745'
    and ft.parent_id = '766409866319'
group by
    bsegc.bseg_id, bsegc.rs_cd, ft.ft_id, ft.cur_amt, ft.tot_amt;
