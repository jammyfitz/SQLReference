declare @repopulate bit
set @repopulate  = 1

declare @ViewUpdate varchar(50)
set @ViewUpdate = 'view' -- update to run update


if @repopulate = 1
begin

	drop table #temp3
	drop table #temp
	drop table #temp2
	



	create table #temp (Ident int identity, ID int, RoomTypeOnContractId int, Fromdate datetime, todate datetime)
	insert into #temp 
	select AccommodationBuildingPriceRangeID	,RoomTypeOnContractID	,FromDate	,ToDate
	from accommodationbuildingpricerange
	where todate > getdate()
			--	and roomtypeoncontractId = 247016
	order by roomtypeoncontractId, FromDate

	
	select t1.ID, t2.id as id2 into #temp2 from #temp t1
	inner join #temp t2 on t2.RoomTypeOnContractID = t1.RoomTypeOnContractID
	where (t1.FromDate between T2.Fromdate and t2.todate
	or t2.ToDate between T1.Fromdate and t1.todate)
	and t1.ID <> t2.ID
	order by t1.roomtypeoncontractId, t1.FromDate



	select ID into #temp3 from (
	select ID from #temp2 union select id2 from #temp2) A



	/*
	--- 28/01/11

	New fixes:

	1. Need a rouitine to go through overlaps and dups and correct bast on last modified dates restoring.
	2. need another routine to find gaps in the date bands.
	*/


end


drop table #Main

create table #main (ident int identity, Aid int, cid int, rid int, fromdate datetime, todate datetime, buyingprice money, date datetime, newfromdate datetime, newtodate datetime, markdel bit)
insert into #main 
( Aid , cid , rid , fromdate , todate , buyingprice , date )
select 
	ABPR.AccommodationBuildingPriceRangeId,
	C.ContractId,
	r.roomtypeoncontractId,
	convert(varchar,ABPR.FromDate,106)FromDate,
	convert(varchar,ABPR.ToDate,106)ToDate,
	ABPR.BuyingPrice,
	convert(varchar,abpr.LastModifiedDate,113) as 	LastModifiedDate
	from Contracts c
	inner join RoomTypesoncontract r on r.contractId = c.contractId
	inner join accommodationbuildingpricerange ABPR on ABPR.roomtypeoncontractId = r.roomtypeoncontractId
	inner join accommodationbuildings ab on ab.AccommodationBuildingId = c.AccommodationBuildingId
	inner join roomtypes rt on rt.roomtypeid = r.roomtypeId
	inner join boardbasis b on B.BoardBasisID = R.BoardBasisId
