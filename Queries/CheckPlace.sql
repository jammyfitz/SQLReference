-- Places
SELECT * FROM Place where PlaceId ='18'
SELECT * FROM Place where PlaceName like '%Burundi%'
SELECT * FROM Place where PlaceCode like 'DEBER%'
SELECT * FROM Place where ParentId='11004'

-- Place Mapping to a Hotel
SELECT * FROM PlaceBuilding WHERE AccommodationBuildingId='16033'
SELECT * FROM PlaceBuilding WHERE BBHotelId='2175696'
SELECT * FROM PlaceBuilding WHERE PlaceId='3860'
SELECT * FROM PlaceBuilding WHERE BBHotelId in 
('2215430','2215431','2215432','2215433','2215434')
SELECT * FROM BedBankHotel where ChainCode='ATS' and Address2 like '%SYD%'
SELECT * FROM BedBankHotel where ChainCode='ATI' and City like '%Toronto%'

SELECT * FROM PlaceBuilding 
inner join BedBankHotel on PlaceBuilding.BBHotelId=BedBankHotel.BBHotelId
WHERE PlaceId='4245' and ChainCode='ATS'
SELECT * FROM PlaceBuilding where BBHotelId in
('2182133','2182494','2182508','2182524','2182532','2182601','2182656','2182661','2182680','2182697','2182738','2182744')

SELECT * FROM PlaceBuilding WHERE PlaceId='9164' and BBHotelId='235343'
SELECT * FROM PlaceAirport WHERE PlaceId='9510'
SELECT * FROM dbo.PlaceLocation
SELECT * FROM Resorts
-- INSERT INTO PlaceBuilding VALUES (null,2182133,4013)
SELECT * FROM BedBankImplementationType
SELECT * FROM BedBankPlace WHERE BBImpTypeId=23
SELECT * FROM BedBankHotel WHERE BBHotelId='2119882'
SELECT * FROM BedBankHotel where PropertyId in
('AGMAKL','JETAKL','KIAAKL','KIQAKL','LANAKL','NFCAKL','PREAKL','PULAKL','QONAKL','QUMAKL','SEBAKL','SHAAKL')

SELECT * FROM BedBankHotel WHERE ChainCode='INH'
and City like '%Grindelwald%'

-- Find out where properties are mapped
SELECT BedBankHotel.BBHotelId, ChainCode, Place.PlaceId, PlaceName, PlaceCode, LastLoadedDate FROM PlaceBuilding
INNER JOIN BedBankHotel on PlaceBuilding.BBHotelId=BedBankHotel.BBHotelId
INNER JOIN Place on PlaceBuilding.PlaceId=Place.PlaceId
where ChainCode='JUM'