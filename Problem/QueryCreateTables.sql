USE [Clients]
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Client_Id] [int] NOT NULL,
	[Account_Number] [nvarchar](200) NOT NULL,
	[Currency_Id] [int] NOT NULL,
	[Created_At] [datetime] NOT NULL,
	[Updated_At] [datetime] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[MiddleName] [nvarchar](200) NULL,
	[BirthDate] [datetime] NOT NULL,
	[Created_At] [datetime] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
/****** Object:  Table [dbo].[Currencies]    Script Date: 06.09.2021 4:27:22 ******/
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
CREATE TABLE [dbo].[Currencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Currency] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Currencies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Clients] FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Clients] ([Id])
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Clients]
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Currencies] FOREIGN KEY([Currency_Id])
REFERENCES [dbo].[Currencies] ([Id])
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Currencies]