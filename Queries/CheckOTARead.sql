USE [Accommodations]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[ta_spp_SearchBookingOrderWSRead]
		@UserId = 308587,
		@BookingRefNo = N'4001568'

SELECT	'Return Value' = @return_value

GO

-- Multi-Hotel Search
exec ta_spp_SearchBookingOrderWSRead
      @UserId = 289454,
      @Hotels = null, --'H4U|14039,H4U|14510,H4U|14510,H4U|14522,H4U|14039,H4U|14516,H4U|20060,H4U|14522,H4U|14510,H4U|14516,H4U|14510,H4U|14039',
      @BookingRefNo = null, --'4918157,4446511,4351626,4075202,4961409', 
      @DepartureDateFrom = null, --'2014-02-05',
      @DepartureDateTo = null, --'2014-02-07',
      @BookingDateFrom = '2014-01-07 00:00',
      @BookingDateTo = '2014-02-07 00:00',
      @ResStatusFilter = 1
