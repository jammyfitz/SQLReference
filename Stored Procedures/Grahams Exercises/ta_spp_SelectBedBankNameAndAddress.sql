USE [Accommodations]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER proc [dbo].[ta_spp_SelectBedBankNameAndAddress]
	@BBHotelIDs int = null,
	@ChainCode nvarchar(6) = null
as
set nocount on

declare @BBHotelIDs_temp table (Ident int identity, BBHotelID int)

insert into @BBHotelIDs_temp
select * 
from  dbo.splitstring(@BBHotelIDs) 

begin
	
	  if (@BBHotelIDs is null and @ChainCode is null)
		begin
			raiserror('Must supply either BBHotelIDs or ChainCode', 16, 10)			
			return
		end
	
	select 	Name,
		Address1,
		Address2,
		Address3,
		Address4
	from	dbo.BedBankHotel with (NOLOCK)
	where @BBHotelIDs in (SELECT BBHotelID FROM @BBHotelIDs_temp)
		and (@ChainCode is null or [ChainCode] = @ChainCode)
end
