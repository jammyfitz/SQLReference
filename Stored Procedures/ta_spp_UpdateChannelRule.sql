USE [Accommodations]
GO
/****** Object:  StoredProcedure [dbo].[ta_spp_UpdateChannelRule]    Script Date: 11/30/2016 17:02:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/**************************************************************************************************
	Procedure Name		ta_spp_UpdateChannelRule
	Date Created		02/06/09
	Created By		David Tope
	Description		Update a channel rule
					
	Updates:
	Date			Author		Purpose
	04/06/2013		IST		Change pipe delimited list parameters to varchar(max).
**************************************************************************************************/
ALTER proc [dbo].[ta_spp_UpdateChannelRule]
	@ChannelRuleId int = null,
	@ChannelRuleName varchar(100) = null,
	@ChannelRuleDescription varchar(500) = null,
	@ChannelId int = null,
	@ChannelRuleAccessType varchar(50) = null,
	@Active bit  = 1,
	@MarkUp decimal(16, 2) = null,
	@UserId int = null,
	@Mode char(1) = 'I', --I,D
	@BBImpTypeId varchar(max)  = null, -- pipe Delimited List
	@ChainCode nvarchar(max)  = null, -- pipe Delimited List
	@BBSupplierId varchar(max) = null, -- pipe Delimited List
	@SupplierId varchar(max)  = null, -- pipe Delimited List
	@BBHotelId varchar(max)   = null, -- pipe Delimited List
	@AccommodationBuildingId varchar(max) = null, -- pipe Delimited List
	@PlaceCode varchar(max)  = null, -- pipe Delimited List
	@SystemUserCompanyId int = null
