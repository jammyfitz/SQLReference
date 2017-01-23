-- Job Status List
-- 0 - Created
-- 1 - Pending
-- 2 - Processed
-- 3 - Failed

SELECT * FROM Accommodations..BedBankImplementationType

SELECT * FROM Accommodations..BedBankContentFile order by FileID desc

--UPDATE BedBankContentFile SET [Filename]='ODDCCN_2011-10-31.txt' WHERE FileID='9'
--UPDATE BedBankContentFile SET StatusId='3' WHERE FileID='837'
