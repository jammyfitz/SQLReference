select      BBH.BBHotelId,
      BBH.ChainCode,
      BBH.PropertyId,
      BBH.Name,
      BBH.Active        
from  BedBankHotel BBH
      inner join V_BedBankSupplierMapping V on V.ChainCode = BBH.ChainCode
where V.BBImpTypeName = 'Pegasus'
order by 
      case when BBH.Name is null then 1 else 0 end,
      BBH.Name


select      *     
from  BedBankHotel BBH
      inner join V_BedBankSupplierMapping V on V.ChainCode = BBH.ChainCode
where V.BBImpTypeName = 'Pegasus'
order by 
      BBH.LastModifiedDate desc
