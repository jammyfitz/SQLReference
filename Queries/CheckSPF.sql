-- Table that enforces sequential processing
select * from WorkingData..BedBankHotelPriceImportStatus
--delete from WorkingData..BedBankHotelPriceImportStatus

-- Staging Pricing and Availability Data (RoomType Data for PNV Only)
select COUNT(*) from WorkingData..BedBankHotelPriceImport
select * from WorkingData..BedBankHotelPriceImport
select * from WorkingData..BedBankHotelPriceImport where BBRateCode ='OD15FF' and BBHotelCode = '57135' and BBRoomTypeCode = 'K1DV' and FromDate ='19 feb 2014' and ToDate = '20 feb 2014'
select * from BedBankHotel where BBHotelId = 79886
select * from BedBankRoomType where BBRoomTypeId = '1260381'
select * from WorkingData..BedBankHotelPriceImportClean where BBHotelPriceCriteriaID=22162
select * from WorkingData..BedBankRoomTypeImport
-- For checking when the numbers don't match
select * from Repository.dbo.BedBankHotelPriceImportLog
select * from occupancy

-- Final Pricing and Availability Data
select Top 1000 * from Accommodations..BedBankHotelPrice order by DateModified desc

select * from Accommodations..BedBankHotelPrice where BBHotelPriceCriteriaID=2811
select Top 50* from Accommodations..BedBankHotelPriceCriteria where BBSupplierID='17' order by DateCreated desc
select * from Accommodations..BedBankHotelPriceCriteria where BBHotelID='2026368'
select * from Accommodations..BedBankHotelPriceCriteria where BBRoomTypeId='37'
select * from Accommodations..BedBankHotelPriceCriteria where BBHotelPriceCriteriaID=2811
select * from Accommodations..BedBankHotelPriceCriteria where BBHotelID in
('2171687','2171688','2171689','2171690','2171691','2171692','2171693','2171694','2171695','2171696','2171697')
select * from BedBankRoomType where BBRoomTypeId='363224'
select * from BedBankHotel where BBHotelId='953434'
select * from BedBankRoomType where Code like '%MVL%' and BBSupplierId='30'
select * from BedBankRoomType where Code like '%AXL12-D1%' and BBSupplierId='30'
select * from bedbanksupplier
select * from Accommodations..BedBankRateCode where RateCode='OD15FF'

select * from Accommodations..BedBankRoomType where BBRoomTypeId='13082'
select * from Accommodations..Occupancy where OccupancyID='14'

-- Job Status List
-- 0 - Created
-- 1 - Pending
-- 2 - Processed
-- 3 - Failed
-- 5 - Processing

-- Check Bonotel SPF Import Job
select * from job..job where typeid = 55 or typeid = 56 order by CreatedDate desc

-- Check PNV SPF Import Job
select * from job..job where typeid = 22 or typeid = 54 order by CreatedDate desc

-- Check JAC SPF Import Job
select * from job..job where typeid = 57 or typeid = 58 order by CreatedDate desc

-- Check Hilton SPF Import Job
select * from job..job where typeid = 59 or typeid = 60 order by CreatedDate desc

-- Check Hotusa SPF Import Job
select * from job..job where typeid = 62 or typeid = 63 order by CreatedDate desc

-- Check You Travel SPF Import Job
select * from job..job where typeid = 69 or typeid = 70 order by CreatedDate desc

-- Check Vacances Directe SPF Import Job
select * from job..job where typeid = 74 or typeid = 75 order by CreatedDate desc

-- Updating Jobs Table
select * from job..job where id=149143
-- update job..job set StatusId=0, Context='JobID=BNTFileImportTask;SourceFile=D:\BNT\;SupplierID=28;FileSelector=H4U.Common.Tasks.BNTAvailFileSelector, H4U.Common;RowParser=H4U.Common.Tasks.BNTAvailFileReader, H4U.Common;DBConnectionString=writeConnectionString;HasHeader=true' where id=149143
-- update job..job set StatusId=0, Context='OnCompleteJobID=HiltonFileImportTask;UserName=Derbysoft;Password=1Qd301sv;Source=ftp.hotels4u.com;FileSelector=H4U.Common.Tasks.HiltonAvailFileSelector, H4U.Common;Destination=D:\;DestinationPath=Repository\Hilton\;Port=21;Protocol=FTP;PassiveMode=false;TimeOut=30000;PurgeDirectory=D:\Repository\History\\;Synchronize=true;Files=Hotels4U_{0}.csv;' where id=227758
-- update job..job set StatusId=0, Context='OnCompleteJobID=BNTFileImportTask;UserName=hotle4test;Password=HoT@4te$t;FTPServer=unix;Source=173.203.23.194;FileSelector=H4U.Common.Tasks.BNTAvailFileSelector, H4U.Common;SourcePath=folder;Destination=D:\;DestinationPath=BNT\;Port=21;Protocol=FTP;PassiveMode=false;TimeOut=30000;PurgeDirectory=D:\History\\;Synchronize=true', ContextStatus='' where id=149134

