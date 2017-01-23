-- Szilvias query for list of all active users
select PersonNameAndSurname, UserName, UserPassword, systemuseraccounts.isactive, systemusers.CompanyName, ABTANumber, systemusers.isactive   from systemuseraccounts 
inner join systemusers on systemusers.SystemUserCompanyID = systemuseraccounts.SystemUserCompanyID where systemuseraccounts.isactive='1'