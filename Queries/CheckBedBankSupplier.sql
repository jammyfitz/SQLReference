-- Check BedBankSupplier
select * from bedbanksupplier
select * from bedbanksupplier where BBSupplierId=66
select * from bedbanksupplier where BBSupplierId=5

select * from BedBankHotel where ChainCode='MT'
select * from bedbankChainCode where ChainCode='JUM'

select * from bedbankChainCode where BBSupplierId=6
select * from bedbankimplementationtype where BBImpTypeId=22
select * from gdssuppliers where ChainCode='JUM'
select * from gdssuppliers where SupplierId='14738'
select * from GDSSuppliers where GDSID='67'
--update GDSSuppliers set IsActive=0 where GDSID='67'
select * from suppliers where supplierid='14738'
select * from Suppliers where SupplierID=12544 or SupplierID=8537
select * from BedBankSupplier where BBSupplierId='53'
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

