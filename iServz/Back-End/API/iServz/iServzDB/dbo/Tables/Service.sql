CREATE TABLE [dbo].[Service] (
    [ID]          INT IDENTITY (1, 1) NOT NULL,
    [Utility_ID]  INT NOT NULL,
    [Category_ID] INT NOT NULL,
    CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED ([ID] ASC)
);

