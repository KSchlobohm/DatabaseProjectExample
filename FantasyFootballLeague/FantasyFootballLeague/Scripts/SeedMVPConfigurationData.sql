

	/* The Conferences */
	MERGE INTO [dbo].[Conferences] AS [Target]
	USING (VALUES	(1, N'American Football Conference'),
					(2, N'National Football Conference'))
	AS [Source] (Id, Name)
	ON [Target].[Id] = [Source].[Id]
	WHEN MATCHED THEN
		UPDATE SET [Name] = [Source].[Name]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT (Id, Name) VALUES ([Source].[Id], [Source].[Name])
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;
		
	/* The Divisions */			

	MERGE INTO [dbo].[Divisions] AS [Target]
	USING (VALUES	(1, N'NFC North', 2),
					(2, N'NFC East', 2),
					(3, N'NFC South', 2),
					(4, N'NFC West', 2),
					(5, N'AFC North', 1),
					(6, N'AFC East', 1),
					(7, N'AFC South', 1),
					(8, N'AFC West', 1))
	AS [Source] (Id, Name, ConferenceId)
	ON [Target].[Id] = [Source].[Id]
	WHEN MATCHED THEN
		UPDATE SET [Name] = [Source].[Name], [ConferenceId] = [Source].[ConferenceId]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT (Id, Name, ConferenceId) VALUES ([Source].[Id], [Source].[Name], [Source].[ConferenceId])
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

	/* The Teams */

	MERGE INTO [dbo].[Teams] AS TARGET
	USING (VALUES	(1, N'Chicago Bears', 1),
					(2, N'Minnesota Vikings', 1),
					(3, N'Green Bay Packers', 1),
					(4, N'Detroit Lions', 1),
					(5, N'Dallas Cowboys', 2),
					(6, N'Washington Redskins', 2),
					(7, N'Philadelphia Eagles', 2),
					(8, N'New York Giants', 2),
					(9, N'Atlanta Falcons', 3),
					(10, N'Tampa Bay Buccaneers', 3),
					(11, N'New Orleans Saints', 3),
					(12, N'Carolina Panthers', 3),
					(13, N'Los Angeles Rams', 4),
					(14, N'Seattle Seahawks', 4),
					(15, N'San Francisco 49ers', 4),
					(16, N'Arizona Cardinals', 4),
					(17, N'Baltimore Ravens', 5),
					(18, N'Pittsburgh Steelers', 5),
					(19, N'Cleveland Browns', 5),
					(20, N'Cincinatti Bengals', 5),
					(21, N'Buffalo Bills', 6),
					(22, N'New York Jets', 6),
					(23, N'New England Patriots', 6),
					(24, N'Miami Dolphins', 6),
					(25, N'Tennessee Titans', 7),
					(26, N'Jacksonville Jaguars', 7),
					(27, N'Indianapolis Colts', 7),
					(28, N'Houston Texans', 7),
					(29, N'Denver Broncos', 8),
					(30, N'San Diego Chargers', 8),
					(31, N'Oakland Raiders', 8),
					(32, N'Kansas City Chiefs', 8))
	AS [Source] (Id, Name, DivisionId)
	ON [Target].[Id] = [Source].[Id]
	WHEN MATCHED THEN
		UPDATE SET [Name] = [Source].[Name], [DivisionId] = [Source].[DivisionId]
	WHEN NOT MATCHED BY TARGET THEN
		INSERT (Id, Name, DivisionId) VALUES ([Source].[Id], [Source].[Name], [Source].[DivisionId])
	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;

	

