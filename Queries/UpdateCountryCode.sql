select * from place where PlaceCode like 'C1JAMRUNA'

!-- Tonys Country Code update query
SELECT      PHR.ChildLevel,
      PB.PlaceId, 
      PB.BBHotelId 
FROM  Place P with (nolock)
      inner join PlaceHierarchyRelationship PHR with (nolock) on PHR.PlaceId = P.PlaceId
      inner join PlaceBuilding PB with (nolock) on PB.PlaceId = PHR.ChildId
        inner join BedBankHotel BBH with (nolock) on PB.BBHotelId = BBH.BBHotelId
WHERE (P.PlaceId = 1673 OR P.PlaceId = 1671 OR P.PlaceId = 1674) and BBH.Active='1'



