select * from bedbankratecode where BBSupplierId!=17
select * from bedbanksupplier
select * from bedbanksupplier where BBSupplierId=29
select * from bedbanksupplier where BBSupplierId=5

select * from BedBankHotel where ChainCode='CM'
select * from bedbankChainCode where ChainCode='CM'
select * from bedbankChainCode where [Description] like '%Hotel%'

select * from Repository.dbo.BedBankHotelPriceImportLog where LogDate > '2014-mar-21'
select * from v_BedBankSupplierMapping
select * from bedbankChainCode where BBSupplierId=29
select * from bedbankimplementationtype where BBImpTypeId=17
select * from gdssuppliers where ChainCode='SA'
select * from gdssuppliers where SupplierId='29'
select * from GDSSuppliers where GDSID='84'
select * from GDSSuppliers where GDSName='Hotels4U'
--update GDSSuppliers set ChainCode='EU' where GDSID='124'
--update BedBankSupplier set Active=1 where BBSupplierId='65'
select * from suppliers where supplierid='7529'
select * from suppliers where SupplierName like '%You%'
select * from Suppliers where SupplierID=14641 or SupplierID=8537
select * from BedBankSupplier where BBSupplierId='29'
-- Creating a new Chain Code
--insert into BedBankSupplier values ('UniversalOrlando',2,1,'','CreditCard','Guarantee',0)
--insert into bedbankChainCode values ('UE','Universal Orlando',37)
--insert into GDSSuppliers values (99,'UniversalOrlando',8537,null,null,null,'1',null,null,null,'0',GETDATE(),null,GETDATE(),null,0.00,0.00,'UE ','0')
--insert into Suppliers values ('UniversalOrlando','Prestige House','23-26 High Street','Egham','Surrey','Europe','TW20 9DU',null,'GB',null,null,null,null,null,'-1','0',null,'GBP',null,null,null,null,null,null,'NA',null,null,null,null,'0.00',null,'0','PB','0','1',null,'1','1',null,null)
ta_spp_SelectBedBankSupplierMapping

-- Get Chain Code List
SELECT bedbankChainCode.ChainCode, GDSName, IsActive
FROM bedbankChainCode
INNER JOIN gdssuppliers
ON bedbankChainCode.ChainCode=gdssuppliers.ChainCode
WHERE IsActive='1'

