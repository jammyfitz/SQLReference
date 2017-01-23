-- Check H4U Board Basis
select * from boardbasis

-- Check Third Party Board Basis
USE Accommodations
declare @BookingRefNo int
set @BookingRefNo = 2813059
select Cancelled,* from BookingOrders where BookingRefno = @BookingRefNo
select * from BookingOrderLine where BookingRefno = @BookingRefNo
select Cancelled,* from AccItemResvStatus where AccItemResvStatusId in 
      (select ItemId from BookingOrderLine where BookingRefno = @BookingRefNo)      

select * from BookingInfo where bookingrefno = @BookingRefNo and EntityType = 'BB'
select * from BookingInfo where EntityType = 'BB'