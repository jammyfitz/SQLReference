USE accommodations

-- Check records that we want to pipe into ta_spp_InsertIPConfigBulkLoad
SELECT * FROM IPConfig
INNER JOIN systemuseraccounts on systemuseraccounts.SystemUserCompanyID = IPConfig.SystemUserCompanyID
where IPStart like '%217.154.224%' and systemuseraccounts.isActive='1'

-- Export result into ultraedit and replace carriage returns with , and run sp
SELECT systemuseraccounts.UserName FROM IPConfig
INNER JOIN systemuseraccounts on systemuseraccounts.SystemUserCompanyID = IPConfig.SystemUserCompanyID
where IPStart like '%217.154.224%' and systemuseraccounts.isActive='1'