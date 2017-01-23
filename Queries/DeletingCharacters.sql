Select charindex(char(10),Description, 1), Description
from BedBankHotel
where BBHotelId = '258532'

select * from BedBankHotel where BBHotelId='258532'
select * from BedBankHotel where PropertyId = 'LONLT'

select * from BedBankHotel where CONTAINS(Description, char(10))

--UPDATE BedBankHotel SET [Description] = replace([Description], char(10), '') WHERE BBHotelId = '57779'

select  *    
from  BedBankHotel BBH
      inner join V_BedBankSupplierMapping V on V.ChainCode = BBH.ChainCode
where V.BBImpTypeName = 'Pegasus'
order by DateCreated desc
