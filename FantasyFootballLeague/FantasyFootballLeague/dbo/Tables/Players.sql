CREATE TABLE [dbo].[Players] (
    [Id]        INT          NOT NULL IDENTITY,
    [FirstName] VARCHAR (50) NOT NULL,
    [LastName]  VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

