-- Ftrips database
-- BIRSTALL 10.225.7.75
-- BRADFORD 10.225.7.90

use Changes

select * from BedBankSearchLog where SearchDate > '2010-07-06'

select * from BedBankSearchLog where SearchDate > '2010-07-06' and Duration > 10000
