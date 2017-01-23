--Check Type 12 and 16
select * from job with (nolock)
where
(TypeId=12 or TypeId=16)
and CONVERT(SMALLDATETIME,CONVERT(VARCHAR(11),CreatedDate),103) =CONVERT(SMALLDATETIME,'04/07/2012')
and Context like '%3528642%'
order by CreatedDate



