select * from SystemUsers where CompanyName like '%germany%'

select * from SystemUsers where SystemUserCompanyID=15659

select * from SystemUsers where creditcardpayment != 0

select * from SystemUserAccounts where username like '%userfour%'

select * from SystemUserAccounts where systemusercompanyid=10603

select * from SystemUserAccounts where userid=82725

select * from SystemUserHistory where SystemUserCompanyID=11470

select * from bookingorders where userid=8

select * from xmlbookinglog where username='lbctravel@aol.com'

select accommodationbuildingid,buildingname,addresslineone,addresslinetwo,addresslinethree,addresslinefour from AccommodationBuildings where active=1

select * from AccommodationBuildings where buildingname like '%Playa Moreia Aparthotel%'

select * from AccommodationBuildingAmenities where AccommodationBuildingID=11847

select * from accommodationbuildingerrata where accommodationbuildingid=1418

select * from RoomTypesOnContract where ContractID=9433

select * from RoomTypes where RoomTypeID=2

select * from BedBankHotel where name like '%Du Theatre%'

select * from bedbankhotel where name like '%Explorers%'

select count(bbimageid) from BedBankHotelImage a,BedBankHotel b where a.BBHotelId=b.BBHotelId and b.ChainCode='TCH' and b.Active=1

update bedbankhotel set propertyid='37009' where bbhotelid=73802

select * from ipconfig where systemusercompanyid=13808

select * from IPConfig where ipstart like '%81.144.197%'

update ipconfig set ipstart='146.101.147.39' where ipconfigid=835

update ipconfig set ipend='146.101.147.39' where ipconfigid=834

UPDATE SystemUsers SET sellcurrencycode='GBP' where systemusercompanyid=12035

select citycodeid,citycode,citytown,countrycode from cities where active='True' and displayforsearch='True'

select * from BedBankHotel where chaincode='MIT' and active=1

select * from accommodationbuildings where accommodationbuildingid=10442

select * from bedbankhotel where bbhotelid=73784

select * from tblBookingOrderLog where bookingrefno='959025'

update BookingOrders set userid=3259 where BookingRefNo=977118

select top 100 * from BedBankSearchLog where BBImpTypeId=2 and SearchDate>'2009-23-06 12:00:00'

select * from resorts where resortname like '%Illot%'

select * from cities where citytown like '%Mallorca%'

select * from place where placename like '%Mallorca%'

select * from bedbankroomtype where bbroomtypeid=23418

select * from accommodationbuildingamenities where accommodationbuildingid=4859

select top 1000 * from SearchLog where userid=4724 and SearchLogDate>'2009-23-07'

select * from BookingOrders where BookingSubRefNo like '%8221089%'

Exec ta_spp_SearchResults_XML @intUserID=5, @vchSessionID='1zmqlp45g1nlw0ekomnodjvi', @dteFromDate='20/09/2009', @intRoomsRequired=1, @intMinimumDays=7, @chOccupancy='2A1C', @intTotalAdults=2, @intTotalChildren=1, @intTotalInfants=0, @sntCapacity=3, @intRoomTypeID1=0, @intBoardBasisID1=0, @chrAirportCode='MLE', @intResortID=0, @chrRunRating=0, @intAccommodationBuildingID=0, @intFirstChildAge=5, @decFirstChildCost=0, @intSecondChildAge=0, @decSecondChildCost=0, @intThirdChildAge=0, @decThirdChildCost=0, @intFourthChildAge=0, @decFourthChildCost=0

select * from bedbankhotel where bbhotelid=74227

select GDSID,ChainCode from GDSSuppliers where IsActive=1



select * from systemusers where systemusercompanyid = 7503
select * from systemuseraccounts where userid = 7503


select * from xmlbookinglog where bookingrefno=1139335

select * from userloghistory where userid=70338

select * from bedbankhotelimage where bbhotelid in (select bbhotelid from bedbankhotel where chaincode='TCH' and active=1)

select * from AccommodationBuildingsExt where medhotelid like '%20091217%'

select * from searchlog where searchlogdate>'2010-06-01'