-- Extranet SP to obtain VPayment information
USE [Accommodations]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[ex_spp_ReportVPayment]
		@FromDate = N'10/05/14',
		@ToDate = N'13/05/14'

SELECT	'Return Value' = @return_value

GO

-- VPayment information table
SELECT TOP 10 * FROM VPaymentLog
SELECT * FROM VPaymentLog WHERE BookingRefNo='5234101'

SELECT * FROM BookingOrderLine WHERE BookingRefNo = 1069660
SELECT * FROM SystemUsers WHERE SupplierID = 9415
SELECT * FROM SystemUserAccounts WHERE SystemUserCompanyID = 22489
