-- Report for Marks Meeting
SELECT bedbankSupplier.SupplierName, bedbankhotel.ChainCode, COUNT(*) AS ActiveHotels
FROM bedbankhotel
INNER JOIN BedBankchaincode
ON bedbankChainCode.ChainCode=BedBankHotel.ChainCode
INNER JOIN bedbanksupplier
ON bedbankChainCode.BBSupplierId=bedbankSupplier.BBSupplierId 
INNER JOIN bedbankimplementationtype
ON bedbankSupplier.BBImpTypeId=bedbankimplementationtype.BBImpTypeId
WHERE
bedbankhotel.Active='1'
GROUP BY bedbankSupplier.SupplierName, bedbankhotel.ChainCode
ORDER BY bedbankSupplier.SupplierName, bedbankhotel.ChainCode

SELECT Count(DISTINCT AccommodationBuildings.AccommodationBuildingID)  FROM AccommodationBuildings
--SELECT * FROM AccommodationBuildings
INNER JOIN Contracts
ON Contracts.AccommodationBuildingID=AccommodationBuildings.AccommodationBuildingID
WHERE AccommodationBuildings.Active='1' and Contracts.Active='1'

select * from contracts