--insert into job..job (typeId, statusId, priority, context, createdDate, createdBy) values (56, 0, 2,'JobID=BNTFileImportTask;SourceFile=D:\BNT\;SupplierID=28;FileSelector=H4U.Common.Tasks.BNTAvailFileSelector, H4U.Common;RowParser=H4U.Common.Tasks.BNTAvailFileReader, H4U.Common;DBConnectionString=writeConnectionString;HasHeader=true',getdate(), 8)
--insert into job..job (typeId, statusId, priority, context, createdDate, createdBy) values (62, 0, 2,'OnCompleteJobID=HotusaFileImportTask;UserName=HOTUSA;Password=88640TtC;Source=ftp.hotels4u.com;FileSelector=H4U.Common.Tasks.HotusaAvailFileSelector, H4U.Common;Destination=D:\;DestinationPath=Repository\Hotusa\;Port=21;Protocol=FTP;PassiveMode=false;TimeOut=30000;PurgeDirectory=D:\Repository\History\\;Synchronize=true;Files=hotels4u_{0}.csv.gz;MappingFiles=HotusaH4UBoardMapping.txt;',getdate(), 8)


-- Robs special logging
insert WorkingData.dbo.BedBankHotelPriceImportStatus (BBSupplierID) values (37)

exec [dbo].[ta_spp_InsertBedBankHotelPriceImport]
      @BBSupplierID = 28, 
      --@DetailedLogging = 1,
      @BatchSize = 50000,
      @LoopWait = 0


-- Robs DB Logs
select      * 
from  Repository.dbo.BedBankHotelPriceImportLog 
where convert(date, LogDate) = convert(date, getdate()) 
      and BBSupplierId = 28
order by LogDate asc

-- Robs SPF file generation setting
select      * 
from  dbo.StaticDataFrameworkSearchMachineSetting 
where ServiceType = 'Search' 
            and SettingName = 'ActiveBBSupplierIds'
          
-- Robs DB Logs he keeps banging on about to give us 3rd Party Import Timings
SELECT * FROM v_BedBankHotelPriceImportLog_Summary WHERE CONVERT(date, minlogdate)=CONVERT(date, GETDATE()-1)
  
--update StaticDataFrameworkSearchMachineSetting set SettingValue='28,30,33,17,37,38,65' where ServiceType = 'Search' and SettingName = 'ActiveBBSupplierIds'

-- File Details
select * from StaticDataFrameworkFileSetUp where StaticDataFrameworkFileSetUpId = 250
select * from StaticDataFrameworkFileSetUp where StaticDataFrameworkId = 187

-- Start Run
/*
if @@servername = 'RSDBPRELIVE' exec dbo.ta_sp_StaticDataFramework_SearchCreationHarness null, 292
*/

select * from v_BedBankHotelPriceImportLog_Summary

exec dbo.ta_sp_StaticDataFramework_SearchCreationHarness null, 292

-- Todays SPF Import
select * from v_BedBankHotelPriceImportLog_TodaysRuns 
where BBSupplierId = 28 
order by Ident

-- Reset
exec SPFReset
-- View FTP Settings (applied when "OverrideFTP" is true)
select * from StaticDataFrameworkSearchMachineSetting where ServiceType = 'FTP'


--Query to get SPF import times and validation results
select * from bedbanksupplier
select * from v_BedBankHotelPriceImportLog_Summary where
BBSupplierId = 65
order by BBSupplierId,MinLogDate

exec dbo.ta_spp_SelectStaticDataFrameworkSearchCriteriaGenerationCompleted

-- Find a file (or set one up through Orchid) - If using an exsisting file use MaxRecordsForFile, this is the number of rows produced the last time the fine ran
select * from StaticDataFrameworkFileSetup where StaticDataFrameworkId=215
select * from StaticDataFrameworkFileSetUp where StaticDataFrameworkFileSetupId=250 or StaticDataFrameworkFileSetupId=149
select * from StaticDataFramework where StaticDataFrameworkId=215
-- Kick off SPF
--exec ta_sp_StaticDataFramework_SearchCreationHarness @StaticDataFrameworkFileSetupIds = '250'

-- Check SPF Export progress
select * from v_StaticDataFrameworkProcessLog_LastRun
--select * from v_StaticDataFrameworkProcessLog_Summary where RunStart >= dateadd(d, -1, getdate())

-- Check SPF Imported Data
select * from BedBankHotelPrice
inner join BedBankHotelPriceCriteria on BedBankHotelPriceCriteria.BBHotelPriceCriteriaID=BedBankHotelPrice.BBHotelPriceCriteriaID
inner join BedBankHotel on BedBankHotelPriceCriteria.BBHotelId = BedBankHotel.BBHotelId
where BedBankHotel.ChainCode='VD'
--and FromDate >= '2015-08-12' and ToDate <= '2015-08-23'
and BedbankHotelPriceCriteria.BBHotelId in 
('2192479')

select * from BedBankHotelPriceCriteria
where BBHotelId  in (
select BBHotelId from BedBankHotel where ChainCode = 'LCB' and Active = 1 and NativeCurrency is not null
)
