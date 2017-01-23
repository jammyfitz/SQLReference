-- Check Implementation
select * from BedBankImplementationType

-- Internal Amenities
select * from Amenities order by AmenityName
select * from Amenities where AmenityCode='77'
select * from AmenityCategory

-- Third Party Amenities
select * from BedBankAmenity where BBImpTypeId='13' order by [Description] ASC and Code='13']
select * from BedBankAmenity where BBImpTypeId='6'
select * from BedBankAmenity where BBAmenityId='2552'
select * from BedBankAmenity where Code='1' and BBImpTypeId='12'
select * from BedBankAmenity where Description='Accessible facilities'
select * from BedBankHotel_BedBankAmenity where BBAmenityId = 47 and BBHotelId=85618
select * from BedBankHotel_BedBankAmenity where BBHotelId='2021220'
select * from BedBankHotel_BedBankAmenity where BBHotelId in (854518,854501,854479)

-- OTA to Bedbank Mapping Table - NOT USED ANYMORE
select * from Amenities_BedbankAmenity
select * from Amenities_BedbankAmenity where BBAmenityId='832'
select * from Amenities_BedbankAmenity where AmenityCode='1'
--insert into Amenities_BedbankAmenity values ('243','832')



