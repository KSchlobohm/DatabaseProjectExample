CREATE TABLE [dbo].[Teams] (
    [Id]         INT          NOT NULL,
    [Name]       VARCHAR (50) NOT NULL,
    [DivisionId] INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Teams_Division] FOREIGN KEY ([DivisionId]) REFERENCES [dbo].[Divisions] ([Id])
);

