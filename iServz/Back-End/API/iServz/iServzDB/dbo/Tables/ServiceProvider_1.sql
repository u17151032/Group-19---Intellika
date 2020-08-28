CREATE TABLE [dbo].[ServiceProvider] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [BusinessName] NVARCHAR (50) NULL,
    [Description]  NVARCHAR (50) NULL,
    [UserID]       INT           NULL,
    CONSTRAINT [PK_ServiceProvider] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ServiceProvider_USER] FOREIGN KEY ([UserID]) REFERENCES [dbo].[USER] ([ID])
);