where accommodationbuildingpricerangeId in (select ID from #temp3)
                                    --  and r.roomtypeoncontractId = 247016
order by roomtypeoncontractId, convert(datetime,ABPR.fromdate)


-- 

declare @C int
declare @rid int
declare @Aid int
declare @fromdate datetime
declare @todate datetime
declare @Date datetime

declare @Aid2 int
declare @fromdate2 datetime
declare @todate2 datetime
declare @Date2 datetime
declare @Pres int

alter table #main 
add newnewfromdate datetime
alter table #main 
add newnewtodate datetime
alter table #main 
add markmarkdel bit





	set @C	= 1
	while @C <= (select max(ident) from #main)
	begin
		select	@rid = rid ,
			@aid = aid ,
			@fromdate =  fromdate,
			@todate = todate,
			@date = date
		from	#main 
		where	ident = @C
			and newfromdate is null and newtodate is null and markdel is null
		if @aid is not null
		begin



			if (select count(*) from #Main where rid = @Rid and @aid <> aid 
				and @todate between fromdate and todate 
				and newfromdate is null and newtodate is null and markdel is null)
			 = 1
			begin
				set @Aid2 = (select aid from #Main where rid = @Rid and @aid <> aid 
					and @todate between fromdate and todate 
					and newfromdate is null and newtodate is null and markdel is null)


				select	@aid2 = aid ,
					@fromdate2 =  fromdate,
					@todate2 = todate,
					@date2 = date
				from	#main 
				where	aid = @Aid2
		
			
				
				set @Pres = (select case
						when @Date < @Date2
						then 1
						when @Date > @Date2
						then 2
						else 1
						end)
				
				if @Pres = 1
				begin
					if @ToDate between @fromdate2 and @todate2
					begin
						if @ToDate = @toDate2
							Update #main set markdel = 1 where aid = @AID2
						else 
							Update #main set newfromdate = @todate + 1 where aid = @AID2
					end
				end
				if @Pres = 2
				begin
					if @FromDate2 between @fromdate and @todate
					begin
						if @FromDate2 = @FromDate
							Update #main set markdel = 1 where aid = @AID
						else 
							Update #main set newtodate = @FromDate2 - 1 where aid = @AID
					end

					else if @ToDate = @FromDate 
						Update #main set markdel = 1 where aid = @AID

				end



			end

			-- if there are three overlapping results, typically there is one records for the same date, delete it.
			else if (select count(*) from #Main where rid = @Rid and @aid <> aid 
				and @todate between fromdate and todate 
				and newfromdate is null and newtodate is null and markdel is null)
			 = 2

			begin
				if @fromdate = @Todate
					Update #main set  markdel = 1 where aid = @AID
			end


			
		end
		

		set @C = @C + 1
	end




	--------------SECOND SWEEP - run twice to get any new ones created by first patch
	


	set @C	= 1
	while @C <= (select max(ident) from #main)
	begin
		select	@rid = rid ,
			@aid = aid ,
			@fromdate =  isnull(newfromdate,fromdate),
			@todate = isnull(newtodate,todate),
			@date = date
		from	#main 
		where	ident = @C
			and newnewfromdate is null and newnewtodate is null and markmarkdel is null
			and markdel is null -- exclude if already delerted
		if @aid is not null
		begin


			if (select count(*) from #Main where rid = @Rid and @aid <> aid 
				and @todate between isnull(newfromdate,fromdate) and isnull(newtodate,todate) 
				and newnewfromdate is null and newnewtodate is null and markmarkdel is null and markdel is null)
			 = 1
			begin
				set @Aid2 = (select aid from #Main where rid = @Rid and @aid <> aid 
					and @todate between isnull(newfromdate,fromdate) and isnull(newtodate,todate) 
					and newnewfromdate is null and newnewtodate is null and markmarkdel is null and markdel is null)

				select	@aid2 = aid ,
					@fromdate2 =  isnull(newfromdate,fromdate),
					@todate2 = isnull(newtodate,todate),
					@date2 = date
				from	#main 
				where	aid = @Aid2
		
			
				
				set @Pres = (select case
						when @Date < @Date2
						then 1
						when @Date > @Date2
						then 2
						else 1
						end)
				
				if @Pres = 1
				begin
					if @ToDate between @fromdate2 and @todate2
					begin
						if @ToDate = @toDate2
							Update #main set markmarkdel = 1 where aid = @AID2
						else 
							Update #main set newnewfromdate = @todate + 1 where aid = @AID2
					end
				end
				if @Pres = 2
				begin
					if @FromDate2 between @fromdate and @todate
					begin
						if @FromDate2 = @FromDate
							Update #main set markmarkdel = 1 where aid = @AID
						else 
							Update #main set newnewtodate = @FromDate2 - 1 where aid = @AID
					end

					else if @ToDate = @FromDate 
						Update #main set markdel = 1 where aid = @AID

				end



			end
			-- if there are three overlapping results, typically there is one records for the same date, delete it.
			else if (select count(*) from #Main where rid = @Rid and @aid <> aid 
				and @todate between fromdate and todate 
				and newfromdate is null and newtodate is null and markdel is null)
			 = 2

			begin
				if @fromdate = @Todate
					Update #main set  markmarkdel = 1 where aid = @AID
			end


		end


		

		set @C = @C + 1
	end

declare @markdel bit


-- view results

select * from #main m

/*
select accommodationBuildingPriceRange.fromdate, accommodationBuildingPriceRange.todate,* from #main m
left outer join accommodationBuildingPriceRange  on accommodationBuildingPriceRange.AccommodationBuildingPriceRangeId = m.aid
order by m.ident
*/
