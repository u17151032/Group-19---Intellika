CREATE TABLE [dbo].[USER] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [Email]        NVARCHAR (50)  NULL,
    [Name]         NVARCHAR (50)  NULL,
    [Surname]      NVARCHAR (50)  NULL,
    [PasswordHash] NVARCHAR (MAX) NULL,
    [PasswordSalt] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED ([ID] ASC)
);

