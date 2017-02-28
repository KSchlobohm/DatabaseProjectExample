CREATE TABLE [dbo].[Divisions] (
    [Id]           INT          NOT NULL,
    [Name]         VARCHAR (50) NOT NULL,
    [ConferenceId] INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Divisions_Conference] FOREIGN KEY ([ConferenceId]) REFERENCES [dbo].[Conferences] ([Id])
);

