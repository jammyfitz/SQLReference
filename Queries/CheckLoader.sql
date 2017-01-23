-- Check Load
SELECT * FROM BedBankChainCode ORDER BY Description
SELECT * FROM BedBankChainCode ORDER BY ChainCode
SELECT * FROM BedBankSupplier
SELECT * FROM BedBankHotel where ChainCode='LCB' and Active='1'
SELECT * FROM BedBankHotel where BBHotelId='2003586'
SELECT * FROM BedBankHotel where PropertyId='NIP'
SELECT count(*) FROM BedBankHotel where ChainCode='EXP' ORDER BY LastLoadedDate DESC
SELECT * FROM BedBankHotel where ChainCode='AD' ORDER BY DateCreated DESC
SELECT * FROM BedBankHotel where ChainCode='AD' ORDER BY LastLoadedDate DESC
SELECT * FROM BedBankHotel where ChainCode='YOU' ORDER BY PropertyId
SELECT * FROM BedBankImplementationType where BBImpTypeId='2'
SELECT top 1010 * FROM Accommodations..BedbankHotel order by LastLoadedDate desc
SELECT * FROM BedBankHotel where BBHotelId='2150107' or BBHotelId='2150108' or BBHotelId='2150110' or BBHotelId='2150109' or BBHotelId='2150105' or BBHotelId='2150106'
--UPDATE BedBankHotel set Address2=NULL, Address3=NULL where BBHotelId='2150107' or BBHotelId='2150108' or BBHotelId='2150110' or BBHotelId='2150109' or BBHotelId='2150105' or BBHotelId='2150106'

-- Delete all hotels for ChainCode
--exec Util_Delete_BedBankHotel @ChainCode = 'ATS', @DeleteAll = 1

select * from BedBankSupplier
select * from gdssupplier
exec ta_spp_SelectBuildingPages @AllOnePage=0,@ChainCode=N'EU',@HiddenBuildings=1--,@ActiveSupplier=1

select * from bedbankimplementationtype

SELECT * 
FROM bedbankhotel with (nolock)
INNER JOIN BedBankchaincode with (nolock)
ON bedbankChainCode.ChainCode=BedBankHotel.ChainCode
INNER JOIN bedbanksupplier with (nolock)
ON bedbankChainCode.BBSupplierId=bedbankSupplier.BBSupplierId 
INNER JOIN bedbankimplementationtype with (nolock)
ON bedbankSupplier.BBImpTypeId=bedbankimplementationtype.BBImpTypeId
WHERE bedbankimplementationtype.ImpTypeName='Pegasus'
Order By BedBankHotel.LastLoadedDate desc
Order By BedBankHotel.DateCreated desc

select * from BedBankRateCode where RateCode = 'LESH42'
select * from BedBankSupplier where BBSupplierId=17

--92k properties in current Exp file
--BW 76063 last updated from getaway-10
Select * from BedBankHotel where ChainCode in
('AN','YO','CP','EX','HI','IN','IC','SP','SB')
and Active='1'

select * from BedBankHotel where Country='FR' and ChainCode='FB' and IsVPayment='1'
--update BedBankHotel set Active='1' where Country='FR' and ChainCode='FB' and IsVPayment='1'
select * from changes..BedBankHotelHistory where BBHotelId in (126422,2004460)
order by BBHotelId, HistoryDateCreated
2150105