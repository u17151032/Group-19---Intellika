CREATE TABLE [dbo].[ServiceRequest] (
    [ID]           INT IDENTITY (1, 1) NOT NULL,
    [ConsumerID]   INT NOT NULL,
    [SR_Status_ID] INT NOT NULL,
    CONSTRAINT [PK_ServiceRequest] PRIMARY KEY CLUSTERED ([ID] ASC)
);

