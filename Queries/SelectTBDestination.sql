USE [Accommodations]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[ta_spp_SelectTBDestination]
		@TBSupplierName = N'HolidayTaxis',
		@TBSupplierID = null,
		@TBSupplierToID = 7924,
		@TBToType = null,
		@TBSupplierFromID = null,
		@TBFromType = null,
		@IsActive = null
SELECT	'Return Value' = @return_value

GO
