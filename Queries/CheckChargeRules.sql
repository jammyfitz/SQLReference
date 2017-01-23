select * from ChargeGroup where ChargeGroupId='24' or ChargeGroupId='26'
select * from ChargeRule where ChargeGroupId='24' or ChargeGroupId='26'
select * from ChargeGroupType
select * from ChargeFee
select * from ChargeRule_BedBankImplementationType where ChargeRuleId='51'
select * from ChargeGroup_SystemUsers -- empty table
select * from AgentChargeGroup_ChargeGroup where AgentChargeGroupId='33'
select * from AgentChargeGroup


--Q's stuff
sp_helptext 'ta_spp_SelectBookingCharges_Cancellation'
select * from systemusers where systemusercompanyid = 18091
select * from systemuseraccounts where systemusercompanyid = 18091

ta_spp_SelectBookingCharges_Cancellation @BookingRefNo=0, @PolicyText=1, 
@PreBookingFormat=1, 
@UserId=113903, 
@DepartureDate='22/08/2011', 
@ChainCode='H4U',
@IsTransferOnly=0,
@RoomTypeId=2391

select * from sysobjects where type = 'u' and name like '%charge%'
select * from ChargeRule_BedBankImplementationType where chargeruleid = 51
select * from AgentChargeGroup where agentchargegroupid = 34
