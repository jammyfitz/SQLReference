drop table #temp	
go
create table #temp (Ident int identity primary key, ID int, RoomTypeOnContractId int,ContractFromDate datetime, Fromdate datetime, todate datetime, Next_FromDate datetime, ContractToDate datetime, DaysMissing int, MissingDate bit, ContractGapFrom bit, ContractGapTo bit)
	insert into #temp (ID	,RoomTypeOnContractID	,FromDate	,ToDate, ContractFromDate, ContractToDate)
	select	AccommodationBuildingPriceRangeID	,
		RoomTypeOnContractID	,FromDate	,ToDate,
	(select FromDate from Contracts where ContracTiD IN (select ContractId from RoomTypesOnContract where RoomTypeOnCOntractId = A.RoomTypeOnCOntractId)) as COntractFromDate,
	(select ToDate from Contracts where ContracTiD IN (select ContractId from RoomTypesOnContract where RoomTypeOnCOntractId = A.RoomTypeOnCOntractId)) as COntractToDate
	from accommodationbuildingpricerange A
	where todate > getdate()
	order by roomtypeoncontractId, FromDate

declare @C int
declare @C2 int
declare @M int
declare @Fromdate datetime
declare @RoomTypeOnContractId int
declare @ToDate datetime
declare @ContractfromDate datetime
declare @Old_ToDate datetime
declare @Old_RoomTypeOnContractId int
declare @Old_ContractToDate datetime
declare @ContractToDate datetime
declare @Next_fromDate datetime
declare @DaysMissing int
set @M = (select max(ident) from #temp)

set @C = 1

while @C <= @M
begin
	select  @RoomTypeOnContractId = RoomTypeOnContractId, 
		@fromDate = fromdate,
		@ToDate =  ToDate ,
		@ContractfromDate  = ContractFromDate,
		@ContractToDate = ContractToDate
	from #temp where Ident = @C
	
	-- gaps in contract to price band
	if @RoomTypeOnContractId <> @Old_RoomTypeOnContractId
	begin
		if @ContractFromDate <> @fromDate
			and @ContractFromDate > getdate()
			and @ContractFromDate < @fromDate
		begin
			set @DaysMissing = datediff(dd,	@ContractFromDate,@fromDate)		
			Update #Temp set ContractGapFrom = 1, DaysMissing = @DaysMissing where Ident =@C
		end
		if @Old_ContractToDate <> @Old_ToDate
			and @Old_ContractToDate > @Old_ToDate
		begin
			set @DaysMissing =datediff(dd,@Old_ToDate, @Old_ContractToDate)
			Update #Temp set ContractGapTo = 1, DaysMissing = @DaysMissing  where Ident =@C-1
		end
	end

	-- missing price bands
	if exists (select * from #temp where  Ident = @C + 1 and RoomTypeOnContractId = @RoomTypeOnContractId
					and FromDate <> dateadd(dd,1,@Todate))
	begin
		set @Next_fromDate = (select FromDate from #temp where  Ident = @C + 1 and RoomTypeOnContractId = @RoomTypeOnContractId)
		set @DaysMissing = datediff(dd,	@Todate	,@Next_fromDate)		
		Update #Temp set Next_FromDate = @Next_fromDate, DaysMissing = @DaysMissing, Missingdate = 1 where Ident =@C
	end

	set @Old_RoomTypeOnContractId = @RoomTypeOnContractId	
	set @Old_ContractToDate = @ContractToDate
	set @Old_ToDate = @ToDate
	set @C = @C + 1
end


select T.Ident as [Order By],
	ab.BuildingName,
	C.ContractId,
	(select RoomType from RoomTypes where roomtypeid = R.roomtypeId) as RoomType,
	(select BoardBasis from boardbasis where boardbasisid = r.boardbasisID) as [Board Basis],
	t.RoomTypeOnContractId,
	t.ID as AccommodationBuildingPriceRangeid,
	case
		when ContractGapFrom = 1
		then convert(varchar,T.ContractFromDate, 106)
		else ''
	end as [Contracts FromDate],
	convert(varchar,T.FromDate, 106) as FromDate,
	convert(varchar,T.ToDate,106)as ToDate,
	case 
		when MissingDate = 1
		then convert(varchar,T.Next_FromDate, 106) 
		else ''
	end as [Next FromDate],
	case 
		when ContractGapTo = 1
		then convert(varchar,T.ContractToDate, 106) 
		else ''
	end as [Contracts ToDate],
	DaysMissing,
	case
		when ContractGapFrom = 1 then 'Contract From Date Gap'
		when ContractGapTo = 1 then 'Contract To Date Gap'
		when MissingDate = 1  then 'Price Band Gap'
	end as [Gap Issue],
	case
		when exists (select * from INventoryManagerBuilding where accommodationbuildingId = AB.accommodationbuildingID)
		then 1
		else 0
	end as [Channel Managed - Included just as a point of interest]
from	#temp T
	inner join RoomTypesonContract R on R.RoomtypeoncontractId = t.roomtypeoncontractId
	inner join Contracts C on C.Contractid = R.ContractId
	inner join accommodationbuildings ab on ab.accommodationbuildingid = c.accommodationbuildingid
where	(MissingDate = 1
	or ContractGapFrom = 1
	or ContractGapTo = 1)
order by R.RoomtypeoncontractId, T.fromdate
