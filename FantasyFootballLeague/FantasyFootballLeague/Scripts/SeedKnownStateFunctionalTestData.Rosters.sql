
DECLARE @NumberOfRosters INT = 0

SELECT @NumberOfRosters = COUNT(1) FROM [dbo].[Rosters] WHERE NflSeason = YEAR(GETDATE())

-- Every team should have a roster this year
IF @NumberOfRosters < 32
BEGIN
	DECLARE @TeamId INT = 1
	WHILE @TeamId <= 32
	BEGIN
		--grab 53 players and assign them to the roster

		INSERT INTO [dbo].[Rosters] (TeamId, PlayerId, NflSeason)
			SELECT TOP 53 @TeamId, [Id], YEAR(GETDATE())
			FROM [dbo].[Players]
			WHERE [Id] > (@TeamId-1) * 53

		SET @TeamId = @TeamId + 1
	END
END
