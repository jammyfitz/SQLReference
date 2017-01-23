USE [Accommodations]
GO
/****** Object:  StoredProcedure [dbo].[ta_spp_InsertIPConfigBulkLoad]    Script Date: 11/30/2016 17:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/**************************************************************************************************
	Procedure Name		ta_spp_InsertIPConfigBulkLoad
	Date Created		15/06/10
	Created By		David Tope
	Description		Bulkload SP for manual inserting into config table
						
	Updates:
	Date			Author		Purpose
**************************************************************************************************/
ALTER proc [dbo].[ta_spp_InsertIPConfigBulkLoad]
	@UserNames varchar(max) = null,   
	@UserNameDelimiter varchar(10) = null,   -- null = comma
	@IPStart varchar(20) = null, 
	@IPEnd varchar(20)  = null,
	@RequestedBy varchar(200) = null,
	@CreatedBy varchar(200) = null,
	@UpdatedBy varchar(200) = null,
	@Comments varchar(1000) = null,
	@WebServiceID int = 2 -- Default to OTA

as
set nocount on
begin

	declare @C int
	declare @CompanyIds table (Ident int identity, Username varchar(500),SystemUserCompanyId int)
	declare @MessageReturn table (Ident int identity, UserName varchar(500), SystemUserCompanyId int, IPConfigId int, Msg varchar(500))
	declare @SystemUserCompanyId int
	declare @Username varchar(500)
	declare @ErrorMessage varchar(500)
	declare @IPConfigId int


	if nullif(@UserNameDelimiter,'') is null
		set @UserNameDelimiter = ','
	
	
	insert into @CompanyIds (Username, SystemUserCompanyId)
	select	SystemUserAccounts.UserName,
		SystemUsers.SystemUserCompanyId 
	from 
		(
		select	Value 
		from	dbo.funConvertListToTable (@UserNames, @UserNameDelimiter)
		) A 
		left outer join SystemUserAccounts on SystemUserAccounts.UserName = A.Value
		left outer join SystemUsers on SystemUsers.SystemUserCompanyId = SystemUserAccounts.SystemUserCompanyId

		


	set @C = 1
	while @C <= (select max(Ident) from @CompanyIds)
	begin
		select	@SystemUserCompanyId = SystemUserCompanyId,
			@Username = Username
		from	@CompanyIds 
		where	Ident = @C

		if @SystemUserCompanyId is null
		begin
			set @ErrorMessage = 'Unable to Find Username'
			insert into @MessageReturn(UserName, SystemUserCompanyId, Msg)
			select @Username, @SystemUserCompanyId, @ErrorMessage
			GOTO NEXTRECORD
		end
		if @WebServiceID is null or not exists (select * from WebServiceConfig where WebServiceID = @WebServiceID)
		begin
			set @ErrorMessage = 'Invalid @WebServiceID'
			insert into @MessageReturn(UserName, SystemUserCompanyId, Msg)
			select @Username, @SystemUserCompanyId, @ErrorMessage
			GOTO NEXTRECORD
		end
		if @IPStart is null or @IPStart = ''
		begin
			set @ErrorMessage = 'Invalid @IPStart'
			insert into @MessageReturn(UserName, SystemUserCompanyId, Msg)
			select @Username, @SystemUserCompanyId, @ErrorMessage
			GOTO NEXTRECORD
		end

		begin try
			set @IPConfigId = null

			exec ta_spp_InsertIPConfig
				@SystemUserCompanyId = @SystemUserCompanyId,  
				@IPStart  = @IPStart, 
				@IPEnd  = @IPEnd,
				@RequestedBy  = @RequestedBy,
				@CreatedByUserId  = null,
				@CreatedBy  = @CreatedBy,
				@UpdatedByUserId = null,
				@UpdatedBy = @UpdatedBy,
				@Comments  = @Comments,
				@IPConfigId = @IPConfigId OUTPUT

			exec ta_spp_InsertIPConfigWebService
				@IPConfigId  = @IPConfigId,
				@WebServiceId = @WebServiceId

			insert into @MessageReturn(UserName, SystemUserCompanyId, IPConfigId, Msg)
			select @Username, @SystemUserCompanyId, @IPConfigId, 'SUCCESS'

		end try
		begin catch
			set @ErrorMessage = ERROR_MESSAGE() 
			insert into @MessageReturn(UserName, SystemUserCompanyId, Msg)
			select @Username, @SystemUserCompanyId, @ErrorMessage
		end catch

		NEXTRECORD:

		set @C = @C + 1
	end

	select * from @MessageReturn order by Ident
	
end

