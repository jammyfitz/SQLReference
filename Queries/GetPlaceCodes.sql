select * from place where PlaceCode like 'CUCAO'

-- PlaceHierarchy Breadcrumb
select      PHR.ChildLevel,
      PB.PlaceId, 
      PB.BBHotelId, 
      PB.AccommodationBuildingId 
from  Place P with (nolock)
      inner join PlaceHierarchyRelationship PHR with (nolock) on PHR.PlaceId = P.PlaceId
      inner join PlaceBuilding PB with (nolock) on PB.PlaceId = PHR.ChildId
--where P.PlaceId = 97

select dbo.funGetPlaceBreadcrumbStr(19, ' > ',0)

select dbo.funGetPlaceBreadcrumbStr(19, ' > ',0) from PlaceBuilding 