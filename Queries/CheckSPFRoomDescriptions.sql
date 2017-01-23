-- Blank BBHotelRoom description
SELECT     BedBankHotelRoom.BBHotelId, BedBankHotelRoom.RoomTypeId, BedBankHotelRoom.Name, BedBankHotelRoom.MaxAdults, BedBankHotelRoom.MaxChildren, 
                      BedBankHotelRoom.MaxOccupancy, BedBankHotel.ChainCode, BedBankChainCode.BBSupplierId, BedBankSupplier.SupplierName
FROM         BedBankHotelRoom INNER JOIN
                      BedBankHotel ON BedBankHotelRoom.BBHotelId = BedBankHotel.BBHotelId INNER JOIN
                      BedBankChainCode ON BedBankHotel.ChainCode = BedBankChainCode.ChainCode INNER JOIN
                      BedBankSupplier ON BedBankChainCode.BBSupplierId = BedBankSupplier.BBSupplierId
WHERE     (BedBankHotelRoom.Name = '')
AND BedBankChainCode.ChainCode='BNT'
ORDER BY BedBankChainCode.BBSupplierId



-- Blank BBRoomType description
SELECT     BedBankRoomType.BBRoomTypeId, BedBankRoomType.Code, BedBankRoomType.Description, BedBankRoomType.BBSupplierId, 
                      BedBankSupplier.SupplierName
FROM         BedBankRoomType INNER JOIN
                      BedBankSupplier ON BedBankRoomType.BBSupplierId = BedBankSupplier.BBSupplierId
WHERE     (BedBankRoomType.Description = '')
ORDER BY BedBankRoomType.BBSupplierId


select    *
from  BedBankHotelRoom HR
      inner join BedBankHotel H on h.BBHotelId = HR.BBHotelId 
--where ISNULL(HR.name,'') = ''
where H.chaincode = 'BNT'
and RoomTypeId=465861 or RoomTypeId=466045
and PropertyId='1159'

select * from BedBankRoomType where BBRoomTypeId in (2498534,2498535,2498536,2498538)
select * from BedBankRoomType where BBRoomTypeId=465861 or BBRoomTypeId=466045
select * from BedBankRoomType where Code='3953-2'
select * from BedBankRoomType where BBSupplierId = '28'
select * from bedbanksupplier where BBSupplierId = '28'

select      BBSupplierId, 
      count(*) BanksOrNull,
      count(*) * 1.0 / (
            select      count(*)
            from  BedBankRoomType 
            where BBSupplierId = RT.BBSupplierId 
            ) * 100 PercentBlank
from  BedBankRoomType  RT
where isnull(Description,'') = ''
group by BBSupplierId
order by 3 desc, 2 desc
