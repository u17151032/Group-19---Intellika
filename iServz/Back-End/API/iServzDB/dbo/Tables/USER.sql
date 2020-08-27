CREATE TABLE [dbo].[USER] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [Email]        NVARCHAR (50) NULL,
    [Name]         NVARCHAR (50) NULL,
    [Surname]      NVARCHAR (50) NULL,
    [PasswordHash] TEXT          NULL,
    [PasswordSalt] TEXT          NULL,
    [Role]         TEXT          NULL,
    CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED ([ID] ASC)
);



