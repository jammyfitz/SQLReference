-- Normal booking tables
declare @BookingRefNo int
set @BookingRefNo = 4001316
select * from bookingorders where BookingRefNo=@BookingRefNo
select * from BookingOrderLine where BookingRefNo=@BookingRefNo 
select * from AccItemResvStatus
inner join BookingOrderLine on BookingOrderLine.ItemID = AccItemResvStatus.AccItemResvStatusID
where BookingRefNo=@BookingRefNo

-- Transfer booking tables
select * from TransferOrder
where TransferOrderID = 915017 --AccItemResvStatus.ItemID

select * from TransferOrderDetails
where TransferOrderID = 915017

select * from TransferVehicles
select * from VehicalOnTransferOrderDetails
-- Check Live
select Top 100 * from bookingorders order by BookingRefNo desc