CREATE TABLE [dbo].[ServiceProvider] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [BusinessName]  NVARCHAR (50)  NULL,
    [Decription]    NVARCHAR (MAX) NULL,
    [AverageRating] FLOAT (53)     NULL,
    [OwnerName]     NVARCHAR (50)  NULL,
    CONSTRAINT [PK_ServiceProvider] PRIMARY KEY CLUSTERED ([ID] ASC)
);





