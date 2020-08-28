﻿CREATE TABLE [dbo].[Consumer] (
    [ID]     INT IDENTITY (1, 1) NOT NULL,
    [UserID] INT NULL,
    CONSTRAINT [PK_Consumer] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Consumer_USER] FOREIGN KEY ([UserID]) REFERENCES [dbo].[USER] ([ID])
);

