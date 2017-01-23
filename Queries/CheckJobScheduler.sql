-- Job Status List
-- 0 - Created
-- 1 - Pending
-- 2 - Processed
-- 3 - Failed
-- 5 - Processing


-- Expedia - StartRecord;EndRecord;BatchSize;StartOfImportFlag;LanguageCode
select top 5 * from job..job where typeid = 56 order by id desc
--insert into job..job (typeId, statusId, priority, context, createdDate, createdBy) values (66, 0, 1,'',getdate(), 8)
--update job..job set statusid = 0, Context='90000;130000;200;0;NL' where id = 4299997

-- Check for running jobs
select * from job..Job where 


-- Pegasus - ftp.hotels4u.com;qtmp;pegasus;c:\temp\odd\;support@apixml.com
select * from job..job where Id='2648435'
select * from job..job where typeid = 24 order by CreatedDate desc
select * from job..job where CreatedDate=getdate()
--Robs nugger Job View
select top 20 * from v_Job order by CreatedDate desc
select * from job..job where typeid = 38 order by id desc
select * from job..Job where id = 125075
--update job..Job set Context = '15', statusId=0, ContextStatus=null where id = 125075
--update job..Job set Context = 'ftp.hotels4u.com;qtmp;pegasus;c:\temp\odd\;support@apixml.com', statusId=0, ContextStatus=null where id = 2648435
select GETDATE()
