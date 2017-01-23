USE [Accommodations]
GO
/****** Object:  StoredProcedure [dbo].[ta_spp_InsertBedBankAmenity]    Script Date: 12/05/2016 10:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**************************************************************************************************
	Procedure Name		ta_spp_InsertBedBankAmenity
	Date Created		17/04/08
	Created By		David Tope
	Description		insert / update a bed bank Amenity
						
	Updates:
	Date			Author		Purpose
	08/08/08		DT		Add language support
	14/08/08		DT		Add BBImpTypeId to table
**************************************************************************************************/
ALTER proc [dbo].[ta_spp_InsertBedBankAmenity]
	@LanguageCode varchar(10),
	@Code nvarchar(6) = null,
	@Description nvarchar(200) = null,
	@BBImpTypeId int = null,
	@IntAmenityId int = null
as
set nocount on
begin

	declare @TransId int
	declare @BBAmenityId int

	if isnull(@Code,'') = ''
	begin
		raiserror('The Amenity Code is invalid',16,1)
		return
	end

	set @BBAmenityId = 
		(
		select	BBAmenityId 
		from	BedBankAmenity
		where	Code = @Code
			and isnull(BBImpTypeId,-1) = isnull(@BBImpTypeId,-1)
		)

	If @LanguageCode = 'EN'
	begin
		if @BBAmenityId is null
		begin
			insert into BedBankAmenity (Code, Description, BBImpTypeId, IntAmenityId)
			select @Code, @Description, @BBImpTypeId, @IntAmenityId
		end
		else
		begin
			update 	BedBankAmenity
			set 	Description = @Description,
				IntAmenityId = case when @IntAmenityId is null then IntAmenityId else @IntAmenityId end
			where 	Code = @Code
				and isnull(BBImpTypeId,-1) = isnull(@BBImpTypeId,-1)
		end
	end
	else
	begin
		if @BBAmenityId is null
		begin
			raiserror('Amenity Code not found in Master BB Amenities Table',16,10)
			return	
		end
		set @TransId = 
			(
			select	TransId 
			from	TranslatedBedBankAmenity
			where	BBAmenityId = @BBAmenityId
				and LanguageCode = @LanguageCode
			)
		if @TransId is null
		begin
			insert into TranslatedBedBankAmenity (BBAmenityId, LanguageCode, Description)
			values(@BBAmenityId, @LanguageCode, @Description)
		end
		else
		begin
			update	TranslatedBedBankAmenity
			set	Description = @Description
			where	TransId = @TransId
		end
	end
end
