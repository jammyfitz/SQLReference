USE [Accommodations]
GO
/****** Object:  StoredProcedure [dbo].[ta_spp_SelectBedBankHotel]    Script Date: 11/30/2016 17:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**************************************************************************************************
	Procedure Name		ta_spp_SelectBedBankHotel
	Date Created		23/04/08
	Created By		Quintin Oliver
	Description		Select a Bed Bank Hotel
						
	Updates:
	Date			Author		Purpose
	07/05/08		Q		Added new field to table 'RatingDesc' proc changes to reflect.
	23/05/08		J		Added BBHotelId parameter so a hotel can be found by id, made all parameters optional.
	08/08/08		DT		Change @Language to @LanguageCode
	04/12/08		JH		Edit @PropertyID length from 10 ->16
	06/10/2011		IST		Add Hidden and LastLoadedDate.
	17/06/2013		IST		Increase @PropertyID to 20 chars.
**************************************************************************************************/
ALTER PROCEDURE [dbo].[ta_spp_SelectBedBankHotel]
	@BBHotelId int = null,
	@ChainCode nvarchar(6) = NULL,
	@PropertyId nvarchar(20) = NULL,
	@LanguageCode varchar(10) = null
AS
set nocount on
BEGIN


	declare @LANGDEFAULT varchar(10)
	set @LANGDEFAULT = 'EN'

	if isnull(@LanguageCode,'') = ''
		set @LanguageCode = @LANGDEFAULT

	SELECT 	BBH.BBHotelId, 
		BBH.ChainCode, 
		BBH.PropertyId, 
		BBH.Status, 
		BBH.Type, 
		BBH.[Name], 
		case when @LanguageCode = @LANGDEFAULT then BBH.Description else BBHTrans.Description end as [Description], 
		BBH.Address1, 
		BBH.Address2, 
		BBH.Address3, 
		BBH.Address4, 
		BBH.City, 
		BBH.State, 
		BBH.PostalCode, 
		BBH.Country, 
		BBH.Phone, 
		BBH.Fax, 
		BBH.Email, 
		BBH.Rating,
		BBH.RatingDesc, 
		BBH.CheckIn, 
		BBH.CheckOut, 
		BBH.CancellationPolicy, 
		BBH.TimeZone, 
		BBH.NativeCurrency, 
		BBH.Longitude, 
		BBH.Latitude, 
		BBH.Exportable, 
		BBH.IsVPayment, 
		BBH.Active,
		@LanguageCode as [LanguageCode],
		BBH.Priority,
		(select top 1 CardPool from CardPool where CardPoolId = BBH.CardPoolId) as CardPool,
		BBH.TotalRooms,
		BBH.Hidden,
		BBH.LastLoadedDate
	FROM 	BedBankHotel as BBH
		left outer join TranslatedBedBankHotel BBHTrans on BBHTrans.BBHotelId = BBH.BBHotelId
				and BBHTrans.LanguageCode = @LanguageCode
	WHERE 	(@BBHotelId is null OR BBH.BBHotelId = @BBHotelId)
		AND (@ChainCode IS NULL OR BBH.ChainCode = @ChainCode)
		AND (@PropertyId IS NULL OR BBH.PropertyId = @PropertyId)
END
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON

