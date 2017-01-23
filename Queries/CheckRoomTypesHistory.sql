SELECT * FROM AccommodationBuildings where AccommodationBuildingID=''
SELECT * FROM AccommodationBuildings where BuildingName like '%abcone%'

SELECT * FROM Contracts where AccommodationBuildingId='10169'
SELECT * FROM RoomTypes where RoomTypeID='7118'
SELECT * FROM RoomTypesOnContract where ContractID='38571'

-- Check changes to Room Types
SELECT * FROM Changes..RoomTypesOnContractHistory where ContractID='38571'
order by DateCreated desc

SELECT * FROM Changes..RoomTypesHistory