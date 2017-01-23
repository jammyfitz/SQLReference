CREATE TABLE #Yaks (
BedBankHotelID varchar(max)
)

CREATE TABLE #Yaks2 (
PropertyID varchar(max))

select * from #Yaks2
select * from v_bedbanksuppliermapping

!-- Get list of Hilton properties
select BBHotelId,bbh.ChainCode,PropertyId, bbh.Name, Description, Address1, Address2, City, State, Country, Rating, Active, DateCreated from bedbankhotel bbh
inner join v_bedbanksuppliermapping V on V.CHainCode = bbh.ChainCode
where v.bbimptypename = 'hilton' order by DateCreated desc

select * from BedBankHotel where BBHotelId='64995'
select * from bedbankhotel where PropertyId='01982'
select * from bedbankhotel where Name like '%Hilton Taba Resort%'
--3568 in Hilton List and in our database

-- Mapping Query
select * from #yaks Y
left outer join 
	(
	select	BBhotelId, bbh.ChainCode, PropertyId, EM.EntityMappingId, EM.MappingId1, EM.MappingId2 
	from	bedbankhotel bbh 
			inner join v_bedbanksuppliermapping V on V.CHainCode = bbh.ChainCode
			inner join EntityMapping EM on EM.MappingId2 = bbh.PropertyId
	where	v.bbimptypename = 'hilton'
	) BBH on bbh.BBHotelId = Y.BedBankHotelID collate database_default


select * from v_BedBankSupplierMapping
select * from bedbanksupplier
select * from BedBankChainCode where BBSupplierId='17'

-- Mapping Query 2
select	BBhotelId, bbh.ChainCode, PropertyId, EM.EntityId1, EM.MappingId1, EM.MappingId2 
from	bedbankhotel bbh 
		left join BedBankChainCode BBCC on BBCC.ChainCode = bbh.ChainCode
		left join EntityMapping EM on EM.MappingId2 = bbh.PropertyId
where	BBCC.Description = 'Hilton'
and EntityId1 is null
--and bbh.ChainCode='HL'


select * from entitymapping 
where entitycategory = 'HMAP' 
and mappingid1 = ''
order by mappingid2

select * from bedbankhotel where BBHotelid='87288'
select * from bedbankhotel where PropertyId='01790'
select * from bedbankhotel where Name like '%Hilton Sharks Bay%'
select * from entitymapping where entitycategory='HMAP' and EntityID1='QKBVR'
select * from entitymapping where entitycategory='HMAP' and MappingId2='01982'
select * from entitymapping where entitycategory='HMAP' and EntityID1='04205'
select * from entitymapping where entitycategory='HMAP' and EntityID1='ABEGIGI'
--update entitymapping set MappingId1='HH' where entitycategory='HMAP' and MappingId2='18402'
--insert into EntityMapping values ('LAXHO',null,null,'GI','24942',null,'HMAP')


-- bbhotel.PropertyID links with entitymapping.MappingId2
select * from entitymapping where MappingId2 in
('01382','02770','04749','04992','06898','08638','10146','12179','16553','17013','25475','2770','39685','39878','41804','42941','48442','49180','51768','54063','60702','61219','62367','64235','73555','79375','82481','95491','97422','99182')
order by MappingId2 asc

insert into EntityMapping values ('DOHHD',null,null,'HL','90801',null,'HMAP')

--INSERT INTO EntityMapping VALUES('BEYHG',null,null,'HL','29446',null,'HMAP')
--INSERT INTO EntityMapping VALUES('BEYMP',null,null,'HL','49652',null,'HMAP')
--INSERT INTO EntityMapping VALUES('NYCFD',null,null,'HH','62340',null,'HMAP')

select * from bedbankhotel where BBHotelId=65141
select * from BedBankHotel where PropertyId='TXLBC'
select * from bedbankhotel where ChainCode='WA' and Active='1'
select * from bedbankhotel where Name like '%Hilton Deansgate%'
--update bedbankhotel set PropertyId='04922' where Name like '%Hilton Deansgate%'
--update bedbankhotel set Active='1', Rating='3', IsVPayment='1' where BBHotelId=64563


select * from bedbankhotel where PropertyId='MCOVS'
select * from entitymapping WHERE entitycategory='HMAP' and MappingId2='TXLBC'
select * from entitymapping where entitycategory='HMAP' and MappingId2='26982'
--update entitymapping set MappingId1='WA' where entitymappingid='191541'
--INSERT INTO EntityMapping VALUES('SZDCR',null,null,'HL','12634',null,'HMAP')


