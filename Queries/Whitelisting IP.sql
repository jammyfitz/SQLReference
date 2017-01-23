USE accommodations
select * from systemuseraccounts where userName like 'userone' and userPassword like '%THOM%'
select * from systemuseraccounts where NTUserName like '%Shirley%'
select * from systemuseraccounts where UserID=317542   or UserID=317543  
select * from systemuseraccounts where SystemUserCompanyID=1444 or SystemUserCompanyID=10939
select * from systemuseraccounts where PersonNameAndSurname='Jonathon Pickering'
select * from systemuseraccounts where H4U_UID='93'
select * from Suppliers where SupplierID='10145'
select * from Suppliers where suppliername like '%Bonotel%'
select * from Suppliers where suppliername like '%HolidayTaxis%'
select * from SystemUsers where SupplierID='10018'
select * from SystemUsers where SupplierID='3668'
select * from systemusers where IsActive='1'
select * from systemusers where inventorymanagerbypassqueue='0' and isinventorymanager='1'
select * from systemusers where CompanyName like '%Flexible%'
select * from SystemUsers where SystemUserCompanyID='34557' or SystemUserCompanyID='10939'
select UserID, Username from systemuseraccounts where isActive='1'
--update SystemUserAccounts set isActive='1' where UserID='317543'
--update SystemUsers set CreditCardPayment='0' where SystemUserCompanyID='9269'
select * from LanguageCode
select * from systemusers where SystemUserCompanyID=24169 or SystemUserCompanyID=22795 
select * from SystemUserHistory where SystemUserCompanyID='22596' order by datechanged desc
select * from Changes..systemuseraccountshistory where UserID=251749 order by HistoryDateCreated desc
select * from Changes..systemuseraccountshistory where SystemUserCompanyID=16233
select * from systemuserhistory where SystemUserCompanyID=24909 order by DateChanged desc
--update SystemUsers set IsInventoryManager='1' where SystemUserCompanyID=24003
--update SystemUsers set IsActive='1' where SystemUserCompanyID=10603
select * from Channel_SystemUsers where SystemUserCompanyID=21419
select * from channel where ChannelId='4'
--insert into Channel_SystemUsers values ('11','21419')
select * from systemusers where SystemUserCompanyID=16233
select * from systemusers where CompanyName like '%QL2%' !-- 11067 should be
select * from systemusers where ABTANumber='E5996' !-- SystemUserCompanyID=11408
select * from systemusers where CommissionLevel='5.00'
select * from IPConfig where IPStart like '195.188.244.0%'
select * from IPConfig where SystemUserCompanyID=8097
select top 5 * from IPConfig order by ipconfigid desc
select * from SystemUserHistory where SystemUserCompanyID=16233 order by DateChanged desc
select CompanyName from systemusers where IsInventoryManager='1' order by CompanyName


--update systemuseraccounts set IsActive='1' where UserID=251916
--update systemusers set CommissionApplicable='1' where SystemUserCompanyID=21974
--update systemusers set CommissionLevel='5' where SystemUserCompanyID=21974
--update systemusers set CommissionChargeLevel='5.26' where SystemUserCompanyID=21974
--update systemusers set SellCurrencyCode='EUR' where SystemUserCompanyID=21974
--update SystemUsers set IsActive='1' where SystemUserCompanyID='22596'

-- Execute IPConfig Store Procedure IPConfigID=1083 and check new IPConfig Result
select * from IPConfig where IPConfigID=16440

-- Execute IPConfigWebService Store Procedure IPConfigID=1083 and check new IPConfig_WebServiceConfig Result
select * from IPConfig_WebServiceConfig where IPConfigID=16440


-- MULTICOM IP RANGE
-- 192.189.157.11-60
-- 91.84.38.65
-- 178.78.124.130

-- MICROS IP RANGE
-- 194.205.58.0-255
-- 149.5.97.32-255
-- 91.84.223.214

-- TRAVELTEK IP RANGE
-- 83.231.184.97-125

-- TOPDOG IP RANGE
-- 81.144.197.64-127

-- UKTS GROUP IP RANGE
-- 195.219.234.161
-- 195.219.232.101
-- 121.241.168.161-192
-- 213.123.59.194
-- 94.236.124.19
-- 212.100.245.74
-- 79.125.96.124

-- CSI MEDIA IP RANGE
-- 80.244.186.5-35

-- COMTEC IP RANGE
-- 217.154.224.0-254
-- 91.193.105.254

-- HOTELS4U IP RANGE
-- 31.221.28.171

select * from bedbankratecode
--update systemusers set IsActive=1 where SystemUserCompanyID=8168 
--update ipconfig set IPEnd='83.231.184.125' where IPConfigId=1818 
--update systemuseraccounts set IsActive=1 where UserID=5892 

-- Szilvias User Report
select systemusers.SystemUserCompanyID, systemusers.CompanyName, systemusers.isactive   from systemuseraccounts 
inner join systemusers on systemusers.SystemUserCompanyID = systemuseraccounts.SystemUserCompanyID where systemuseraccounts.isactive='1'

-- Marks User Report
select Systemuseraccounts.UserID, Systemuseraccounts.Username, SystemUsers.SystemUserCompanyID, SystemUsers.CompanyName, IPConfig.IPStart, IPConfig.IPEnd from SystemUserAccounts
inner join IPConfig on SystemUserAccounts.SystemUserCompanyID = IPConfig.SystemUserCompanyId
inner join systemusers on systemusers.SystemUserCompanyID = systemuseraccounts.SystemUserCompanyID
where IPConfig.IPStart like '%92.244.168%'

-- Check User History
select * from SystemUserHistory where SystemUserCompanyID='21629'

-- Insert IP Address Stored Procedure
USE [Accommodations]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[ta_spp_InsertIPConfigBulkLoad]
		@UserNames = N'TCOTADPXML',
		@UserNameDelimiter = N',',
		@IPStart = N'178.78.124.130',
		@IPEnd = N'178.78.124.130',
		@RequestedBy = N'JF',
		@CreatedBy = N'JF',
		@UpdatedBy = N'JF',
		@WebServiceID = 2

SELECT	'Return Value' = @return_value

GO
