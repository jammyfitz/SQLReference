--update transferorderdetails set fromLocationType = '2' where fromLocationType = '1' and toLocationCode = 'SSH'

--update accItemResvStatus set sellingExchangeRate = 1 where sellingExchangeRate <> 1 and typeOfItem = 'Transfers'
and accItemResvStatusId > 4089100
