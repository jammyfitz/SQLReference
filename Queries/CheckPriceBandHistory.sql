-- Check Price Bands
select * from Accommodations..Contracts where AccommodationBuildingID='4147'
select * from Accommodations..Contracts where ContractID='61456'
select * from Accommodations..RoomTypesOnContract where ContractID='61456' and RoomTypeID='1844'
select * from Accommodations..RoomTypesOnContract where RoomTypeOnContractID='330331'
select * from AccommodationBuildingPriceRange where RoomTypeOnContractID='313285'
select * from AccommodationBuildingPriceRange where AccommodationBuildingPriceRangeID='37325610'
select * from Accommodations..InventoryManagerBuilding where AccommodationBuildingId='5951'
select * from SystemUsers where SystemUserCompanyID='18513'
select * from Changes..AccommodationBuildingPriceRangeHistory
--where RoomTypeOnContractID='313285' 
where AccommodationBuildingPriceRangeID in (37325610)
--and HistoryDateCreated > '01-Jan-2013'
--and FromDate <= '21Apr2013'
--and ToDate >= '21Apr2013'
order by HistoryDateCreated

select * from RoomTypes where roomtypeid='15864'

-- Check Allocation
select * from ContractRoomAllocation where ContractId='61456' and RoomTypeId='1844' ORDER BY ModifiedDate Desc
select * from Changes..ContractRoomAllocationHistory
where ContractId='61456'
and RoomTypeId='1844'
and FromDate <= '21Apr2013'
and ToDate >= '21Apr2013'
and HistoryDateCreated > '01-Oct-2012'
order by HistoryDateCreated asc