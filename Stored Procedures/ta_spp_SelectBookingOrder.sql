USE [Accommodations]
GO
/****** Object:  StoredProcedure [dbo].[ta_spp_SelectBookingOrder]    Script Date: 11/30/2016 17:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**************************************************************************************************
	Procedure Name		ta_spp_SelectBookingOrder
	Created By		Nagul
	Date Created		14/07/2003
	Description		Search BookingOrders based on the criteria
	
	Updates:
	Date			Author		Purpose
	16/01/08		DT		Restructured SP.
	30/06/08		DT		Add Search option 8, BookingSubRefNo
**************************************************************************************************/

ALTER PROCEDURE [dbo].[ta_spp_SelectBookingOrder] 
	@vchSeachString	VARCHAR(50),
	@vchSearchType	VARCHAR(1),		-- 1 - Departure Date, 2 - Booking Date, 3 - Lead Name, 4 - Hotel Name, 5 - Resort Name,  6 - Supplier Name, 7 - Booking Order, 8 - BookingSubRefNo
	@vchSearchString1 VARCHAR(50) = ' '-- To be used for the date range search
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @SQLSTRING NVarchar(4000)
	DECLARE @BookingDetails TABLE 
		(
		BookingRefNo INT, 
		BookingSubRefNo	VARCHAR(50),
		DepartureDate DATETIME, 
		ReturnDate DATETIME, 
		UKArrivalDate DATETIME, 
		Duration TINYINT, 
		Adults	TINYINT, 
		Children TINYINT, 
		TotalInfants TINYINT, 
		TotalSeniorCitizens TINYINT, 
		TotalPaymentDueDate DATETIME,
		TotalOnBookingOrder TINYINT, 
		Status VARCHAR(50), 
		Total MONEY, 
		TotalPaid MONEY,		 
		Balance MONEY,
		DepositDueDate DATETIME, 
		DateCreated DATETIME, 
		ResortName VARCHAR(100), 
		BuildingName VARCHAR(100),
		LeadName VARCHAR(100)
		)


	if @vchSearchType in ('1','2')
		set @vchSearchString1 = @vchSearchString1 + ' 23:59:59'


	IF @vchSearchType = '1'	-- BASED ON DEPARTURE DATE
	BEGIN
		INSERT INTO @BookingDetails
		SELECT DISTINCT 
			BookingOrders.BookingRefNo, 
			BookingOrders.BookingSubRefNo,
			BookingOrders.DepartureDate,
			BookingOrders.ReturnDate,
			BookingOrders.UKArrivalDate, 
			BookingOrders.TotalDays AS Duration, 
			BookingOrders.TotalAdults AS Adults, 
			BookingOrders.TotalChildren AS Children, 
			BookingOrders.TotalInfants, 
			BookingOrders.TotalSeniorCitizens, 
			BookingOrders.TotalPaymentDueDate,
			BookingOrders.TotalOnBookingOrder, 
			BookingOrders.BookingStatus Status, 
			BookingOrders.Total, 
			BookingOrders.TotalPaid,
			BookingOrders.Balance,  
			BookingOrders.DepositDueDate,
			BookingOrders.DateCreated,
			' ' AS ResortName, 
			' ' AS BuildingName,
			(
			select top 1 Name + ' ' + Surname 
			from 	CustomerOnBookingOrder
				inner join Customers on Customers.CustomerID = CustomerOnBookingOrder.CustomerID 
			where 	CustomerOnBookingOrder.BookingRefNo = BookingOrders.BookingRefNo
			) as LeadName
		FROM 	BookingOrders
		where 	BookingOrders.DepartureDate >= convert(datetime,@vchSeachString)  
			and BookingOrders.DepartureDate <= convert(datetime,@vchSearchString1)


	END
		

	IF @vchSearchType = '2'			-- BASED ON BOOKING DATE
	BEGIN

		INSERT INTO @BookingDetails
		SELECT 	DISTINCT 
			BookingOrders.BookingRefNo, 
			BookingOrders.BookingSubRefNo,
			BookingOrders.DepartureDate,
			BookingOrders.ReturnDate,
			BookingOrders.UKArrivalDate, 
			BookingOrders.TotalDays AS Duration, 
			BookingOrders.TotalAdults AS Adults, 
			BookingOrders.TotalChildren AS Children, 
			BookingOrders.TotalInfants, 
			BookingOrders.TotalSeniorCitizens, 
			BookingOrders.TotalPaymentDueDate,
			BookingOrders.TotalOnBookingOrder, 
			BookingOrders.BookingStatus Status, 
			BookingOrders.Total, 
			BookingOrders.TotalPaid,
			BookingOrders.Balance,  
			BookingOrders.DepositDueDate,
			BookingOrders.DateCreated,
			' ' AS ResortName, 
			' ' AS BuildingName,
			(
			select 	top 1 Name + ' ' + Surname 
			from 	CustomerOnBookingOrder
				inner join Customers on Customers.CustomerID = CustomerOnBookingOrder.CustomerID 
			where 	CustomerOnBookingOrder.BookingRefNo = BookingOrders.BookingRefNo
			) as LeadName
		FROM 	BookingOrders 
		where 	BookingOrders.DateCreated >= convert(datetime,@vchSeachString)  
			and BookingOrders.DateCreated <= convert(datetime,@vchSearchString1)

	END

	IF @vchSearchType = '3'	-- BASED ON Lead Name
	BEGIN
		INSERT INTO @BookingDetails
		SELECT 	DISTINCT 
			BookingOrders.BookingRefNo, 
			BookingOrders.BookingSubRefNo,
			BookingOrders.DepartureDate,
			BookingOrders.ReturnDate,
			BookingOrders.UKArrivalDate, 
			BookingOrders.TotalDays AS Duration, 
			BookingOrders.TotalAdults AS Adults, 
			BookingOrders.TotalChildren AS Children, 
			BookingOrders.TotalInfants, 
			BookingOrders.TotalSeniorCitizens, 
			BookingOrders.TotalPaymentDueDate,
			BookingOrders.TotalOnBookingOrder, 
			BookingOrders.BookingStatus Status, 
			BookingOrders.Total, 
			BookingOrders.TotalPaid,
			BookingOrders.Balance,  
			BookingOrders.DepositDueDate,
			BookingOrders.DateCreated,
			' ' AS ResortName, 
			' ' AS BuildingName,
			Customers.Name + ' ' + Surname  AS LeadName
		FROM 	BookingOrders
			inner join CustomerOnBookingOrder on  CustomerOnBookingOrder.BookingRefNo = BookingOrders.BookingRefNo
			inner join Customers on Customers.CustomerID = CustomerOnBookingOrder.CustomerID
		where 	Customers.Surname like @vchSeachString + '%' 

	END

	

	IF  @vchSearchType = '4' OR @vchSearchType = '5'   
	BEGIN
		SET @SQLSTRING =  
			'SELECT DISTINCT 
				BookingOrders.BookingRefNo, 
				BookingOrders.BookingSubRefNo,
				CONVERT(VARCHAR(10),BookingOrders.DepartureDate,3)  AS DepartureDate, 
				CONVERT(VARCHAR(10),BookingOrders.ReturnDate,3) AS ReturnDate, 
				BookingOrders.UKArrivalDate, 
				BookingOrders.TotalDays AS Duration, 
				BookingOrders.TotalAdults AS Adults, 
				BookingOrders.TotalChildren AS Children, 
				BookingOrders.TotalInfants, 
				BookingOrders.TotalSeniorCitizens, 
				Convert(varchar(10),BookingOrders.TotalPaymentDueDate,3) AS TotalPaymentDueDate,
				BookingOrders.TotalOnBookingOrder, 
				BookingOrders.TotalDays AS Duration,
				BookingOrders.BookingStatus Status, 
				CAST(BookingOrders.Total AS VARCHAR(10))  AS Total, 
				CAST(BookingOrders.TotalPaid AS VARCHAR(10))  AS TotalPaid, 
				CAST(BookingOrders.Balance  AS VARCHAR(10))  AS Balance,
				CONVERT(VARCHAR(10), BookingOrders.DepositDueDate,3) AS DepositDueDate, 
				Convert(varchar(10),BookingOrders.DateCreated,3) AS DateCreated, 
				CustomerOnBookingOrder.CustomerOnBookingID, 
				AccItemResvStatus.ResortName, 
				AccItemResvStatus.AccommodationName AS BuildingName,
				(
				select 	top 1 Name + '' '' + Surname 
				from 	CustomerOnBookingOrder
					inner join Customers on Customers.CustomerID = CustomerOnBookingOrder.CustomerID 
				where 	CustomerOnBookingOrder.BookingRefNo = BookingOrders.BookingRefNo
				) as LeadName,
				BookingOrders.Balance,
				BookingOrders.DateCreated as DateCreatedForOrderBy
			FROM 	BookingOrders
				inner join CustomerOnBookingOrder on  CustomerOnBookingOrder.BookingRefNo = BookingOrders.BookingRefNo
				inner join BookingOrderLine on BookingOrderLine.BookingRefNo = BookingOrders.BookingRefNo
				inner join AccItemResvStatus on AccItemResvStatus.AccItemResvStatusID = BookingOrderLine.ItemID '
		IF (@vchSearchType = '4')
			SET @SQLSTRING = @SQLSTRING  + '   
				where AccItemResvStatus.AccommodationName LIKE  ''' + @vchSeachString + '%'''
		IF (@vchSearchType = '5')
			SET @SQLSTRING = @SQLSTRING  + ' 
				where AccItemResvStatus.ResortName LIKE  ''' + @vchSeachString + '%'''

		SET @SQLSTRING = @SQLSTRING  + ' Order by DateCreatedForOrderBy desc'
			
		EXEC SP_EXECUTESQL @SQLSTRING

		RETURN	
	END

	IF  @vchSearchType = '6' 
	BEGIN
		INSERT INTO @BookingDetails
		SELECT 	DISTINCT 
			BookingOrders.BookingRefNo, 
			BookingOrders.BookingSubRefNo,
			BookingOrders.DepartureDate,
			BookingOrders.ReturnDate,
			BookingOrders.UKArrivalDate, 
			BookingOrders.TotalDays AS Duration, 
			BookingOrders.TotalAdults AS Adults, 
			BookingOrders.TotalChildren AS Children, 
			BookingOrders.TotalInfants, 
			BookingOrders.TotalSeniorCitizens, 
			BookingOrders.TotalPaymentDueDate,
			BookingOrders.TotalOnBookingOrder, 
			BookingOrders.BookingStatus Status, 
			BookingOrders.Total, 
			BookingOrders.TotalPaid,
			BookingOrders.Balance,  
			BookingOrders.DepositDueDate,
			BookingOrders.DateCreated,
			' ' AS ResortName, 
			' ' AS BuildingName,
			(
			select 	top 1 Name + ' ' + Surname 
			from 	CustomerOnBookingOrder
				inner join Customers on Customers.CustomerID = CustomerOnBookingOrder.CustomerID 
			where 	CustomerOnBookingOrder.BookingRefNo = BookingOrders.BookingRefNo
			) as LeadName
		FROM 	BookingOrders
			inner join BookingOrderLine on BookingOrderLine.BookingRefNo = BookingOrders.BookingRefNo
			inner join Suppliers on Suppliers.SupplierID = BookingOrderLine.SupplierID
		where 	Suppliers.SupplierName like  +  @vchSeachString + '%'

	END


	IF @vchSearchType = '7'
	BEGIN
		INSERT INTO @BookingDetails
		SELECT 	DISTINCT 
			BookingOrders.BookingRefNo, 
			BookingOrders.BookingSubRefNo,
			BookingOrders.DepartureDate,
			BookingOrders.ReturnDate,
			BookingOrders.UKArrivalDate, 
			BookingOrders.TotalDays AS Duration, 
			BookingOrders.TotalAdults AS Adults, 
			BookingOrders.TotalChildren AS Children, 
			BookingOrders.TotalInfants, 
			BookingOrders.TotalSeniorCitizens, 
			BookingOrders.TotalPaymentDueDate,
			BookingOrders.TotalOnBookingOrder, 
			BookingOrders.BookingStatus Status, 
			BookingOrders.Total, 
			BookingOrders.TotalPaid,
			BookingOrders.Balance,  
			BookingOrders.DepositDueDate,
			BookingOrders.DateCreated,
			' ' AS ResortName, 
			' ' AS BuildingName,
			(
			select 	top 1 Name + ' ' + Surname 
			from 	CustomerOnBookingOrder
				inner join Customers on Customers.CustomerID = CustomerOnBookingOrder.CustomerID 
			where 	CustomerOnBookingOrder.BookingRefNo = BookingOrders.BookingRefNo
			) as LeadName
		FROM 	BookingOrders
		WHERE 	BookingOrders.BookingRefNo = @vchSeachString
			
			
	END


	IF @vchSearchType = '8'			-- BASED ON BOOKING DATE
	BEGIN

		INSERT INTO @BookingDetails
		SELECT 	DISTINCT 
			BookingOrders.BookingRefNo, 
			BookingOrders.BookingSubRefNo,
			BookingOrders.DepartureDate,
			BookingOrders.ReturnDate,
			BookingOrders.UKArrivalDate, 
			BookingOrders.TotalDays AS Duration, 
			BookingOrders.TotalAdults AS Adults, 
			BookingOrders.TotalChildren AS Children, 
			BookingOrders.TotalInfants, 
			BookingOrders.TotalSeniorCitizens, 
			BookingOrders.TotalPaymentDueDate,
			BookingOrders.TotalOnBookingOrder, 
			BookingOrders.BookingStatus Status, 
			BookingOrders.Total, 
			BookingOrders.TotalPaid,
			BookingOrders.Balance,  
			BookingOrders.DepositDueDate,
			BookingOrders.DateCreated,
			' ' AS ResortName, 
			' ' AS BuildingName,
			(
			select 	top 1 Name + ' ' + Surname 
			from 	CustomerOnBookingOrder
				inner join Customers on Customers.CustomerID = CustomerOnBookingOrder.CustomerID 
			where 	CustomerOnBookingOrder.BookingRefNo = BookingOrders.BookingRefNo
			) as LeadName
		FROM 	BookingOrders 
		where 	BookingOrders.BookingSubRefNo like @vchSeachString + '%'

	END


	-- return results

	UPDATE	BookingDetails
	SET	ResortName = AccItemResvStatus.ResortName,
		BuildingName = AccItemResvStatus.AccommodationName
	from 	@BookingDetails BookingDetails
		inner join BookingOrderLine on BookingOrderLine.BookingRefNo = BookingDetails.BookingRefNo
		inner join AccItemResvStatus on AccItemResvStatus.AccItemResvStatusID = BookingOrderLine.ItemID
	where 	BookingOrderLine.TypeOfItem = 'ROOM' 
	
	UPDATE	@BookingDetails
	SET	BuildingName = 'Transfer Only'
	WHERE 	LEN(BuildingName) < 2
	
	
	
	SELECT 	BookingRefNo,		
		ISNULL(BookingSubRefNo,'') AS BookingSubRefNo ,	
		CONVERT(VARCHAR(10), DepartureDate, 103) AS DepartureDate,		
		CONVERT(VARCHAR(10),ReturnDate, 103) AS	ReturnDate,	
		CONVERT(VARCHAR(10),UKArrivalDate, 103) AS	 UKArrivalDate,	
		Duration,		
		Adults,			
		Children,			
		TotalInfants,		
		TotalSeniorCitizens,	
		CONVERT(VARCHAR(10), TotalPaymentDueDate, 103) AS TotalPaymentDueDate,
		TotalOnBookingOrder,	
		Status,			
		Total,			
		TotalPaid,		
		Balance,			
		CONVERT(VARCHAR(10), DepositDueDate, 103) AS DepositDueDate,		
		CONVERT(VARCHAR(10),  DateCreated, 103) AS DateCreated,		
		ResortName,		
		BuildingName,		
		LeadName		
	FROM	@BookingDetails
	Order by 	
		BookingRefNo Desc 


END