as
set nocount on
begin

	declare @PIPE char(1)
	declare @Error int
	set @PIPE = '|'
	set @Error = 0

	-- Update Channel Rule

	if @Mode = 'I'
	begin
		-- Validation
		if @ChannelId is null or not exists (select ChannelId from Channel where ChannelId = @ChannelId)
		begin
			raiserror('Invalid Channel Id',16,10)			
			return
		end
		if isnull(@ChannelRuleName,'') = ''
		begin
			raiserror('Invalid Channel Rule Name',16,10)			
			return
		end
		if @ChannelRuleAccessType not in ('ALLOW','DENY')
		begin
			raiserror('Invalid Channel Rule Access Type',16,10)
			return 
		end
		set @ChannelRuleAccessType = upper(@ChannelRuleAccessType)


		Begin transaction UPDATECHANNELRULE

		If @ChannelRuleID is null
		begin
			insert into ChannelRule
				(
				ChannelRuleName,	
				ChannelRuleDescription,	
				ChannelId,	
				ChannelRuleAccessType,	
				Active,	
				MarkUp,	
				CreatedBy,
				SystemUserCompanyId
				)
			select 
				@ChannelRuleName,	
				@ChannelRuleDescription,	
				@ChannelId,	
				@ChannelRuleAccessType,	
				@Active,	
				@MarkUp,	
				@UserId,
				@SystemUserCompanyId

			select  @ChannelRuleId = Scope_Identity(), @Error = @Error  + @@error
		end
		else
		begin
			Update	ChannelRule
			set	ChannelRuleName = @ChannelRuleName,	
				ChannelRuleDescription = @ChannelRuleDescription,	
				ChannelId = @ChannelId,	
				ChannelRuleAccessType = @ChannelRuleAccessType,	
				Active = @Active,	
				MarkUp = @MarkUp,	
				LastUpdatedBy = @UserId,
				LastUpdatedDate = getdate(),
				SystemUserCompanyId = @SystemUserCompanyId
			where	ChannelRuleId = @ChannelRuleId

			set @Error = @Error  + @@error
		end

		
		-- Clear out old rules ready for full reinput:
		delete from ChannelRule_BedBankImplementationType where ChannelRuleId = @ChannelRuleId
		set @Error = @Error  + @@error
		delete from ChannelRule_ChainCode where ChannelRuleId = @ChannelRuleId
		set @Error = @Error  + @@error
		delete from ChannelRule_BedBankSupplier where ChannelRuleId = @ChannelRuleId
		set @Error = @Error  + @@error
		delete from ChannelRule_Suppliers where ChannelRuleId = @ChannelRuleId
		set @Error = @Error  + @@error
		delete from ChannelRule_AccommodationBuildings where ChannelRuleId = @ChannelRuleId
		set @Error = @Error  + @@error
		delete from ChannelRule_BedBankHotel where ChannelRuleId = @ChannelRuleId
		set @Error = @Error  + @@error
		delete from ChannelRule_Place where ChannelRuleId = @ChannelRuleId
		set @Error = @Error  + @@error

		-- reinsert
		insert into ChannelRule_BedBankImplementationType (ChannelRuleId, BBImpTypeId)
		select @ChannelRuleId, [Value] from dbo.funConvertListToTable(@BBImpTypeId,@PIPE) where [Value] in (select BBImpTypeId from BedBankImplementationType)
		set @Error = @Error  + @@error
		insert into ChannelRule_ChainCode (ChannelRuleId, ChainCode)
		select @ChannelRuleId, [Value] from dbo.funConvertListToTable(@ChainCode,@PIPE) where [Value] in (select ChainCode collate database_default from BedBankChainCode)
		set @Error = @Error  + @@error
		insert into ChannelRule_BedBankSupplier (ChannelRuleId, BBSupplierId)
		select @ChannelRuleId, [Value] from dbo.funConvertListToTable(@BBSupplierId,@PIPE) where [Value] in (select BBSupplierId from BedBankSupplier)
		set @Error = @Error  + @@error
		insert into ChannelRule_Suppliers (ChannelRuleId, SupplierId)
		select @ChannelRuleId, [Value] from dbo.funConvertListToTable(@SupplierId,@PIPE) where [Value] in (select SupplierId from Suppliers)
		set @Error = @Error  + @@error
		insert into ChannelRule_AccommodationBuildings (ChannelRuleId, AccommodationBuildingId)
		select @ChannelRuleId, [Value] from dbo.funConvertListToTable(@AccommodationBuildingId,@PIPE) where [Value] in (select AccommodationBuildingId from AccommodationBuildings)
		set @Error = @Error  + @@error
		insert into ChannelRule_BedBankHotel (ChannelRuleId, BBHotelId)
		select @ChannelRuleId, [Value] from dbo.funConvertListToTable(@BBHotelId,@PIPE) where [Value] in (select BBHotelId from BedBankHotel)
		set @Error = @Error  + @@error
		insert into ChannelRule_Place (ChannelRuleId, PlaceCode)
		select @ChannelRuleId, [Value] from dbo.funConvertListToTable(@PlaceCode,@PIPE) where [Value] in (select PlaceCode collate database_default from Place)
		set @Error = @Error  + @@error

		-- Validation - if rule has no criteria, force inactive:
		if not exists(select [Value] from dbo.funConvertListToTable(@BBImpTypeId,@PIPE) where [Value] in (select BBImpTypeId from BedBankImplementationType))
			and not exists(select [Value] from dbo.funConvertListToTable(@ChainCode,@PIPE) where [Value] in (select ChainCode collate database_default from BedBankChainCode))
			and not exists(select [Value] from dbo.funConvertListToTable(@BBSupplierId,@PIPE) where [Value] in (select BBSupplierId from BedBankSupplier))
			and not exists(select [Value] from dbo.funConvertListToTable(@SupplierId,@PIPE) where [Value] in (select SupplierId from Suppliers))
			and not exists(select [Value] from dbo.funConvertListToTable(@AccommodationBuildingId,@PIPE) where [Value] in (select AccommodationBuildingId from AccommodationBuildings))
			and not exists(select [Value] from dbo.funConvertListToTable(@BBHotelId,@PIPE) where [Value] in (select BBHotelId from BedBankHotel))
			and not exists(select [Value] from dbo.funConvertListToTable(@PlaceCode,@PIPE) where [Value] in (select PlaceCode collate database_default from Place))
		begin
			Update	ChannelRule
			set	Active = 0	
			where	ChannelRuleId = @ChannelRuleId		
		end

		
		

		if @Error = 0
		begin
			COMMIT TRANSACTION UPDATECHANNELRULE
			RETURN
		end
		else
		begin
			ROLLBACK TRANSACTION UPDATECHANNELRULE
			raiserror ('Error saving Rule',16,10)
			RETURN
		end

	end
	
	if @Mode = 'D'	
	begin
		
		Update	ChannelRule 
		set	LastUpdatedBy = @UserId, 
			LastUpdatedDate = getdate()
		where	ChannelRuleId = @ChannelRuleId

		-- Delete all ties to the Rule, before deleting the rule it'self
		delete from ChannelRule_BedBankImplementationType where ChannelRuleId = @ChannelRuleId
		delete from ChannelRule_ChainCode where ChannelRuleId = @ChannelRuleId
		delete from ChannelRule_BedBankSupplier where ChannelRuleId = @ChannelRuleId
		delete from ChannelRule_Suppliers where ChannelRuleId = @ChannelRuleId
		delete from ChannelRule_AccommodationBuildings where ChannelRuleId = @ChannelRuleId
		delete from ChannelRule_BedBankHotel where ChannelRuleId = @ChannelRuleId
		delete from ChannelRule_Place where ChannelRuleId = @ChannelRuleId

		delete from ChannelRule where ChannelRuleId = @ChannelRuleId
	end



end












