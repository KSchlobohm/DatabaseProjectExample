
--We'll need a rough size for the data we're going to review
--There are 32 teams in the NFL and each team has a maximum roster of 53 players
DECLARE @NumberOfPlayersInTheLeague INT = 53 * 32
DECLARE @Counter INT = 1

WHILE @Counter <= @NumberOfPlayersInTheLeague
BEGIN

	INSERT INTO [dbo].[Players] (FirstName, LastName)
	VALUES ('FirstName' + CAST(@Counter AS VARCHAR(5)),
			'LastName' + CAST(@Counter AS VARCHAR(5)))

	SET @Counter = @Counter + 1
END



