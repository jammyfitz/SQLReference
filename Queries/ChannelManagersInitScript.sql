USE Accommodations

begin
-- Declarations
declare @SystemUserCompanyID int
declare @UserId int
declare @UserName varchar(200)
declare @AccommodationId1 int
declare @AccommodationId2 int

-- Initialisations
set @UserName = 'MaximojoINVXML'
set @UserID = (SELECT UserID from SystemUserAccounts WHERE UserName = @UserName)
set @SystemUserCompanyId = (SELECT SystemUserCompanyId from SystemUserAccounts WHERE UserName = @UserName)
set @AccommodationId1 = (SELECT top 1 AccommodationBuildingID FROM AccommodationBuildings WHERE active='1' order by NEWID())
set @AccommodationId2 = (SELECT top 1 AccommodationBuildingID FROM AccommodationBuildings WHERE active='1' and AccommodationBuildingID != @AccommodationId1 order by NEWID())
	
-- Start error checking on whether IDs are in InventoryBuildings or not

	if @UserName is null 
		or not exists(SELECT * FROM SystemUserAccounts WHERE UserName = @UserName)
	begin
		raiserror('UserName is either null or does not exist in database',16,2)
		return
	end

	if @AccommodationId1 is null 
		or exists(SELECT * FROM InventoryManagerBuilding WHERE AccommodationBuildingID=@AccommodationId1 and SystemUserCompanyId = @SystemUserCompanyId)
	begin
		raiserror('AccommodationId1 is either null or already has records present in InventoryManagerBuilding',16,2)
		return
	end
	
	if @AccommodationId2 is null 
		or exists(SELECT * FROM InventoryManagerBuilding WHERE AccommodationBuildingID=@AccommodationId2 and SystemUserCompanyId = @SystemUserCompanyId)
	begin
		raiserror('AccommodationId2 is either null or already has records present in InventoryManagerBuilding',16,2)
		return
	end
end

-- Error checking finished, start updates and inserts
UPDATE AccommodationBuildings SET BuildingName='Test Hotel One' WHERE AccommodationBuildingID=@AccommodationId1
UPDATE AccommodationBuildings SET BuildingName='Test Hotel Two' WHERE AccommodationBuildingID=@AccommodationId2
UPDATE SystemUsers SET SellCurrencyCode='GBP' WHERE SystemUserCompanyId=@SystemUserCompanyId	
	
INSERT INTO InventoryManagerBuilding VALUES (@SystemUserCompanyId,@AccommodationId1)
INSERT INTO InventoryManagerBuilding VALUES (@SystemUserCompanyId,@AccommodationId2)
