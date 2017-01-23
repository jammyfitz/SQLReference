exec ta_spp_SearchBedBankHotel @ChainCode=N'PNV',@PropertyId=NULL,@LanguageCode=N'en',@ActiveOnly=0,@BBHotelId=222210
go
exec ta_spp_SearchHotelCriteria @Implementations=N'Hotels4U,ThomasCookHotels,AmericanTours,ATS,JonView,YouTravel'
,@SystemUserCompanyId=1444
--,@HotelIds=N'PNV,222210'
,@PlaceCode='AUNEWSYDN'
go
exec ta_spp_SearchHotelContentV2 @PropertyIds=N'YOU,2177387|YOU,2177386|YOU,2177385|YOU,2177408|YOU,2177389|YOU,2177388|YOU,2177384|H4U,16648|H4U,16033|H4U,15044|YOU,2177383|H4U,20298|H4U,20297',
@Implementations=N'Hotels4U,YouTravel',
@SystemUserCompanyId=N'1444'
go
exec ta_spp_SearchBedBankHotelPrice @UserID=N'86212',@FromDate='2014-03-12 14:00:00',@RoomsRequired=1,@MinimumDays=7,@TotalAdults=N'2',@TotalChildren=N'0',@TotalInfants=N'0',@BBRoomTypeId=default,@BBHotelId=N'222210'
go

go
exec ta_spp_SearchBedBankHotelPrice @UserID=N'5',@FromDate='2014-04-17 14:00:00',@RoomsRequired=1,@MinimumDays=7,@TotalAdults=N'2',@TotalChildren=N'0',@TotalInfants=N'0',@BBRoomTypeId=default,@BBHotelId=N'222210'
exec ta_spp_SearchBedBankHotelPrice @UserID=N'86212',@FromDate='17/04/14 14:00:00',@RoomsRequired=1,@MinimumDays=7,@TotalAdults=N'2',@TotalChildren=N'0',@TotalInfants=N'0',@BBRoomTypeId=default,@BBHotelId=N'222210'