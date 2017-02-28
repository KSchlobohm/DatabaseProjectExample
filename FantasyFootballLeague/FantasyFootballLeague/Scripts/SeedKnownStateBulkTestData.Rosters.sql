
DECLARE @BulkNumberOfRosters INT = 0
DECLARE @CurrentNflSeason INT = YEAR(GETDATE())

SELECT @BulkNumberOfRosters = COUNT(1) FROM [dbo].[Rosters] WHERE NflSeason = @CurrentNflSeason-1

-- Every team should have a roster for the last few years
-- And, as the leage continues, we'll actually have more and more historical data
IF @BulkNumberOfRosters < 32
BEGIN
	
	DECLARE @EpochTime INT = 1970

	WHILE @EpochTime < @CurrentNflSeason
	BEGIN

		DECLARE @BulkTeamId INT = 1
		WHILE @BulkTeamId <= 32
		BEGIN
			--grab 53 players and assign them to the roster

			INSERT INTO [dbo].[Rosters] (TeamId, PlayerId, NflSeason)
				SELECT TOP 53 @BulkTeamId, [Id], @CurrentNflSeason - 1
				FROM [dbo].[Players]
				WHERE [Id] > (@BulkTeamId-1) * 53

			SET @BulkTeamId = @BulkTeamId + 1
		END

		SET @CurrentNflSeason = @CurrentNflSeason -1
	END
END