use tempdb
if exists(select * from dbo.sysobjects where id = object_id(N'[dbo].[#temp]'))
	drop table #temp
if exists(select * from dbo.sysobjects where id = object_id(N'[dbo].[##temp2]'))
	drop table #temp2
if exists(select * from dbo.sysobjects where id = object_id(N'[dbo].[##temp3]'))
	drop table #temp3


use Accommodations
go


create table #temp (Ident int identity, ID int, RoomTypeOnContractId int, Fromdate datetime, todate datetime) insert into #temp 
select AccommodationBuildingPriceRangeID	,RoomTypeOnContractID	,FromDate	,ToDate
from accommodationbuildingpricerange
where todate > getdate()
and roomtypeoncontractid in 
	(select roomtypeoncontractid from roomtypesoncontract where contractid in 
		(select contractId from contracts where accommodationbuildingId in 
			(SELECT AccommodationBuildingId FROM InventoryManagerBuilding where SystemUserCompanyId='21801')
			))


order by roomtypeoncontractId, FromDate



select t1.ID, t2.id as id2  from #temp t1 inner join #temp t2 on t2.RoomTypeOnContractID = t1.RoomTypeOnContractID where t1.FromDate = T2.Fromdate
	and t1.ToDate =  t2.todate
	and t1.ID <> t2.ID
	--and t2.RoomTypeOnContractID=269610
order by t1.roomtypeoncontractId, t1.FromDate

