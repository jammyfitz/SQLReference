SELECT top 100 * FROM BedbankHotel where ChainCode='THTLS' and Country='AD' and Description='Information not available.' order by LastModifiedDate desc
--DELETE FROM BedBankHotel where ChainCode='THTLS' and Country='AD' and Description='Information not available.'

SELECT * FROM BedBankHotelRoom where BBHotelId in ('239209','239203','239231','239653','239604','239598')
--DELETE FROM BedBankHotelRoom where BBHotelId in ('239209','239203','239231','239653','239604','239598')

SELECT * FROM BedBankHotel_BedBankAmenity where BBHotelId in ('239209','239203','239231','239653','239604','239598')
--DELETE FROM BedBankHotel_BedBankAmenity where BBHotelId in ('239209','239203','239231','239653','239604','239598')