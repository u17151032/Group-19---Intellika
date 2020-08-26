CREATE TABLE [dbo].[ServiceProvider] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [BusinessName] NVARCHAR (50)  NULL,
    [Decription]   NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_ServiceProvider] PRIMARY KEY CLUSTERED ([ID] ASC)
);

