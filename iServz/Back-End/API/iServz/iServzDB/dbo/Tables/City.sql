CREATE TABLE [dbo].[City] (
    [ID]         INT IDENTITY (1, 1) NOT NULL,
    [ProvinceID] INT NOT NULL,
    CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED ([ID] ASC)
);

