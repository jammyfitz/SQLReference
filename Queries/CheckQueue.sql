SELECT * FROM AccommodationBuildingPriceRangeUpdateQueue
--where SPCall like '%AccommodationBuildingId =11271%'
where Processed = 1
and CONVERT(SMALLDATETIME,CONVERT(VARCHAR(11),[DateAdded]),103) = CONVERT(SMALLDATETIME,'13/10/2011',103)
order by DateAdded desc

-- Check number of queue items
SELECT count(*) FROM AccommodationBuildingPriceRangeUpdateQueue where Processed = 0


-- Check queue size
SELECT * FROM AccommodationBuildingPriceRangeUpdateQueue
where Processed = 0
--and SPCall like '%@UserID  = 297611%'
--and CONVERT(SMALLDATETIME,CONVERT(VARCHAR(11),[DateAdded]),103) = CONVERT(SMALLDATETIME,'11/04/2012',103)
Order By DateAdded Asc

-- EZ Yield Count
SELECT count(*) FROM AccommodationBuildingPriceRangeUpdateQueue
where Processed = 0
and SPCall like '%@UserID  = 137741%'

-- HSD Count
SELECT count(*) FROM AccommodationBuildingPriceRangeUpdateQueue
where Processed = 0
and SPCall like '%@UserID  = 222838%'

-- Interogate queue performance and load
select 'Date Added' as [Type], convert(varchar(14),Dateadded ,113)+':00' as [Hour], count(*) as [Count] from Accommodations.dbo.AccommodationBuildingPriceRangeUpdateQueue where dateadded > dateadd(dd,-3,getdate()) group by convert(varchar(14),Dateadded ,113)+':00' order by convert(datetime,convert(varchar(14),Dateadded ,113)+':00') ;
select 'Date Processed' as [Type], convert(varchar(14),Dateprocessed ,113)+':00' as [Hour], count(*) as [Count] from Accommodations.dbo.AccommodationBuildingPriceRangeUpdateQueue where dateadded > dateadd(dd,-3,getdate()) group by convert(varchar(14),Dateprocessed ,113)+':00' order by convert(datetime,convert(varchar(14),Dateprocessed ,113)+':00')
