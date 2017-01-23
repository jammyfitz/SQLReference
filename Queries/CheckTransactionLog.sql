-- Connect to Transaction Logs Server
SELECT * FROM LogServ..TransactionsLog WHERE Reference='6331229'
SELECT TOP 100 * FROM LogServ..TransactionsLog WHERE [Message] like '%VPayment%' order by DateTime desc

SELECT * FROM Job..TransactionsLog WHERE Reference='6097788'
select * from job..TransactionsLog where referenceType='SellReference'

select * from job..TransactionsLog where ServerName='DJHWNG5J' order by DateTime desc