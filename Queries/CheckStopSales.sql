-- ItemID = AccommodationBuildingID, ItemID2 = RoomTypeID
USE Accommodations
SELECT * FROM StopSaleTracker where ItemID='3992'
--and CONVERT(SMALLDATETIME,CONVERT(VARCHAR(11),FromDate),103) >= CONVERT(SMALLDATETIME,'25/05/2015',103)
--and CONVERT(SMALLDATETIME,CONVERT(VARCHAR(11),ToDate),103) <= CONVERT(SMALLDATETIME,'31/10/2015',103)
 order by FromDate desc
 
 select * from BedBankHotel where PropertyId='1'
 select * from bedbankroomtype
 select * from bedbankhotelroom where BBHotelId=79886
 
 select * from stop