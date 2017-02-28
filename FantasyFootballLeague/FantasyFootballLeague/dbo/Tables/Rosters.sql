CREATE TABLE [dbo].[Rosters] (
    [Id]       INT NOT NULL IDENTITY,
    [PlayerId] INT NOT NULL,
    [TeamId]   INT NOT NULL,
    [NflSeason] INT NOT NULL, 
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Rosters_Player] FOREIGN KEY ([PlayerId]) REFERENCES [dbo].[Players] ([Id]),
    CONSTRAINT [FK_Rosters_Team] FOREIGN KEY ([TeamId]) REFERENCES [dbo].[Teams] ([Id])
);

