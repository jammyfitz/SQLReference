-- Foreign content for H4U properties
SELECT * FROM TranslatedAccommodationBuildings where AccommodationBuildingId='16033'

-- Foreign content for Third Party properties
SELECT * FROM TranslatedBedBankHotel where BBHotelId='113937'

-- Number of translated H4U properties for a language
SELECT DISTINCT AccommodationBuildingId FROM TranslatedAccommodationBuildings WHERE LanguageCode='IT' and BrandId='2'
SELECT DISTINCT AccommodationBuildingId FROM TranslatedAccommodationBuildings WHERE LanguageCode='FR' and BrandId='2'

SELECT * FROM BedBankSupplier where BBSupplierId='15'

SELECT * FROM BedBankRoomType where BBRoomTypeId='7134'

SELECT * FROM TranslatedBedBankRoomType

SELECT * FROM Brand
SELECT * FROM BedBankHotel where PropertyId='640621'
SELECT * FROM BedBankHotel where BBHotelId='114963'