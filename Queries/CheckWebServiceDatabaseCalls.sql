-- OTA_HotelAvail
exec ta_spp_SearchHotelCriteria
@Implementations=N'Hotels4U,Pegasus,Expedia,AmericanTours,ATS,JonView,YouTravel,JumboOnline',
--@SystemUserCompanyId=1444,
@SystemUserCompanyId=21779,
@PlaceAirportCode='SSH'
--@PlaceCode=N'CEACECOST'
--@HotelIds='EXP,88671'

go
exec ta_spp_SearchHotelPrice @UserID=N'5',@FromDate='24 Mar 2014',@RoomsRequired=1,@MinimumDays=5,@Occupancy=N'2A0C',@Capacity=2,@TotalAdults=2,@TotalChildren=0,@TotalInfants=0,@RoomTypeOnContractId=default,@ChildAges=N'',@ReturnAmentities=0,@Source=default,@AccommodationBuildingID=N'12487,12473,12663,12662,12111,10914,10546,11512,10987,13968,13967,14054,14053,13351,12710,12664,12900,12887,8334,8333,8923,8638,8332,7683,7664,8331,8028,10024,9867,10545,10206,9860,9111,9067,9859,9277,20621,20279,20276,20401,20280,14739,14341,15022,15021,14292,14289,14061,14291,14290,20047,20024,20227,20213,20023,15321,15304,15661,15582,7660,5177,5148,5186,5180,4844,4733,4731,4840,4734,5340,5253,5486,5446,5251,5190,5187,5222,5197,4660,4659,4671,4669,4650,1866,1301,4444,4725,4721,4730,4729,4720,4678,4677,4717,4680,7263,7093,7265,7264,7006,6733,6608,6804,6797,7549,7538,7580,7552,7467,7403,7305,7431,7430,5538,5535,5590,5539,5530,5524,5487,5527,5526,6577,6306,6606,6590,6280,6275,6001,6277,6276'
go
exec ta_spp_GetRatePlans @HotelIds=N'HL,63652|HL,64529|HL,65432|HL,64563|HL,65574',@Implementations=N'Hilton',@SystemUserCompanyId=N'1444'
go
exec ta_spp_GetRatePlans @HotelIds=N'PII,63356|RAD,63882|XN,2048',@Implementations=N'Pegasus',@SystemUserCompanyId=N'1444'
go
exec ta_spp_SearchHotelContentV2 @PropertyIds=N'YOU,2175696',
@Implementations=N'YouTravel',
@SystemUserCompanyId=N'32557'


-- OTA_HotelDescriptiveInfo
exec ta_spp_SelectHotelEntityAllDetails @AccommodationId=696,@LanguageCode=N'en',@WebText=0,@ActiveOnly=0,@PromotionCode=NULL


-- OTA_HotelBookingRule
exec ta_spp_GetUserID @vchUserName=N'userone',@vchUserPassword=N'nicole1',@intUserID=NULL
go
exec ta_spp_SelectAccommodationBuildingErrataForBuildingID @intAccommodationBuildingID=10987,@FromDate='05 May 2014',@ToDate='10 May 2014'
go
exec ta_spp_SelectBookingCharges_Cancellation @BookingRefNo=0,@LegacyCancellation=0,@PolicyText=1,@PreBookingFormat=1,@UserId=5,@ChainCode='H4U',@DepartureDate='05 May 2014',@RateCode='86'
go
exec ta_spp_SelectBuildingPolicy @AccommodationBuildingId=10987, @BBHotelId= null
go
