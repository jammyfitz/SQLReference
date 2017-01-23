!-- Get all properties associated with a place id and all child places
SELECT      PHR.ChildLevel,
      PB.PlaceId,
      PB.Name,
      PB.BBHotelId, 
      PB.AccommodationBuildingId 
FROM  Place P with (nolock)
      inner join PlaceHierarchyRelationship PHR with (nolock) on PHR.PlaceId = P.PlaceId
      inner join PlaceBuilding PB with (nolock) on PB.PlaceId = PHR.ChildId
WHERE P.PlaceId = 256 and BBHotelId IS NULL

!-- Get all active internal properties associated with a place id and all child places
SELECT      PHR.ChildLevel,
      PB.PlaceId, 
      PB.BBHotelId, 
      PB.AccommodationBuildingId 
FROM  Place P with (nolock)
      inner join PlaceHierarchyRelationship PHR with (nolock) on PHR.PlaceId = P.PlaceId
      inner join PlaceBuilding PB with (nolock) on PB.PlaceId = PHR.ChildId
	  inner join AccommodationBuildings AB with (nolock) on PB.AccommodationBuildingId = AB.AccommodationBuildingId
WHERE P.PlaceId = 256 and BBHotelId IS NULL and AB.Active='1'

!-- Get all active 3rd party properties associated with a place id and all child places
SELECT      PHR.ChildLevel,
      PB.PlaceId, 
      PB.BBHotelId, 
      PB.AccommodationBuildingId,
	  BBH.Country
FROM  Place P with (nolock)
      inner join PlaceHierarchyRelationship PHR with (nolock) on PHR.PlaceId = P.PlaceId
      inner join PlaceBuilding PB with (nolock) on PB.PlaceId = PHR.ChildId
	  inner join BedBankHotel BBH with (nolock) on PB.BBHotelId = BBH.BBHotelId
WHERE (P.PlaceId = 169 OR P.PlaceId = 170) and BBH.Active='1' and Country is null