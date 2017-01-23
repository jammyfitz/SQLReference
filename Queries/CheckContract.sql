USE Accommodations

-- Multiple contract fix
select * from contracts where AccommodationBuildingID='9520'
select * from contracts where ContractID='82436'
select * from contracts order by DateCreated
--update contracts set Active=0 where ContractID='57573'

-- Check supplier
select * from suppliers where suppliername like '%Avail%'
select * from suppliers where supplierid=6033

-- Configure extranet supplier account
select * from contracts where AccommodationBuildingID='11053'
select * from contracts where AccommodationBuildingID='11047'
--update systemusers set IsSupplier='TRUE' where SystemUserCompanyId='18660'
--update systemusers set SupplierID='7752' where SystemUserCompanyId='18660'
--update contracts set SupplierID='7752' where AccommodationBuildingID='11053'
--update contracts set SupplierID='7752' where AccommodationBuildingID='11047'



select * from roomtypesoncontract where RoomTypeOnContractID=77679028
select * from RoomTypesOnContract where ContractID=96883

select * from AccommodationBuildingPriceRange where RoomTypeOnContractID=585838