USE Accommodations

-- Third Party Stock
SELECT * FROM BedBankHotel where BBHotelId='88671'
SELECT * FROM BedBankHotel where PropertyId='ABEGES' or PropertyId='ABICSU'
SELECT * FROM BedBankHotel where Name like '%79902%'
SELECT * FROM BedBankHotel where Chaincode='FB' and Active=1 order by DateCreated desc

-- Internal Stock
SELECT * FROM AccommodationBuildings where AccommodationBuildingId='24125'
SELECT * FROM AccommodationBuildings where BuildingName like '%Al%' order by BuildingName asc

-- Internal Images
SELECT * FROM Images where AccommodationBuildingId='31'

-- Third Party Image Table
SELECT * FROM BedBankHotelImage where BBHotelId='6068'
SELECT * FROM BedBankHotelImage where BBHotelId='51112'
in 
('237507','237505','237504','237502','237501','237500','237499','237497','237496','237495','237494','237493','237492','237491','237490','237488','237487','237486','237485','237484','237483','237482','237481','237479','237478','237477','237476','237474','237473','237472','237471','237470','237469','237467','237466','237465','237464','237452','237451','237450','237449','237448','237446','237444','237443','237442','237441','237440','237439','237438','237437','237436','237435','237434','237433','237432','237431','237430','237429','237428','237426','237425','237424','237423','237422','237421','237420','237419','237418','237417','237416','237415','237414','237413','237412','237410','237408','237407','237406','237405','237404','237403','237402','237401','237400','237399','237398','237397','237396','237395','237394','237393','237392','237391','237390','237388','237387','237386','237385','237384','237383','237382','237381','237380','237378','237377','237376','237375','237374','237373','237372','237371','237370','237369','237368','237367','237365','237364','237363','237362','237361','237360','237359','237358','237357','237356','237355','237354','237353','237352','237351','237350','237348','237347','237346','237345','237344','237343','237342','237341','237340','237339','237337','237334','237333','237332','237331','237330','237329','237328','237327','237326','237325','237324','237323','237322','237321','237320','237319','237318','237317','237316','237315','237314','237313','237312','237311','237310','237309','237308')

SELECT * FROM BedBankHotelImage where URL like '%rezgateway%'
SELECT * FROM BedBankHotelImage where ImageCount='44'
SELECT count(*) FROM BedBankHotelImage

-- Change Default Image
--UPDATE BedBankHotelImage SET URL='http://images.travelnow.com/hotels/PAR_SIGL-bathr-1.jpg' where BBImageId='1305798'

-- Remove Image
SELECT * FROM BedBankHotelImage where BBHotelId in ('265169','265168','265165','265153')
--DELETE FROM BedBankHotelImage where BBImageId='7637355'
--DELETE FROM BedBankHotelImage where BBHotelId='1111883'

-- Temporary table for Downloading and Importing H4U Images
exec ta_spp_selectbuildingloadimages

select BedBankHotel.*, COUNT(BedBankHotelImage.BBHotelId) as ImageCount  from BedBankHotel 
left join BedBankHotelImage on BedBankHotel.BBHotelId=BedBankHotelImage.BBHotelId
group by BedBankHotel.BBHotelId;

SELECT
   bbh.BBHotelId,
   bbh.ChainCode,
   bbh.Active,
   bbh.LastLoadedDate,
   count(bbhi.BBHotelId) as ImageCount
   --(SELECT COUNT(*) FROM BedBankHotelImage WHERE bbh.BBHotelId = BedBankHotelImage.BBHotelId) AS ImageCount 
FROM 
   BedbankHotel bbh
   inner join dbo.v_BedBankSupplierMapping sm on bbh.Chaincode = sm.ChainCode
   left join dbo.BedBankHotelImage bbhi on bbhi.BBHotelId = bbh.BBHotelId
where sm.BBImpTypeId = 2
group by bbh.BBHotelId,
	bbh.ChainCode,
	bbh.Active,
	bbh.LastLoadedDate
having count(bbhi.BBHotelId) = 0
   
select count(1) from BedBankHotel