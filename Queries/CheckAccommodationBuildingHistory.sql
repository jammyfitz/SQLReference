USE Changes

SELECT * FROM Changes..AccommodationBuildingsHistory where AccommodationBuildingID='6975'
order by HistoryDateCreated desc

SELECT * FROM dbo.BedBankHotelHistory where BBHotelId='220848' order by HistoryDateCreated asc

select * from chargerule
select * from chargegroup


--Third Party History Table
SELECT * FROM Changes..BedBankHotelHistory where BBHotelId='220462'
SELECT * FROM Changes..BedBankHotelHistory where BBHotelId='237639'
SELECT * FROM Changes..BedBankHotelHistory where BBHotelId=''