USE [Accommodations]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[ta_spp_SearchHotelCriteria]
		@SystemUserCompanyId = 1444,
		@HotelIds = N'MIT,73777',
		@Implementations = N'MarkInternational'

SELECT	'Return Value' = @return_value

GO
