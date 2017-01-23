use Accommodations
go

-- ==============================================================================
--	Main params - change these
-- ==============================================================================

declare @Price money = 536.12, 
	@PriceCurrency varchar(3) = 'EUR',
	@Margin float = 0,
	@UserName varchar(50) = 'userone'
	
	
-- ==============================================================================
--	Price calc
-- ==============================================================================	

declare @BuyingPrice money, --select BuyingPrice from AccommodationBuildingPriceRange
	@ContractExchangeRate float, -- select ER.ExchangeRate from Contracts C inner join ExchangeRates ER on ER.CurrencyCode = C.BuyCurrency
	@MarginLevel float, -- select FirstAdultMarginLevel, ThirdPersonMarginLevel from AccommodationBuildingPriceRange
	@MarginUnit varchar(10), -- select FirstAdultMarginUnit, ThirdPersonMarginUnit from AccommodationBuildingPriceRange
	@ChannelMarkup decimal(16,2), -- select	C.MarkUp from Channel C join Channel_SystemUsers CSU on CSU.ChannelId = C.ChannelId where C.Active = 1
	@ChannelRuleMarkup decimal(16,2), -- select MarkUp, ChannelId from ChannelRule
	@MarginDiscount decimal(18,2), -- select PercentageMarginDiscount, FlatMarginDiscount as FlatMarginDiscount_ThisIsNotUsed  from SystemUsers
	@AgentCommissionApplicable bit, -- select CommissionApplicable, CommissionChargeLevel from SystemUsers	
	@AgentCommission float, -- select CommissionApplicable, CommissionChargeLevel from SystemUsers	
	@UserExchangeRate float
	
select	@BuyingPrice = @Price, -- Price
	@ContractExchangeRate = (select ExchangeRate from ExchangeRates where CurrencyCode = @PriceCurrency), -- Price currency
	@MarginLevel = isnull(nullif(@Margin, 0),6), -- default to 6%
	@MarginUnit = 'Percentage',
	@ChannelMarkup = c.MarkUp,
	@ChannelRuleMarkup = cr.MarkUp,
	@MarginDiscount = su.PercentageMarginDiscount,
	@AgentCommissionApplicable = su.CommissionApplicable,
	@AgentCommission = su.CommissionChargeLevel,
	@UserExchangeRate = er.ExchangeRate
from	SystemUserAccounts sua
	inner join SystemUsers su on su.SystemUserCompanyID = sua.SystemUserCompanyID
	left join Channel_SystemUsers csu on csu.SystemUserCompanyId = su.SystemUserCompanyID
	left join Channel c on c.ChannelId = csu.ChannelId
	left join ChannelRule cr on cr.ChannelID = c.ChannelId
	left join ExchangeRates er on ER.CurrencyCode = su.SellCurrencyCode 
where	sua.UserName = @UserName
	
	
;with Base as 
		(
		select	case	when @MarginLevel = 0 then @BuyingPrice
				else case	when @MarginUnit = 'Percentage' 
						-- If the margin has been set to 100 in Error, change to 10%	
						then @BuyingPrice / (100 - case when @MarginLevel >= 100 then 10 else @MarginLevel end) * 100  
						else @BuyingPrice + @MarginLevel
				end
			end / @ContractExchangeRate as PriceWithContractMarginInGBP,
			
			-- Assumes that all these parameters  are percentage markups
			isnull(isnull(nullif(@ChannelRuleMarkup, 0), nullif(@ChannelMarkup, 0)) - @MarginDiscount, 0) as RulesMargin, 
			
			-- Only apply commissin when @AgentCommissionApplicable = 1
			case when isnull(@AgentCommissionApplicable, 0) = 0 then 0 else @AgentCommission end Commission
		)

	
	select  
		--PriceWithContractMarginInGBP,
		--RulesMargin,
		--Commission,
		case	when RulesMargin <= 0 
				then PriceWithContractMarginInGBP
				else PriceWithContractMarginInGBP / (100 - RulesMargin) * 100 
			end 
			* (1 + (Commission / 100.0)) 
			* @UserExchangeRate 
		as PriceInUserCurrency
	from	Base