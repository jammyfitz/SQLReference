select * from vehicle

select 
      TransferContractID, TransferDateBandsID, FromLocationCode,  TDB.FromDate, tdb.ToDate,
      case FromLocationType when 1 then 'Airport' when 2 then 'Resort' when 3 then 'Building' end as FromLocationType,
      case TolocationType when 1 then 'Airport' when 2 then 'Resort' when 3 then 'Building' end as ToLocationType,
      case TolocationType when 1 then 'ToLocationCode' when 2 then Resorts.ResortName      when 3 then AccommodationBuildings.BuildingName End as ToLocation
      
      
      From RoutesOnTransferContracts ROTC
            inner join TransferDateBands TDB on rotc.RouteOnTransferContractID = tdb.RouteOnTransferContractID
            left outer Join Resorts on Resorts.ResortID = ToLocationCode
            Left Outer join AccommodationBuildings on AccommodationBuildingID = ToLocationCode
            
      where 
      -- FromLocationCode is the Airport Code
            FromLocationCode like '%DLM%' and 
            TDB.Todate>GETDATE()
      
      order by ToLocation

      Declare     @TransferDateBandsID int
      set @TransferDateBandsID = 8373

      select * From PricesOnTransferDateBand where TransferDateBandsID =       @TransferDateBandsID
      --select * From VehiclesOnDateBandPrices where PriceOnTansferDateBandID in (select PriceOnTansferDateBandID From PricesOnTransferDateBand where TransferDateBandsID =       @TransferDateBandsID)
      select * From TransferVehicles where VehicleID in (select VehicleID From VehiclesOnDateBandPrices where PriceOnTansferDateBandID in (select PriceOnTansferDateBandID From PricesOnTransferDateBand where TransferDateBandsID =   @TransferDateBandsID))


-- All transfers tables. Transfers API ID Format TransferContractID:PriceOnTansferDateBandID:
--select * from TransferContracts where TransferContractID='394'
--select * from RoutesOnTransferContracts
--select * from TransferDateBands where TransferDateBandsID = '18086'
--select * from PricesOnTransferDateBand where TransferDateBandsID = '18086'
--select * from VehiclesOnDateBandPrices
--select * from TransferVehicles

--transfers contract contains 

--select * From TransferContracts where Active=1
--select top 10 * From RoutesOnTransferContracts
--select top 10 * From TransferDateBands 
--select top 10 * From PricesOnTransferDateBand

select 
      TransferContractID, TransferDateBandsID, FromLocationCode,  TDB.FromDate, tdb.ToDate,
      case FromLocationType when 1 then 'Airport' when 2 then 'Resort' when 3 then 'Building' end as FromLocationType,
      case TolocationType when 1 then 'Airport' when 2 then 'Resort' when 3 then 'Building' end as ToLocationType,
      case TolocationType when 1 then 'ToLocationCode' when 2 then Resorts.ResortName      when 3 then AccommodationBuildings.BuildingName End as ToLocation
      
      
      From RoutesOnTransferContracts ROTC
            inner join TransferDateBands TDB on rotc.RouteOnTransferContractID = tdb.RouteOnTransferContractID
            left outer Join Resorts on Resorts.ResortID = ToLocationCode
            Left Outer join AccommodationBuildings on AccommodationBuildingID = ToLocationCode
            
      where 
            FromLocationCode like '%SSH%' and 
            TDB.Todate>GETDATE()
      
      order by TransferContractID, FromDate

      Declare     @TransferDateBandsID int
      set @TransferDateBandsID = 4178

      select * From PricesOnTransferDateBand where TransferDateBandsID =       @TransferDateBandsID
      ---select * From VehiclesOnDateBandPrices where PriceOnTansferDateBandID in (select PriceOnTansferDateBandID From PricesOnTransferDateBand where TransferDateBandsID =       @TransferDateBandsID)
      select * From TransferVehicles where VehicleID in (select VehicleID From VehiclesOnDateBandPrices where PriceOnTansferDateBandID in (select PriceOnTansferDateBandID From PricesOnTransferDateBand where TransferDateBandsID =   @TransferDateBandsID))
