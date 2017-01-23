-- Connect to RSDBLOG1
select top 100 * from [Log]..ErrorLog where ApplicationName='OTA_WS'
--and ServerLogEntryDateTime = '08 aug 2011'
--and ServerName='GBBIT-HUIIS03'
--and ([Message] like '%403%' or Exception like '%403%')
order by ServerLogEntryDateTime desc


