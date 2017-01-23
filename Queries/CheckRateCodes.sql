USE Accommodations

SELECT RateCode, RateType, BoardBasis, Request, ChannelTypeID, CommissionPercentage, bedbanksupplier.SupplierName  FROM BedBankRateCode
inner join bedbanksupplier on bedbanksupplier.bbsupplierid = BedBankRateCode.bbsupplierid


select * from bedbanksupplier
SELECT * FROM BedBankRateCode
inner join bedbanksupplier on bedbanksupplier.bbsupplierid = BedBankRateCode.bbsupplierid
WHERE BedBankRateCode.BBSupplierId='17'
ORDER BY RateCode

select * from BedBankRateCode where BBSupplierId=5 and BoardBasis='Room Only'
update BedBankRateCode set BoardBasis='RO' where BoardBasis='Room Only'
--delete from BedBankRateCode where RateCodeId='253'

SELECT * FROM bedbanksupplier order by SupplierName asc

SELECT * FROM Channel
SELECT * FROM ChannelType
SELECT * FROM Channel_RateCode 
inner join BedBankRateCode on BedBankRateCode.RateCodeId = Channel_RateCode.RateCodeId
WHERE ChannelId='24' and BBSupplierId='26'

select * from BedBankRateCode where BBSupplierId = 13
select * from BedBankRateCode where RateCode = '1KD'

SELECT * FROM ChannelRule_BedBankSupplier where BBSupplierId='26'
SELECT * FROM Channel_RateCode

select * from channel where ChannelName = 'MedHotel.DE B2C'
