USE [Accommodations]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[ta_spp_UpdateTBDestination]
		@TBSupplierName = N'HolidayTaxis',
		@TBSupplierFromID = null,
		@TBFromName = null,
		@TBFromType = null,
		@TBSupplierToID = 7426,
		@TBToName = N'Abu Dhabi > Abu Dhabi Airport > Abu Dhabi Port',
		@TBToType = 2,
		@IsActive = false,
		@ParentDestinationId = null,
		@LastLoadedDate = '14/02/2013 10:48:24'


SELECT	'Return Value' = @return_value

GO
