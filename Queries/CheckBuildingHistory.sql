USE Changes

SELECT * FROM Changes..AccommodationBuildingsHistory where AccommodationBuildingID='10210'

SELECT * FROM dbo.BedBankHotelHistory where BBHotelId='220848' order by HistoryDateCreated asc

select * from chargerule
select * from chargegroup

SELECT * FROM Accommodations..BedbankHotel where BBHotelId='1169190'

--Third Party History Table
SELECT * FROM Changes..BedBankHotelHistory where BBHotelId='62670' order by HistoryDateCreated desc
SELECT * FROM Changes..BedBankHotelHistory where BBHotelId='1168025'
SELECT * FROM Changes..BedBankHotelHistory where BBHotelId=''