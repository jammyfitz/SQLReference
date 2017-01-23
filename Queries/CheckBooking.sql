USE Accommodations
--Check Transfer Bookings
SELECT * FROM BookingOrders where BookingRefNo=100000095                             
SELECT * FROM BookingOrderLine where BookingRefNo=100000095                         
SELECT * FROM AccItemResvStatus
inner join BookingOrderLine on BookingOrderLine.ItemID = AccItemResvStatus.AccItemResvStatusID
where BookingRefNo=100000095

select * from Brand
-- TransferOrder.TransferOrderID = AccItemResvStatus.ItemID
SELECT * FROM TransferOrder WHERE TransferOrderID='4689104 '
SELECT * FROM TransferOrderDetails WHERE TransferOrderID='1025642'
SELECT * FROM Vehicalontransferorderdetails WHERE TransferOrderID='1025642'
SELECT * FROM transferv
SELECT * FROM BookingOrders where TotalAdults=0 and TotalChildren=0 and TotalInfants=0 order by DateCreated desc 
SELECT * FROM LocationType

-- SP call to find bookings for a user
USE [Accommodations]
GO 
DECLARE @return_value int EXEC @return_value = [dbo].[ta_spp_SearchBookingOrderWSRead]
@UserId = 5,
@BookingDateFrom = '12/06/2016 00:00:00',
@BookingDateTo = '14/06/2016 00:00:00'
--@BookingRefNo = N'4005381'
SELECT 'Return Value' = @return_value
GO

SELECT * FROM AccItemResvStatus
inner join BookingOrderLine on BookingOrderLine.ItemID = AccItemResvStatus.AccItemResvStatusID
inner join CustomerOnBookingOrder on CustomerOnBookingOrder.BookingRefNo = BookingOrderLine.BookingRefNo
inner join Customers on CustomerOnBookingOrder.CustomerID = Customers.CustomerID
--where BookingOrderLine.UserID='288662' and Confirmed='1'
where BookingOrderLine.BookingRefNo='6231936'
--where Surname='Testy'

USE Accommodations
select * from bookingorders where BookingRefNo=9050719 
--select * from changes..bookingordershistory where bookingrefno='3983585'
select * from AccItemResvStatus
inner join BookingOrderLine on BookingOrderLine.ItemID = AccItemResvStatus.AccItemResvStatusID
where BookingRefNo='4519881' 


-- BookingSubRefNo is Agent Booking Ref
select * from bookingorders where BookingRefNo=4000749  or BookingRefNo=9005334
select * from bookingorders where BookingSubRefNo like '%2479246S%'
select * from bookingorders where UserID=5 order by DateCreated desc
select * from BookingOrders order by DateCreated desc
select * from BookingSource
-- SuppliersRefNo is Third Party Ref
select * from BookingOrderLine where BookingRefNo='4000784' 

select * from BookingOrderLine where SuppliersRefNo='glaQ61df4m15Resi' 
select * from AccItemResvStatus
inner join BookingOrderLine on BookingOrderLine.ItemID = AccItemResvStatus.AccItemResvStatusID
--where BookingRefNo='3194934' 
where AccommodationID='2699'
select * from AccItemResvStatus inner join BookingOrderLine on BookingOrderLine.ItemID = AccItemResvStatus.AccItemResvStatusID where BookingRefNo in
('1199713','1203289','1199714','1214282','1216440','1207290','1214300','1214485')
select * from AccItemResvStatus inner join BookingOrderLine on BookingOrderLine.ItemID = AccItemResvStatus.AccItemResvStatusID 
where RoomTypeID='5866'



select * from contracts where contractid='45716'

-- Check Booking Supplier
select * from suppliers where SupplierId='10018'

-- Check Third Party Board Basis (EntityType BB)
select * from BookingInfo where BookingRefNo=3134511 and EntityType='BB'
select * from BookingInfo where EntityType='BB'

-- Check Customer Info (Pegasus Booking Failure Update)
select * from customeronbookingorder where BookingRefNo='5161340'
select * from customers where CustomerID='4925379'
select * from customers where Title='Mr christopher woodward'
--update customers set Name='Tom', Surname='Jones' where CustomerID='3296635'

-- Check Third Party Bookings
USE Changes
select top 100 * from XMLBookingLog order by datecreated desc


select * from systemuseraccounts where userName like '%medtest%'
select * from systemuseraccounts where userid=66430
select top 100 * from BedBankRoomType where BBRoomTypeId='42563'

select * from RoomTypes where RoomTypeID='184'
1982099

select * from bedbanksupplier where bbsupplierid='18'
select * from bbimptype

select * from bedbankroomtype where BBRoomTypeId='42563'
select * from bedbankroomtype where BBRoomTypeId='585867'
select * from bedbankhotelroom where RoomTypeId='42563'
select * from bedbankratecode where RoomTypeId='42563'
select * from boardbasis
select * from bookingsource
select * from GDSSuppliers where GDSID=115