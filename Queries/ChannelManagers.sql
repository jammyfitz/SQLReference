USE Accommodations

SELECT * FROM systemuseraccounts where userName like '%ARTH256%'
SELECT * FROM systemuseraccounts where systemusercompanyid='18493'
SELECT * FROM systemuseraccounts where userid='127388'
SELECT * FROM systemusers where SystemUserCompanyID='23283' or SystemUserCompanyID='25560'
SELECT * FROM systemusers where IsInventoryManager='1'
SELECT * FROM AccommodationBuildings where BuildingName like '%Panoramic Apts%'
SELECT * FROM AccommodationBuildings where AccommodationBuildingID='4735'
SELECT * FROM AccommodationBuildings where AccommodationBuildingID='12060'

-- UPDATE systemusers SET InventoryManagerBypassQueue=1 WHERE SystemUserCompanyID='23283'

-- Format: (SystemUserCompanyID, AccommodationBuildingID)
--INSERT INTO InventoryManagerBuilding VALUES (23008,11389)
--INSERT INTO InventoryManagerBuilding VALUES (21424,11389)

-- Check Inventory Mapping
SELECT * FROM changes..inventorymanagerbuildinghistory where
SELECT * FROM InventoryManagerBuilding where AccommodationBuildingID='16678'
SELECT * FROM InventoryManagerBuilding where SystemUserCompanyId='34679'
SELECT * FROM InventoryManagerBuilding where AccommodationBuildingID='10781' AND SystemUserCompanyId='13501'
SELECT * FROM changes..InventoryManagerBuildingHistory WHERE AccommodationBuildingID='2938'
SELECT * FROM changes..InventoryManagerBuildingHistory WHERE SystemUserCompanyId='2938'
--UPDATE InventoryManagerBuilding SET SystemUserCompanyId='22832' WHERE AccommodationBuildingID='10781' AND SystemUserCompanyId='13501'
--UPDATE InventoryManagerBuilding SET AccommodationBuildingID='8804' WHERE AccommodationBuildingID='10781' AND SystemUserCompanyId='22832'
--DELETE FROM InventoryManagerBuilding WHERE AccommodationBuildingID='11389'

-- Checking Logs
USE Accommodations
select * from systemuseraccounts where userName like '%ARTH256%'
select * from systemuseraccounts where userId=222838
USE Job
select top 100 * from InventoryManagerLog where Request like '%method="UpdateInventory"%' and UserID='618678' order by date desc
select top 1000 * from inventorymanagerlog where userid=276856 order by date desc
select LogID, Date, UserId from InventoryManagerLog order by Date desc
select * from InventoryManagerLog where LogID in ('2301384','2301394')

-- Contract
select * from Accommodations..Contracts where AccommodationBuildingID='13891'
select * from Accommodations..RoomTypesOnContract where ContractID='59675'
select * from AccommodationBuildingPriceRange where RoomTypeOnContractID='302534'
select * from AccommodationBuildingPriceRange where AccommodationBuildingPriceRangeID='42132633'
--update AccommodationBuildingPriceRange set FromDate=CONVERT(SMALLDATETIME,'15/04/2011',103) where AccommodationBuildingPriceRangeID='14489416'

select * from Changes..AccommodationBuildingPriceRangeHistory where AccommodationBuildingPriceRangeID in (30938363, 33252653) order by HistoryDateCreated desc

-- Channel Manager Log Checker
select top 1000 * from Repository..InventoryManagerLog where
UserId = 213056
--Date > '15 May 2014 00:00' and Date < '15 May 2014 23:59'
--CONVERT(SMALLDATETIME,CONVERT(VARCHAR(11),[Date]),103) = CONVERT(SMALLDATETIME,'2014/05/15',103)
and MethodType='UpdateInventory'
--and Request like '%<Building code="16532"%'
--and (Request like '%<RoomTypes code="7109" mealplancode="1">%' or Request like '%<RoomTypes mealplancode="1" code="7109">%')
--and Request like '%<FromDate>2013-01-01</FromDate>%'
--and Request like '%<Price paxtype="Adult">0.0000</Price>%'
--and Request like '%<OnStopSale>true</OnStopSale>%'
--and Request like '%<Supplement%'
--and Response like '%no price range data exists to update%'
--and Response like '%was deadlocked on lock%'
--and LogID in (12346777,12346778,12346780,12346788,12346797,12346798,12346801,12346803,12346808)
order by Date desc


