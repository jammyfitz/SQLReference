-- Tables that contain the exclusivity data
SELECT * FROM GroupsOnContract
SELECT * FROM groups order by GroupName
SELECT * FROM userongroups where GroupID='37'

-- Check users
SELECT * FROM systemuseraccounts where userName like '%alpha%' and userPassword like '%THOM%'
SELECT * FROM systemuseraccounts where UserID=317542
SELECT * FROM systemuseraccounts where SystemUserCompanyID=31147
SELECT * FROM SystemUsers where SupplierID='10018'
SELECT * FROM SystemUsers where SystemUserCompanyID='15658'