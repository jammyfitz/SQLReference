USE Changes

-- Check Third Party Board Basis
USE Accommodations
declare @BookingRefNo int
set @BookingRefNo = 3030946 
select Cancelled,* from BookingOrders where BookingRefno = @BookingRefNo
select * from BookingOrderLine where BookingRefno = @BookingRefNo
select Cancelled,* from AccItemResvStatus where AccItemResvStatusId in 
      (select ItemId from BookingOrderLine where BookingRefno = @BookingRefNo)      

select * from BookingInfo where bookingrefno = @BookingRefNo and EntityType = 'BB'
select * from BookingInfo where EntityType = 'BB'

-- Legacy way of getting third party XML
USE [Changes]
SELECT top 100 * FROM XMLBookingLog where BookingRefNo='3528642'
 order by DateCreated desc

-- Danials re-work on storing the data, Connect to Transaction Logs Server
SELECT * FROM LogServ..TransactionsLog WHERE Reference='11925'

-- Check XML by chain code
SELECT Top 500 * FROM LogServ..TransactionsLog
WHERE
--Reference='6289339'
Message like '%VPayment%'
--Building like 'EXP_%'
--AND ActionType = 'Cancel'
--AND [Message] = 'Initiate Cancel Module'
ORDER BY DateTime desc


select * from job..TransactionsLog where referenceType='SellReference'
select * from job..TransactionsLog where ServerName='DJHWNG5J' order by DateTime desc