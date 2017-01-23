-- Table that enforces sequential processing
select * from WorkingData..BedBankHotelPriceImportStatus

-- Staging Pricing and Availability Data (RoomType Data for PNV Only)
select * from WorkingData..BedBankHotelPriceImport
select * from WorkingData..BedBankRoomTypeImport

-- Final Pricing and Availability Data
select * from Accommodations..BedBankHotelPrice

-- Job Status List
-- 0 - Created
-- 1 - Pending
-- 2 - Processed
-- 3 - Failed
-- 5 - Processing

-- SPF Job Types
-- 22 - PNVFileImportTask
-- 54 - PNVFileTransferTask
-- 55 - BNTFileTransferTask
-- 56 - BNTFileImportTask
-- 57 - JACFileTransferTask
-- 58 - JACFileImportTask

--Check Bonotel SPF Import
select * from job..job where typeid = 55 or typeid = 56 order by CreatedDate desc

--Check PNV SPF Import
select * from job..job where typeid = 22 or typeid = 54 order by CreatedDate desc

--Check JAC SPF Import
select * from job..job where typeid = 57 or typeid = 58 order by CreatedDate desc