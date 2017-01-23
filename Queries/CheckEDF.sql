-- Connect to RSApp02
USE Accommodations

-- EDF SP to get Selling Data
--1)	The contract’s 'to date' must be in the future – i.e. the contract hasn’t expired
--2)	The contract must be marked as ‘Active’, as must the building it relates to
--3)	There must not be any stop sales relating to the contract, building, supplier or country
--4)	There must not be any contract exclusions relating to the SystemUserCompanyID
--5)	If ‘Exclusive to groups’, the SystemUserCompanyID must be in the group

--exec [edf].[GetSellingDataByBuilding]
exec [edf].[GetSellingDataByBuilding]
@AccommodationBuildingID=13616,
@RoomTypeIDList=N'6325,6325,3896,3896,2552,2552,23,23,33,33',
@BoardBasisCodeList=N'SC,RO,SC,RO,SC,RO,SC,RO,SC,RO',
@FromDate='01-Nov-2014',
@ToDate='31-Oct-2015',
@SystemUserCompanyID=23647

exec [edf].[GetSellingDataByBuilding] @AccommodationBuildingID=13616,@RoomTypeIDList=N'6325,6325,3896,3896,2552,2552,23,23,33,33',@BoardBasisCodeList=N'SC,RO,SC,RO,SC,RO,SC,RO,SC,RO',@FromDate='2014-11-01 00:00:00',@ToDate='2015-10-31 00:00:00',@SystemUserCompanyID=23647

-- Working
exec [edf].[GetSellingDataByBuilding] @AccommodationBuildingID=20035,@RoomTypeIDList=N'1792,1792',@BoardBasisCodeList=N'BB,HB',@FromDate='1-Apr-2015',@ToDate='31-Oct-2015',@SystemUserCompanyID=23647

-- Not Working
exec [edf].[GetSellingDataByBuilding] @AccommodationBuildingID=6676,@RoomTypeIDList=N'796,5937,8023,5789',@BoardBasisCodeList=N'AI,AI,AI,AI',@FromDate='2015-04-01 00:00:00',@ToDate='31-Oct-2015',@SystemUserCompanyID=23647

-- Discounts
exec [edf].[GetSellingDataByBuilding] @AccommodationBuildingID=13438,@RoomTypeIDList=N'2,2,2,3,3,3,3,4,4,4,4,2',@BoardBasisCodeList=N'SC,RO,BB,HB,SC,RO,BB,HB,SC,RO,BB,HB',@FromDate='1-Apr-2015',@ToDate='31-Oct-2015',@SystemUserCompanyID=23647

-- Duplicate same day entries Issue
exec [edf].[GetSellingDataByBuilding] @AccommodationBuildingID=8552,@RoomTypeIDList=N'7409,7409,9943,10117,10134,10134',@BoardBasisCodeList=N'SC,RO,BB,BB,SC,RO',@FromDate='1-Nov-2014',@ToDate='31-Oct-2015',@SystemUserCompanyID=23647