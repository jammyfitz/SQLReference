-- H4U Rooms
select * from roomtypes 
inner join RoomTypesOnContract on RoomTypesOnContract.RoomTypeID = roomtypes.RoomTypeID
where RoomType like '%refundable%'
SELECT * FROM contracts where AccommodationBuildingId='24449'
SELECT * FROM RoomTypes where RoomTypeID='277074'
SELECT * FROM RoomTypes where RoomType like '%Double/Twin%'
SELECT * FROM RoomTypesOnContract where ContractID='88376' and RoomTypeID='2552'

SELECT * FROM AccommodationBuildingPriceRange where RoomTypeOnContractId='269610' order by FromDate

SELECT * FROM AccommodationBuildings
inner join Contracts on Contracts.AccommodationBuildingID = AccommodationBuildings.AccommodationBuildingID
inner join RoomTypesOnContract on RoomTypesOnContract.ContractID = Contracts.ContractID
inner join RoomTypes on RoomTypes.RoomTypeID = RoomTypesOnContract.RoomTypeID
where RoomTypes.RoomType like '%refundable%' and AccommodationBuildings.Active='1'

SELECT Distinct AccommodationBuildings.AccommodationBuildingID FROM AccommodationBuildings
inner join Contracts on Contracts.AccommodationBuildingID = AccommodationBuildings.AccommodationBuildingID
inner join RoomTypesOnContract on RoomTypesOnContract.ContractID = Contracts.ContractID
inner join RoomTypes on RoomTypes.RoomTypeID = RoomTypesOnContract.RoomTypeID
where RoomTypes.RoomType like '%refundable%' and AccommodationBuildings.Active='1'

-- Third Party Rooms
SELECT * FROM BedBankHotel where PropertyId='OEH'
SELECT * FROM BedBankHotel where BBHotelId='124720'
SELECT * FROM BedBankHotel where ChainCode='ATS' and TotalRooms != 0 and Address2 like '%Auckland NZ %'
SELECT * FROM BedBankSupplier
SELECT * FROM BedBankRoomType where BBSupplierId='33'
SELECT * FROM BedBankRoomType where BBRoomTypeId='2722824'
SELECT Count(*) FROM BedBankRoomType where Code='MCODIU-STD'
SELECT Count(*) FROM BedBankHotelRoom where BBHotelId='124720'
SELECT * FROM BedBankHotelRoom where BBHotelId in ('2182133','2182494','2182508','2182524','2182532','2182601','2182656','2182661','2182680','2182697','2182738','2182744')
--delete from BedBankHotelRoom where BBHotelId='124720'
SELECT * FROM BedBankHotelRoom where RoomTypeId='3311530' and BBHotelId='65453'
SELECT * FROM BedBankRateCode where BBSupplierId='33'
SELECT * FROM BedBankHotelRoom where BBHotelId='124720'
SELECT * FROM BedBankRoomType where BBRoomTypeId in ('2182133','2182494','2182508','2182524','2182532','2182601','2182656','2182661','2182680','2182697','2182738','2182744')
--delete from bedbankroomtype where bbroomtypeid in ('2722842','2722843','2722844','2722845','2722846','2722847','2722848','2722849')

--Robs Query for dodgy rooms
select      H.BBHotelId,
      H.ChainCode,
      H.PropertyId,
      H.Name as HotelName,
      HR.Name as HotelRoomName,
      RT.BBRoomTypeId,
      RT.Code, 
      RT.Description 
from  dbo.BedBankHotel H 
      inner join dbo.v_BedBankSupplierMapping SM on SM.ChainCode = H.ChainCode
      left join dbo.BedBankHotelRoom HR on HR.BBHotelId = H.BBHotelId
      left join dbo.BedBankRoomType RT on RT.BBRoomTypeId = HR.RoomTypeId
where  H.BBHotelId = 222210 -- H.Name like '%Pierre & Vacances Saskia Falaise%'
      and SM.BBSupplierId = 30

--delete BedBankHotelRoom where RoomTypeId = 363241
--update BedBankHotelRoom set Name=null where RoomTypeId = 363241
--insert into BedBankHotelRoom values ('222210','363241', 'Apartment 1 bedroom for 4/5 people', 0,0,7)

select * from BedBankRoomType where BBRoomTypeId='363241'
select * from BedBankHotelRoom where RoomTypeId='363241'