-- Test - Rename Hotels
SELECT * FROM AccommodationBuildings where Active='1'
SELECT * FROM AccommodationBuildings where BuildingName like '%9499%'
SELECT * FROM AccommodationBuildings where AccommodationBuildingID='4468'
--UPDATE AccommodationBuildings SET BuildingName='Test Hotel One' where AccommodationBuildingID='9499'
--UPDATE AccommodationBuildings SET BuildingName='Test Hotel Two' where AccommodationBuildingID='12519'

-- Price Bands
USE Accommodations
select * from contracts where accommodationbuildingid = 2922 and active = 1
select * from roomtypesoncontract where contractid = 61661

select * from RoomTypes where RoomTypeID='11146'


select * from AccommodationBuildingPriceRange where AccommodationBuildingPriceRangeID=34159683
select * from roomtypesoncontract where roomtypeoncontractid=270114
select * from contracts where ContractID=54224

select * from accommodationbuildingpricerange where roomtypeoncontractid in (293472)
and FromDate >= '1Nov2014'
and ToDate <= '31Oct2015'
 order by fromdate 
select * from ContractRoomAllocation where contractid = 38416 and roomtypeid = 1638


-- Cast Type fix on SellCurrencyCode
SELECT * FROM systemuseraccounts where userName like '%idiso%'
SELECT * FROM systemusers where SellCurrencyCode is null and IsInventoryManager='1'
--UPDATE systemusers SET SellCurrencyCode='GBP' where SellCurrencyCode is null and IsInventoryManager='1'
SELECT * FROM systemusers where SystemUserCompanyId='21299'

-- Multiple contract fix
select * from contracts where AccommodationBuildingID='11053'
select * from contracts where ContractID='42482'
--update contracts set Active=0 where ContractID='16678'

-- Check supplier
select * from suppliers where suppliername like '%Avail%'
select * from suppliers where supplierid=6033

-- Configure extranet supplier account
select * from systemuseraccounts where userName like '%dylog%'
select * from contracts where AccommodationBuildingID='1943' and Active='1'
select * from contracts where AccommodationBuildingID='2142' and Active='1'
select * from systemusers where SystemUserCompanyId='22082'
select * from systemuseraccounts where SystemUserCompanyId='22082'
select * from suppliers where SupplierID='5075'
select * from suppliergroup
--update systemusers set SupplierID='5075', IsSupplier='TRUE', EMailAddress='Lieselotte.Sierens@stardekk.be' where SystemUserCompanyId='22082'
--update systemuseraccounts set EMailAddress = 'Lieselotte.Sierens@stardekk.be' where UserID=196636
--update contracts set SupplierID='5075' where AccommodationBuildingID='2142'
--update suppliers set SupplierName='Stardekk Test', BookingsEMail='Lieselotte.Sierens@stardekk.be' where SupplierID='5075'
-- Also need to insert SupplierID into CitySupplierException in web.config on test extranet server

-- Adams Inventory Report
SELECT DISTINCT SystemUsers.SystemUserCompanyID, AccommodationBuildingId, AccommodationBuildings.BuildingName, CompanyName, IsInventoryManager FROM InventoryManagerBuilding 
inner join SystemUsers on SystemUsers.SystemUserCompanyId = InventoryManagerBuilding.SystemUserCompanyId

SELECT DISTINCT AccommodationBuildings.AccommodationBuildingId, AccommodationBuildings.BuildingName, CompanyName, IsInventoryManager FROM AccommodationBuildings 
inner join InventoryManagerBuilding on InventoryManagerBuilding.AccommodationBuildingId = AccommodationBuildings.AccommodationBuildingId
inner join SystemUsers on SystemUsers.SystemUserCompanyId = InventoryManagerBuilding.SystemUserCompanyId
where IsInventoryManager='1'
and AccommodationBuildings.Active='0'

select * from inventorymanagerbuilding where accommodationbuildingid = 15176
select * from systemusers where systemusercompanyId in (16494,20884)
select * from systemuseraccounts where systemusercompanyId in (16494,20884)
select * from inventorymanagerbuilding where systemusercompanyId in (16494,20884)

-- Davids Logging
select count(*) from job.dbo.inventoryManagerlog
where date > '02 Oct 2012 09:00'
and  request like '%="15176"%'

select Date,accommodations.dbo.funconvertinttostring(c)
from (
select convert(varchar(14),Date,113) + ':00' as [date], count(*) C from job.dbo.inventoryManagerlog
group by convert(varchar(14),Date,113) + ':00'
) A
order by convert(datetime,Date) desc
