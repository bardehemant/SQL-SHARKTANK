select * from project..sheet

-- Total episodes 

select max(epno) from project..sheet 
select count(distinct epno) from project..sheet 
 
 ---Pitches 

 select distinct brand from project..sheet 


 --Pitches converted

 select sum(a.converted_not_converted)funding_recived, count(*) total_pictches from(
 select amountinvestedlakhs , case when amountinvestedlakhs>0 then 1 else 0 end as converted_not_converted from project..sheet) a

 --Total Female 

 select sum(female) from project..sheet

 --Total male

 select sum(male) from project..sheet
 
 --Gender ratio

 select sum(female)/sum(male) from project..sheet

 --Total invested ammount

 select sum(amountinvestedlakhs) from project..sheet

 --AVG Equity taken 

 select *from project..sheet where equitytaken>0
 select avg(a.equitytaken) from 
 (select *from project..sheet where equitytaken>0) a

 --Highest deal which was done 

 select max(amountinvestedlakhs) from project..sheet

 --Highest equity taken 

 select max(equitytaken) from project..sheet


 --startups having at least women

 select sum(a.female_count)  from (
 SELECT female, case when female>0 then 1 else 0 end as female_count from project..sheet) a


 --Pitches converted having  atleast women 


select * from project..sheet

select sum(b.female_count) from ( 

 select case when female>0 then 1 else 0 end as female_count ,a.*from (
 (select * from project..sheet where  deal!= 'No deal')) a) b


.
 

--AVG Team members

select avg(teammembers) from project..sheet

--amount invested per deal 


select avg(a.amountinvestedlakhs) amount_invested_per_deal from
(select * from project..sheet where deal!='No deal') a


-- Most age group or avg age group 

select avgage , count (avgage) cnt from project..sheet group by avgage order by cnt desc


--Location group of contestent 

select location , count (location) cnt from project..sheet group by location order by cnt desc


--Sector group of contestent
 
 select sector, count(sector) cnt from project..sheet group by sector order by cnt desc 


 --Patner deals

 select patners , count (patners) cnt from project..sheet where patners  !='-'group by patners order by cnt


 --Which is startups having highest amount has been invested  in sector


 select c.* from 
 (select brand , sector,amountinvestedlakhs, rank () over(partition by sector order by amountinvestedlakhs desc) rnk 
 from project..sheet) c

 where c.rnk =1


 --most of section got rank 1 beacue same amount where investd here














