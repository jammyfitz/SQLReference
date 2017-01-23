select * from accommodations..contracts where AccommodationBuildingID='8949'
select * from changes.dbo.contractshistory where AccommodationBuildingID='8949' order by HistoryDateCreated desc

select * from accommodations..ContractRoomAllocation where RoomTypeId='23' and ContractId='52137'
select * from changes.dbo.ContractRoomAllocationhistory where RoomTypeId='23' and ContractId='52137'

select * from accommodations..SystemUserAccounts where userid='8949'