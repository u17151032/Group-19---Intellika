﻿CREATE TABLE [dbo].[Admin] (
    [ID]     INT IDENTITY (1, 1) NOT NULL,
    [UserID] INT NULL,
    CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Admin_USER] FOREIGN KEY ([UserID]) REFERENCES [dbo].[USER] ([ID])
);

