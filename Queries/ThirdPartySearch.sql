USE [Accommodations]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[ta_spp_SearchHotelContent]
		@SystemUserCompanyId = 15145,
		@ChainCode = N'',
		@HotelIds = N'|EX,58|HI,452|EX,676|EX,1040|HI,1095|EX,1206|HI,1378|EX,1658|HI,1669|HI,1837|HI,2156|HI,2202|EX,2633|HI,2677|EX,2695|EX,2750|HI,2756|EX,3292|HI,3320|HI,3335|EX,3521|EX,3898|HI,3940|IC,4127|EX,4329|HI,4545|EX,4607|EX,4641|EX,4687|EX,4704|HI,4762|HI,4927|EX,5478|HI,6253|THTLS,32896|THTLS,32924|THTLS,32927|THTLS,32931|THTLS,32932|THTLS,33003|THTLS,33005|THTLS,33038|THTLS,33095|THTLS,33099|THTLS,33147|THTLS,33160|THTLS,33162|THTLS,33163|THTLS,33164|THTLS,33165|THTLS,33167|THTLS,33174|THTLS,33206|THTLS,33213|THTLS,33239|THTLS,33249|THTLS,33279|THTLS,33285|THTLS,33287|THTLS,33302|THTLS,33317|THTLS,33347|THTLS,33352|THTLS,33354|THTLS,33438|THTLS,33510|THTLS,33516|THTLS,33524|THTLS,33635|THTLS,33653|THTLS,33664|THTLS,33694|THTLS,33697|THTLS,33698|THTLS,33699|THTLS,33703|THTLS,33704|THTLS,33758|THTLS,33759|THTLS,33776|THTLS,33777|THTLS,33779|THTLS,33782|THTLS,33783|THTLS,33786|THTLS,33819|THTLS,33832|THTLS,33858|THTLS,33860|THTLS,33900|THTLS,33912|THTLS,33922|THTLS,33956|THTLS,33960|THTLS,33964|THTLS,33979|THTLS,33984|THTLS,33999|THTLS,34014|THTLS,34027|THTLS,34029|THTLS,34034|THTLS,34044|THTLS,34046|THTLS,34060|THTLS,34087|THTLS,34127|THTLS,34179|THTLS,34202|THTLS,34204|THTLS,34215|THTLS,34248|THTLS,34249|THTLS,42950|THTLS,42958|THTLS,42972|THTLS,42974|THTLS,42996|THTLS,42997|THTLS,43001|THTLS,43003|THTLS,43007|THTLS,43011|THTLS,43018|THTLS,43038|THTLS,43039|THTLS,43054|THTLS,43070|THTLS,43090|THTLS,44454|THTLS,44458|THTLS,44467|THTLS,33313|THTLS,33517|THTLS,33530|THTLS,33619|THTLS,33622|THTLS,33623|THTLS,33648|THTLS,33724|THTLS,33780|THTLS,33883|THTLS,33899|THTLS,34109|THTLS,44848|XN,126|XM,965|XN,1501|XN,2275|CP,2482|CP,2610|CP,3427|XN,5245|XN,5675|THTLS,33121|THTLS,33144|THTLS,33207|THTLS,33289|THTLS,33491|THTLS,33509|THTLS,33535|THTLS,33610|THTLS,33649|THTLS,33775|THTLS,33781|THTLS,33967|THTLS,34033|THTLS,34096|THTLS,34167|THTLS,43004|SM,45074|AP,45303|AP,45451|THTLS,65761|THTLS,65806|THTLS,65850|THTLS,65923|THTLS,66011|THTLS,66459|THTLS,66872|THTLS,67051|THTLS,67502|THTLS,67540|THTLS,67547|THTLS,67718|THTLS,67943|HL,63441|HL,63722|HL,63895|HL,63930|HL,64010|HL,64374|HL,64548|HL,64738|HL,63315|H4U,10169|H4U,10171|H4U,10172|H4U,10174|H4U,10175|H4U,10177|H4U,10179|H4U,10180|H4U,10185|H4U,10186|H4U,10187|H4U,10189|H4U,10190|H4U,10192|H4U,10193|H4U,10195|H4U,10196|H4U,10197|H4U,10198|H4U,10199|H4U,10200|H4U,10201|H4U,10202|H4U,10203|H4U,10204|H4U,10205|H4U,10210|H4U,10213|H4U,10214|H4U,10215|H4U,10216|H4U,10218|H4U,10222|H4U,10224|H4U,10225|H4U,10226|H4U,10227|H4U,10228|H4U,10229|H4U,10230|H4U,10231|H4U,10232|RA,51283|RA,51437|RA,55232|RA,60183|HL,63731|PII,64042|PII,64803|RAD,65396|HL,64467|H4U,10469|H4U,10556|H4U,10221|H4U,11185|H4U,11189|H4U,11190|H4U,11193|H4U,10485|H4U,10486|H4U,11187|H4U,11191|H4U,11314|H4U,11301|H4U,11692|H4U,11826|MIT,73355|MIT,73356|MIT,73357|MIT,73358|MIT,73359|MIT,73360|MIT,73361|MIT,73362|MIT,73364|MIT,73365|MIT,73366|MIT,73367|MIT,73368|MIT,73369|MIT,73370|MIT,73372|MIT,73373|MIT,73375|MIT,73376|MIT,73378|MIT,73379|MIT,73380|MIT,73381|MIT,73385|MIT,73386|MIT,73387|MIT,73388|MIT,73389|MIT,73390|MIT,73391|MIT,73392|MIT,73393|MIT,73394|MIT,73395|MIT,73397|MIT,73398|MIT,73399|H4U,11795|H4U,11844|H4U,11845|H4U,11846|H4U,11847|H4U,11960|H4U,11961|H4U,11970|MIT,73377|MIT,73400|H4U,12348|H4U,12303|H4U,12304|H4U,12305|H4U,12306|H4U,12307|H4U,12371|H4U,12106|MIT,73371|H4U,12105|H4U,12526|H4U,12551|H4U,12623|H4U,12624|H4U,12626|H4U,12627|H4U,12628|H4U,12629|H4U,12630|H4U,12631|H4U,12632|H4U,12633|H4U,12638|H4U,12644|H4U,12531|H4U,12532|H4U,12564|H4U,12621|H4U,12622|H4U,12678|H4U,12726|H4U,12727|H4U,12728|H4U,12729|H4U,12700|DI,51521|DI,55953|DI,62117|RAD,63268|RAD,63445|RAD,63489|RAD,63491|RAD,63789|RAD,63853|RAD,63988|RAD,64088|RAD,65284|RAD,65355|HL,65389|PKP,80871|PKP,80883|'

SELECT	'Return Value' = @return_value

GO
