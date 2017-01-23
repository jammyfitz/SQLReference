SELECT BedBankHotel.BBHotelId,
BedBankHotel.Name,
BedBankHotel.Active,
BedBankHotel.NativeCurrency,
BedBankHotel.Rating,
ChainCode, Place.PlaceId,
PlaceName, PlaceCode,
Place.Active,
LastLoadedDate FROM PlaceBuilding
INNER JOIN BedBankHotel on PlaceBuilding.BBHotelId=BedBankHotel.BBHotelId
INNER JOIN Place on PlaceBuilding.PlaceId=Place.PlaceId
where BedBankHotel.BBHotelId in
('2192479')
and ChainCode='VD' and BedBankHotel.Active='1'
--where BedBankHotel.BBHotelId='2192438'
order by PlaceName

SELECT * FROM Place WHERE PlaceId='79'
SELECT * FROM Place WHERE PlaceName like '%Buenos%'