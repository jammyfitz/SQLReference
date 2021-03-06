
	-- declarations
	declare @SystemUserCompanyID int
	declare @UserId int
	declare @CompanyName varchar(100),@IsSupplier bit,@SupplierID int,@ActiveUntil datetime,@Company_EMailAddress varchar(250),@VATNumber varchar(100),@CreatedbyUser int,@HeadOfficeId int,@CreditCardPayment bit, @SellCurrencyCode varchar(50)
	declare @PersonNameAndSurname varchar(200), @UserName varchar(200), @UserPassword varchar(200), @User_EMailAddress varchar(250)

	-- SET VARIABLES:
	-- System User - Company
	set @CompanyName = 'Osprey Holidays XML Test (Med)'
	set @IsSupplier = 0
	set @SupplierID = null
	set @ActiveUntil = '01 jan 2015'
	set @SellCurrencyCode = 'GBP'
	set @Company_EMailAddress = 'Michael@osprey-holidays.co.uk'
	set @VATNumber = null
	set @CreatedbyUser = 8
	set @HeadOfficeId = 9
	set @CreditCardPayment = 0
	-- System User Accounts - userid
	set @PersonNameAndSurname = 'Michael Bennett MD'
	set @UserName = 'powerbeds'
	set @UserPassword = 'bedspower'
	set @User_EMailAddress = 'Michael@osprey-holidays.co.uk'


	-- Error Checks
	if exists (select * from SystemUsers where CompanyName = @CompanyName)
		or @CompanyName = ''
	begin
		raiserror('Company Name exists already or is blank',16,10)
		Return
	end
	if exists (select * from SystemUserAccounts where PersonNameAndSurname= @PersonNameAndSurname)
		or @PersonNameAndSurname = ''
	begin
		raiserror('PersonNameandSurname exists already or is blank',16,10)
		Return
	end
	if exists (select * from SystemUserAccounts where UserName= @UserName)
		or @UserName = ''
	begin
		raiserror('UserName exists already or is blank',16,10)
		Return
	end


	-- Company Insert
	insert into SystemUsers([CompanyName], [IsSupplier], [SupplierID], [IsActive], [ActiveUntilDate], [EMailAddress], [ABTANumber], [TTANumber], [AllowLastMinute], [LastMinuteCreditLimit], [SellCurrencyCode], [CreatedByUserID], [LastModifiedDate], [ModifiedByUserId], [SystemUsersHeadOfficeID], [WorldChoiceNumber], [MidConsortNumber], [CommissionApplicable], [CommissionLevel], [CommissionChargeLevel], [HeadOfficeChangedOn], [VATNumber], [AgreementAccepted], [AcceptanceDate], [AcceptedBy], [HardCopySent], [HardCopySentDate], [HardCopySentBy], [HardCopyReceived], [HardCopyReceivedDate], [HardCopyReceivedBy], [AllowSearchForOtherUsers], [AllowVoucherPrint], [PercentageMarginDiscount], [FlatMarginDiscount], [DirectDebitApplicable], [DateCreated], CreditCardPayment )
	select @CompanyName,@IsSupplier,@SupplierID,1,@ActiveUntil,@Company_EMailAddress,null,null,1,1000,@SellCurrencyCode,@CreatedbyUser,getdate(),@CreatedbyUser,@HeadOfficeId,null,null,0,0,0,null,@VATNumber,'Y',getdate(),@CreatedbyUser,'N',null,null,'N',null,null,'Y','Y',0,0,0,getdate(), @CreditCardPayment
	set @SystemUserCompanyID = scope_identity()

	-- user Insert	
	insert into SystemUserAccounts ([PersonNameAndSurname], [UserName], [UserPassword], [EMailAddress], [AccessLevel], [IsActive], [LastLoginDate], [SystemUserCompanyID], [ConnectionString], [CreatedByUserID], [LastModifiedDate], [ModifiedByUserID], [AccessType], [LastPasswordChanged], [DisplayType], [DateCreated] )
	select @PersonNameAndSurname,@UserName,@UserPassword,@User_EMailAddress,1,1,null,@SystemUserCompanyID,null,8,getdate(),8,0,null,1,getdate()
	set @UserId = scope_identity()

	select * from SystemUsers where SystemUserCompanyID = @SystemUserCompanyID
	select * from SystemUserAccounts where UserId = @UserId
-- end

