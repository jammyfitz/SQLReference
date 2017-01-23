USE Accommodations

select * from currency
select * from ExchangeRates where CurrencyCode='EUR'
-- Table that contains the Exchange Rates used in the past
select * from ExchangeRateHistory where CurrencyCode='AUD' order by LastModifiedDate desc

-- Stored Procedure returns exchange rate that was applicable for that day
select dbo.GetExchangeRate('2011 mar 22', 'EUR')
