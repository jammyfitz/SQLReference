select * from LocalTax where AccommodationBuildingID like '14402'
select * from LocalTaxCalculationType

update LocalTax
set 
ValueType = 'V',--'P' ,-- 
--Value = '0'
CurrencyCode =  'GBP', -- 'AUD', --'''EUR', -- 'USD' -- 
CalculationTypeID = '2'-- '2', -- '3', -- '4',
--MinAge = '0', -- 'NULL', -- '5', -- '12',
--MaxAge = '0', -- 'NULL', -- '12', -- '18',

where AccommodationBuildingID like '9478'

insert into LocalTax values (7991,'V',10,'EUR',1,null,null)

select * from ExchangeRates where CurrencyCode = 'Eur'
select * from ExchangeRates where CurrencyCode = 'USD'
