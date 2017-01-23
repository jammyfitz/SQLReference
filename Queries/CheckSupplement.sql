-- Supplement search
select      AB.BuildingName, BB.BoardBasis, RT.RoomType, ST.SupplementName, CS.*
from  SupplementTypes ST
      inner join ContractSupplements CS
            on CS.SupplementTypeID = ST.SupplementTypeID
      inner join RoomTypesOnContract RTOC
            on RTOC.RoomTypeOnContractID = CS.RoomTypesOnContractID
      inner join RoomTypes RT
            on RT.RoomTypeID = RTOC.RoomTypeID
      inner join BoardBasis BB
            on BB.BoardBasisID = RTOC.BoardBasisID
      inner join Contracts C
            on C.ContractID = RTOC.ContractID
      inner join AccommodationBuildings AB
            on AB.AccommodationBuildingID = C.AccommodationBuildingID

where ST.SupplementCode = 'Single'
and BuildingName='Banyan Tree Bangkok'
--and   CS.FromDate <= GETDATE()
--and   CS.ToDate >= GETDATE()
--and   C.FromDate <= GETDATE()
--and   C.ToDate >= GETDATE()
and   C.Active = '1'
and   AB.Active = '1'
