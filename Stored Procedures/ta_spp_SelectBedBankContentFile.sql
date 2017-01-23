USE [Accommodations]
GO
/****** Object:  StoredProcedure [dbo].[ta_spp_SelectBedBankContentFile]    Script Date: 11/30/2016 16:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/**************************************************************************************************
	Procedure Name		ta_spp_SelectBedBankContentFile
	Date Created		11/11/11
	Created By		David Tope
	Description		Get the contents of 	BedBankContentFile		
	Updates:
	Date			Author		Purpose
**************************************************************************************************/
ALTER proc [dbo].[ta_spp_SelectBedBankContentFile]
	@FileId int = null,
	@FileName varchar(200) = null,
	@StatusId int = null
as
set nocount on
begin
	select 	FileID,
		[FileName],
		StatusId,
		convert(varchar,DateCreated,113) as DateCreated ,
		convert(varchar,LastModifiedDate ,113) as LastModifiedDate,
		BBImpTypeId 
	from	BedBankContentFile
	where	(@FileId is null or FileId = @FileId)
		and (@FileName is null or [FileName] = @FileName)
		and (@StatusId is null or StatusId = @StatusId)
	order by 
		convert(datetime,DateCreated,113)
end
