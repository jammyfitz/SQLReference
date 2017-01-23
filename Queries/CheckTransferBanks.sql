SELECT * FROM TBDestination order by DateCreated desc
SELECT * FROM TBSupplier
SELECT * FROM TBImplementation
SELECT * FROM TBVehicle order by DateCreated desc
SELECT * FROM TBVehicle where TBVehicleID=42 order by TBVehicleName
SELECT * FROM TBVehicle where MaxPax=0
--update tbvehicle set vehicleid=190 where tbvehicleid='331'
SELECT * FROM TBDestination_TBRoute 190
SELECT * FROM TBRoute where FromLocationCode='ACE' and ToLocationCode='598'
SELECT * FROM TBRoute where TBRouteID='1143'
SELECT * FROM TransferVehicles where VehicleName = 'Private Transfer'
--update transfervehicles set MinOccupancyPax=1, MaxOccupancyPax=4 where vehicleid=190
SELECT * FROM TransferVehicles where VehicleID = '190'
SELECT * FROM TransferVehicles where MaxOccupancyPax=0

--insert into tbimplementation values ('HolidayTaxis','1',GETDATE(), 5,GETDATE(),5)
--insert into TBSupplier values ('HolidayTaxis',7,7,2,'1',GETDATE(), 5,GETDATE(),5)

select * from TBDestination where TBSupplierToID='7557' and TBSupplierID='1' and TBSupplierFromID is null
select * from bedbankimplementationtype