-- Check Allocation
select * from ContractRoomAllocation where ContractId='54221' --and RoomTypeId='6325' ORDER BY ModifiedDate Desc
--select * from Changes..ContractRoomAllocationHistory where ContractId='55449'
and RoomTypeId='6325'
and FromDate >= '1Nov2014'
and ToDate <= '31Oct2015'
order by HistoryDateCreated asc

-- Check Price Bands
select * from Accommodations..Contracts where AccommodationBuildingID='13616' and Active='1'
select * from Accommodations..Contracts where ContractID='54221'
select * from Accommodations..RoomTypesOnContract where ContractID='54221' and RoomTypeID='190'
select * from Accommodations..RoomTypesOnContract where RoomTypeOnContractID='293472'
select * from AccommodationBuildingPriceRange where RoomTypeOnContractID='293472'
select * from AccommodationBuildingPriceRange where AccommodationBuildingPriceRangeID='13913912'
select * from Accommodations..InventoryManagerBuilding where AccommodationBuildingId='5951'
select * from SystemUsers where SystemUserCompanyID='18513'
select * from Changes..AccommodationBuildingPriceRangeHistory where RoomTypeOnContractID='277345' order by HistoryDateCreated
