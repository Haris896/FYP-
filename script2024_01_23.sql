USE [master]
GO
/****** Object:  Database [Proj_LoanApp_By_BlockChain]    Script Date: 1/23/2024 11:22:17 AM ******/
CREATE DATABASE [Proj_LoanApp_By_BlockChain]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proj_LoanApp_By_BlockChain', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Proj_LoanApp_By_BlockChain.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Proj_LoanApp_By_BlockChain_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Proj_LoanApp_By_BlockChain_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proj_LoanApp_By_BlockChain].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET  MULTI_USER 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Proj_LoanApp_By_BlockChain]
GO
/****** Object:  Table [dbo].[tbl_block_chain_ledger]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_block_chain_ledger](
	[Block_ID] [int] IDENTITY(1,1) NOT NULL,
	[Loan_ID] [int] NULL,
	[transaction_id] [int] NULL,
	[timestamp] [nvarchar](500) NULL,
	[PreviousBlock] [nvarchar](500) NULL,
	[Data] [nvarchar](500) NULL,
	[Hash] [nvarchar](500) NULL,
	[Customer_ID] [int] NULL,
 CONSTRAINT [PK_tbl_block_chain_ledger] PRIMARY KEY CLUSTERED 
(
	[Block_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_city]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_city](
	[City_id] [int] IDENTITY(1,1) NOT NULL,
	[City_name] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_city] PRIMARY KEY CLUSTERED 
(
	[City_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_credit_Report]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_credit_Report](
	[report_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[Loan_Application_id] [int] NULL,
	[score] [varchar](500) NULL,
	[last_update] [date] NULL,
 CONSTRAINT [PK_tbl_credit_Report] PRIMARY KEY CLUSTERED 
(
	[report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_customer]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_customer](
	[Customer_id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_First_name] [varchar](200) NULL,
	[Customer_Middle_Name] [varchar](200) NULL,
	[Customer_Last_Name] [varchar](200) NULL,
	[Customer_Source_of_income] [int] NULL,
	[Customer_Email_address] [nvarchar](200) NULL,
	[Customer_address] [nvarchar](500) NULL,
	[Customer_Phone] [nvarchar](50) NULL,
	[Customer_Mobile] [nvarchar](50) NULL,
	[Customer_Gender] [char](2) NULL,
	[City] [int] NULL,
	[Source_Of_Income] [int] NULL,
	[Monthly_Income] [float] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tbl_customer] PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_dispute]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_dispute](
	[Dispute_ID] [int] IDENTITY(1,1) NOT NULL,
	[Dispute_TotalAmount] [float] NULL,
	[Dispute_PayableAmount] [float] NULL,
	[Total_PaidAmount] [float] NULL,
	[payment_date] [datetime] NULL,
	[loan_id] [int] NULL,
	[Customer_id] [int] NULL,
	[Remarks] [varchar](1000) NULL,
	[Status] [int] NULL,
	[Dispute_date] [datetime] NULL,
	[Dispute_close_date] [datetime] NULL,
	[Settle_Amount] [float] NULL,
	[SettleAmount_date] [date] NULL,
	[SettleAMount_by] [int] NULL,
 CONSTRAINT [PK_tbl_dispute] PRIMARY KEY CLUSTERED 
(
	[Dispute_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Gender]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Gender](
	[Gender_ID] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [varchar](50) NULL,
	[Gender_Alias] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Gender] PRIMARY KEY CLUSTERED 
(
	[Gender_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_loan]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_loan](
	[Loan_id] [int] IDENTITY(1,1) NOT NULL,
	[Loan_Amount] [float] NULL,
	[interest] [float] NULL,
	[total_amount] [float] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[status_id] [int] NULL,
	[tenure_id] [int] NULL,
 CONSTRAINT [PK_tbl_loan] PRIMARY KEY CLUSTERED 
(
	[Loan_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_loan_Application]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_loan_Application](
	[Loan_Application_id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_id] [int] NULL,
	[Loan_id] [int] NULL,
	[application_date] [date] NULL,
	[Extra_discount] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tbl_loan_Application] PRIMARY KEY CLUSTERED 
(
	[Loan_Application_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Loan_Scheduler]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Loan_Scheduler](
	[Schedule_ID] [int] IDENTITY(1,1) NOT NULL,
	[Loan_Application_id] [int] NULL,
	[Customer_id] [int] NULL,
	[Schedule_Year] [int] NULL,
	[Schedule_Month] [date] NULL,
	[AmountPerMonth] [float] NULL,
	[PaidAmount] [float] NULL,
	[PaidDate] [date] NULL,
 CONSTRAINT [PK_tbl_Loan_Scheduler] PRIMARY KEY CLUSTERED 
(
	[Schedule_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_LoanApplications_SmartContract]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LoanApplications_SmartContract](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BorrowerAddress] [nvarchar](255) NOT NULL,
	[LoanAmount] [int] NOT NULL,
	[TransactionHash] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_payment]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_payment](
	[Payment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Payment_Amount] [float] NULL,
	[payment_date] [datetime] NULL,
	[loan_id] [int] NULL,
	[Customer_id] [int] NULL,
 CONSTRAINT [PK_tbl_payment] PRIMARY KEY CLUSTERED 
(
	[Payment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Source_Of_Income]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Source_Of_Income](
	[SOI_id] [int] IDENTITY(1,1) NOT NULL,
	[SOI_Description] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Source_Of_Income] PRIMARY KEY CLUSTERED 
(
	[SOI_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_tenure]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_tenure](
	[Tenure_ID] [int] IDENTITY(1,1) NOT NULL,
	[Duration] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tbl_tenure] PRIMARY KEY CLUSTERED 
(
	[Tenure_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_users]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](100) NULL,
	[user_pwd] [nvarchar](100) NULL,
	[role_Id] [int] NULL,
	[IsActive] [bit] NULL,
	[Customer_ID] [int] NULL,
 CONSTRAINT [PK_tbl_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_block_chain_ledger] ON 

INSERT [dbo].[tbl_block_chain_ledger] ([Block_ID], [Loan_ID], [transaction_id], [timestamp], [PreviousBlock], [Data], [Hash], [Customer_ID]) VALUES (1, 1, 0, N'Jan 20 2024 11:33AM', N'0', N'Loan Request: Customer_ID=1, Amount: ''100000'',Loan_ID=''1''', N'1758c033946c4709a3b0701257c85851c5362c51b70fb9740befce0fb58a4411', 1)
INSERT [dbo].[tbl_block_chain_ledger] ([Block_ID], [Loan_ID], [transaction_id], [timestamp], [PreviousBlock], [Data], [Hash], [Customer_ID]) VALUES (2, 1, 1, N'Jan 20 2024 11:33AM', N'1758c033946c4709a3b0701257c85851c5362c51b70fb9740befce0fb58a4411', N'Loan In Process: Customer_ID=1, Amount: ''100000'',Loan_ID=''1''', N'6c8bcbeead545294f5582011bdf4708ca486c2a7970a62a8bf996c87d240cbaa', 1)
INSERT [dbo].[tbl_block_chain_ledger] ([Block_ID], [Loan_ID], [transaction_id], [timestamp], [PreviousBlock], [Data], [Hash], [Customer_ID]) VALUES (3, 1, 0, N'Jan 20 2024 11:38AM', N'6c8bcbeead545294f5582011bdf4708ca486c2a7970a62a8bf996c87d240cbaa', N'Loan Approved: Customer_ID=1, Amount: ''121000'',Loan_ID=''1''', N'1ba8c6dfb5984be6e596a973ee858f3b8a228f3904fef00bc6b20b9f80e4c9ed', 1)
INSERT [dbo].[tbl_block_chain_ledger] ([Block_ID], [Loan_ID], [transaction_id], [timestamp], [PreviousBlock], [Data], [Hash], [Customer_ID]) VALUES (4, 1, 0, N'Jan 20 2024 11:44AM', N'1ba8c6dfb5984be6e596a973ee858f3b8a228f3904fef00bc6b20b9f80e4c9ed', N'Loan Payment: Customer_ID=1, Amount: ''100000'',Loan_ID=''1''', N'9e87c827364b101f9cbcf2598df21d3c97479903b85a01b8da587b178aeceb18', 1)
INSERT [dbo].[tbl_block_chain_ledger] ([Block_ID], [Loan_ID], [transaction_id], [timestamp], [PreviousBlock], [Data], [Hash], [Customer_ID]) VALUES (1002, 2, 0, N'Jan 21 2024  5:53AM', N'0', N'Loan Request: Customer_ID=2, Amount: ''25000'',Loan_ID=''2''', N'd6046cb2d7946a449643117d9f9bcce4127d2e350ede570eef24189113f2ce1a', 2)
INSERT [dbo].[tbl_block_chain_ledger] ([Block_ID], [Loan_ID], [transaction_id], [timestamp], [PreviousBlock], [Data], [Hash], [Customer_ID]) VALUES (1003, 2, 1, N'Jan 21 2024  5:53AM', N'd6046cb2d7946a449643117d9f9bcce4127d2e350ede570eef24189113f2ce1a', N'Loan In Process: Customer_ID=2, Amount: ''25000'',Loan_ID=''2''', N'cd6db01e11606dbb4144bd96378fe368773ed16358869764e5d8b3cdb221e983', 2)
INSERT [dbo].[tbl_block_chain_ledger] ([Block_ID], [Loan_ID], [transaction_id], [timestamp], [PreviousBlock], [Data], [Hash], [Customer_ID]) VALUES (1004, 2, 0, N'Jan 21 2024  5:54AM', N'cd6db01e11606dbb4144bd96378fe368773ed16358869764e5d8b3cdb221e983', N'Loan Approved: Customer_ID=2, Amount: ''26250'',Loan_ID=''2''', N'34b2e60aa56abf1e2a0c880c4805b4c3eecec46ed6b22a9becc1391057c257e0', 2)
SET IDENTITY_INSERT [dbo].[tbl_block_chain_ledger] OFF
SET IDENTITY_INSERT [dbo].[tbl_city] ON 

INSERT [dbo].[tbl_city] ([City_id], [City_name]) VALUES (1, N'Karachi')
INSERT [dbo].[tbl_city] ([City_id], [City_name]) VALUES (2, N'Hyderabad')
INSERT [dbo].[tbl_city] ([City_id], [City_name]) VALUES (3, N'Islamabad')
INSERT [dbo].[tbl_city] ([City_id], [City_name]) VALUES (4, N'Lahore')
INSERT [dbo].[tbl_city] ([City_id], [City_name]) VALUES (5, N'Sukkur')
SET IDENTITY_INSERT [dbo].[tbl_city] OFF
SET IDENTITY_INSERT [dbo].[tbl_credit_Report] ON 

INSERT [dbo].[tbl_credit_Report] ([report_id], [customer_id], [Loan_Application_id], [score], [last_update]) VALUES (1, 1, 1, N'', CAST(N'2024-01-20' AS Date))
INSERT [dbo].[tbl_credit_Report] ([report_id], [customer_id], [Loan_Application_id], [score], [last_update]) VALUES (2, 2, 2, N'', CAST(N'2024-01-21' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_credit_Report] OFF
SET IDENTITY_INSERT [dbo].[tbl_customer] ON 

INSERT [dbo].[tbl_customer] ([Customer_id], [Customer_First_name], [Customer_Middle_Name], [Customer_Last_Name], [Customer_Source_of_income], [Customer_Email_address], [Customer_address], [Customer_Phone], [Customer_Mobile], [Customer_Gender], [City], [Source_Of_Income], [Monthly_Income], [IsActive]) VALUES (1, N'First Name', N'Middle Name', N'Last Name', 1, N'test@gmail.com', N'Karachi', N'0333232323', N'0332323232', N'M ', 1, 1, 100000, 1)
INSERT [dbo].[tbl_customer] ([Customer_id], [Customer_First_name], [Customer_Middle_Name], [Customer_Last_Name], [Customer_Source_of_income], [Customer_Email_address], [Customer_address], [Customer_Phone], [Customer_Mobile], [Customer_Gender], [City], [Source_Of_Income], [Monthly_Income], [IsActive]) VALUES (2, N'Junaid', N'Khan', N'A', 1, N'Junaid@gmail.com', N'12dfs', N'0330333', N'03332323', N'M ', 1, 1, 100000, 1)
SET IDENTITY_INSERT [dbo].[tbl_customer] OFF
SET IDENTITY_INSERT [dbo].[tbl_dispute] ON 

INSERT [dbo].[tbl_dispute] ([Dispute_ID], [Dispute_TotalAmount], [Dispute_PayableAmount], [Total_PaidAmount], [payment_date], [loan_id], [Customer_id], [Remarks], [Status], [Dispute_date], [Dispute_close_date], [Settle_Amount], [SettleAmount_date], [SettleAMount_by]) VALUES (1, 121000, 121000, 0, CAST(N'2024-01-20 00:00:00.000' AS DateTime), 1, 1, N'discount', 2, NULL, NULL, 21000, NULL, NULL)
INSERT [dbo].[tbl_dispute] ([Dispute_ID], [Dispute_TotalAmount], [Dispute_PayableAmount], [Total_PaidAmount], [payment_date], [loan_id], [Customer_id], [Remarks], [Status], [Dispute_date], [Dispute_close_date], [Settle_Amount], [SettleAmount_date], [SettleAMount_by]) VALUES (2, 0, 0, 0, CAST(N'2024-01-20 00:00:00.000' AS DateTime), 1, 0, N'', 1, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_dispute] OFF
SET IDENTITY_INSERT [dbo].[tbl_Gender] ON 

INSERT [dbo].[tbl_Gender] ([Gender_ID], [Gender], [Gender_Alias]) VALUES (1, N'Male', N'M')
INSERT [dbo].[tbl_Gender] ([Gender_ID], [Gender], [Gender_Alias]) VALUES (2, N'Female', N'F')
SET IDENTITY_INSERT [dbo].[tbl_Gender] OFF
SET IDENTITY_INSERT [dbo].[tbl_loan] ON 

INSERT [dbo].[tbl_loan] ([Loan_id], [Loan_Amount], [interest], [total_amount], [start_date], [end_date], [status_id], [tenure_id]) VALUES (1, 100000, 11, 121000, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-30' AS Date), 1, 10)
INSERT [dbo].[tbl_loan] ([Loan_id], [Loan_Amount], [interest], [total_amount], [start_date], [end_date], [status_id], [tenure_id]) VALUES (2, 25000, 5, 26250, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-30' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[tbl_loan] OFF
SET IDENTITY_INSERT [dbo].[tbl_loan_Application] ON 

INSERT [dbo].[tbl_loan_Application] ([Loan_Application_id], [Customer_id], [Loan_id], [application_date], [Extra_discount], [status]) VALUES (1, 1, 1, CAST(N'2024-01-20' AS Date), 21000, 2)
INSERT [dbo].[tbl_loan_Application] ([Loan_Application_id], [Customer_id], [Loan_id], [application_date], [Extra_discount], [status]) VALUES (2, 2, 2, CAST(N'2024-01-21' AS Date), NULL, 2)
SET IDENTITY_INSERT [dbo].[tbl_loan_Application] OFF
SET IDENTITY_INSERT [dbo].[tbl_Loan_Scheduler] ON 

INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (1, 1, 1, 2024, CAST(N'2024-01-20' AS Date), 1008.3333333333331, 10000, CAST(N'2024-01-20' AS Date))
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (2, 1, 1, 2024, CAST(N'2024-02-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (3, 1, 1, 2024, CAST(N'2024-03-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (4, 1, 1, 2024, CAST(N'2024-04-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (5, 1, 1, 2024, CAST(N'2024-05-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (6, 1, 1, 2024, CAST(N'2024-06-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (7, 1, 1, 2024, CAST(N'2024-07-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (8, 1, 1, 2024, CAST(N'2024-08-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (9, 1, 1, 2024, CAST(N'2024-09-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (10, 1, 1, 2024, CAST(N'2024-10-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (11, 1, 1, 2024, CAST(N'2024-11-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (12, 1, 1, 2024, CAST(N'2024-12-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (13, 1, 1, 2025, CAST(N'2025-01-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (14, 1, 1, 2025, CAST(N'2025-02-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (15, 1, 1, 2025, CAST(N'2025-03-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (16, 1, 1, 2025, CAST(N'2025-04-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (17, 1, 1, 2025, CAST(N'2025-05-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (18, 1, 1, 2025, CAST(N'2025-06-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (19, 1, 1, 2025, CAST(N'2025-07-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (20, 1, 1, 2025, CAST(N'2025-08-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (21, 1, 1, 2025, CAST(N'2025-09-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (22, 1, 1, 2025, CAST(N'2025-10-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (23, 1, 1, 2025, CAST(N'2025-11-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (24, 1, 1, 2025, CAST(N'2025-12-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (25, 1, 1, 2026, CAST(N'2026-01-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (26, 1, 1, 2026, CAST(N'2026-02-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (27, 1, 1, 2026, CAST(N'2026-03-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (28, 1, 1, 2026, CAST(N'2026-04-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (29, 1, 1, 2026, CAST(N'2026-05-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (30, 1, 1, 2026, CAST(N'2026-06-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (31, 1, 1, 2026, CAST(N'2026-07-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (32, 1, 1, 2026, CAST(N'2026-08-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (33, 1, 1, 2026, CAST(N'2026-09-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (34, 1, 1, 2026, CAST(N'2026-10-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (35, 1, 1, 2026, CAST(N'2026-11-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (36, 1, 1, 2026, CAST(N'2026-12-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (37, 1, 1, 2027, CAST(N'2027-01-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (38, 1, 1, 2027, CAST(N'2027-02-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (39, 1, 1, 2027, CAST(N'2027-03-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (40, 1, 1, 2027, CAST(N'2027-04-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (41, 1, 1, 2027, CAST(N'2027-05-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (42, 1, 1, 2027, CAST(N'2027-06-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (43, 1, 1, 2027, CAST(N'2027-07-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (44, 1, 1, 2027, CAST(N'2027-08-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (45, 1, 1, 2027, CAST(N'2027-09-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (46, 1, 1, 2027, CAST(N'2027-10-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (47, 1, 1, 2027, CAST(N'2027-11-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (48, 1, 1, 2027, CAST(N'2027-12-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (49, 1, 1, 2028, CAST(N'2028-01-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (50, 1, 1, 2028, CAST(N'2028-02-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (51, 1, 1, 2028, CAST(N'2028-03-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (52, 1, 1, 2028, CAST(N'2028-04-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (53, 1, 1, 2028, CAST(N'2028-05-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (54, 1, 1, 2028, CAST(N'2028-06-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (55, 1, 1, 2028, CAST(N'2028-07-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (56, 1, 1, 2028, CAST(N'2028-08-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (57, 1, 1, 2028, CAST(N'2028-09-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (58, 1, 1, 2028, CAST(N'2028-10-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (59, 1, 1, 2028, CAST(N'2028-11-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (60, 1, 1, 2028, CAST(N'2028-12-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (61, 1, 1, 2029, CAST(N'2029-01-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (62, 1, 1, 2029, CAST(N'2029-02-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (63, 1, 1, 2029, CAST(N'2029-03-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (64, 1, 1, 2029, CAST(N'2029-04-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (65, 1, 1, 2029, CAST(N'2029-05-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (66, 1, 1, 2029, CAST(N'2029-06-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (67, 1, 1, 2029, CAST(N'2029-07-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (68, 1, 1, 2029, CAST(N'2029-08-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (69, 1, 1, 2029, CAST(N'2029-09-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (70, 1, 1, 2029, CAST(N'2029-10-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (71, 1, 1, 2029, CAST(N'2029-11-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (72, 1, 1, 2029, CAST(N'2029-12-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (73, 1, 1, 2030, CAST(N'2030-01-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (74, 1, 1, 2030, CAST(N'2030-02-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (75, 1, 1, 2030, CAST(N'2030-03-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (76, 1, 1, 2030, CAST(N'2030-04-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (77, 1, 1, 2030, CAST(N'2030-05-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (78, 1, 1, 2030, CAST(N'2030-06-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (79, 1, 1, 2030, CAST(N'2030-07-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (80, 1, 1, 2030, CAST(N'2030-08-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (81, 1, 1, 2030, CAST(N'2030-09-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (82, 1, 1, 2030, CAST(N'2030-10-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (83, 1, 1, 2030, CAST(N'2030-11-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (84, 1, 1, 2030, CAST(N'2030-12-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (85, 1, 1, 2031, CAST(N'2031-01-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (86, 1, 1, 2031, CAST(N'2031-02-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (87, 1, 1, 2031, CAST(N'2031-03-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (88, 1, 1, 2031, CAST(N'2031-04-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (89, 1, 1, 2031, CAST(N'2031-05-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (90, 1, 1, 2031, CAST(N'2031-06-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (91, 1, 1, 2031, CAST(N'2031-07-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (92, 1, 1, 2031, CAST(N'2031-08-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (93, 1, 1, 2031, CAST(N'2031-09-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (94, 1, 1, 2031, CAST(N'2031-10-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (95, 1, 1, 2031, CAST(N'2031-11-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (96, 1, 1, 2031, CAST(N'2031-12-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (97, 1, 1, 2032, CAST(N'2032-01-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (98, 1, 1, 2032, CAST(N'2032-02-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (99, 1, 1, 2032, CAST(N'2032-03-20' AS Date), 1008.3333333333331, NULL, NULL)
GO
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (100, 1, 1, 2032, CAST(N'2032-04-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (101, 1, 1, 2032, CAST(N'2032-05-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (102, 1, 1, 2032, CAST(N'2032-06-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (103, 1, 1, 2032, CAST(N'2032-07-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (104, 1, 1, 2032, CAST(N'2032-08-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (105, 1, 1, 2032, CAST(N'2032-09-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (106, 1, 1, 2032, CAST(N'2032-10-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (107, 1, 1, 2032, CAST(N'2032-11-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (108, 1, 1, 2032, CAST(N'2032-12-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (109, 1, 1, 2033, CAST(N'2033-01-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (110, 1, 1, 2033, CAST(N'2033-02-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (111, 1, 1, 2033, CAST(N'2033-03-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (112, 1, 1, 2033, CAST(N'2033-04-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (113, 1, 1, 2033, CAST(N'2033-05-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (114, 1, 1, 2033, CAST(N'2033-06-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (115, 1, 1, 2033, CAST(N'2033-07-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (116, 1, 1, 2033, CAST(N'2033-08-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (117, 1, 1, 2033, CAST(N'2033-09-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (118, 1, 1, 2033, CAST(N'2033-10-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (119, 1, 1, 2033, CAST(N'2033-11-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (120, 1, 1, 2033, CAST(N'2033-12-20' AS Date), 1008.3333333333331, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (1002, 2, 2, 2024, CAST(N'2024-01-21' AS Date), 2187.5, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (1003, 2, 2, 2024, CAST(N'2024-02-21' AS Date), 2187.5, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (1004, 2, 2, 2024, CAST(N'2024-03-21' AS Date), 2187.5, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (1005, 2, 2, 2024, CAST(N'2024-04-21' AS Date), 2187.5, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (1006, 2, 2, 2024, CAST(N'2024-05-21' AS Date), 2187.5, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (1007, 2, 2, 2024, CAST(N'2024-06-21' AS Date), 2187.5, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (1008, 2, 2, 2024, CAST(N'2024-07-21' AS Date), 2187.5, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (1009, 2, 2, 2024, CAST(N'2024-08-21' AS Date), 2187.5, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (1010, 2, 2, 2024, CAST(N'2024-09-21' AS Date), 2187.5, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (1011, 2, 2, 2024, CAST(N'2024-10-21' AS Date), 2187.5, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (1012, 2, 2, 2024, CAST(N'2024-11-21' AS Date), 2187.5, NULL, NULL)
INSERT [dbo].[tbl_Loan_Scheduler] ([Schedule_ID], [Loan_Application_id], [Customer_id], [Schedule_Year], [Schedule_Month], [AmountPerMonth], [PaidAmount], [PaidDate]) VALUES (1013, 2, 2, 2024, CAST(N'2024-12-21' AS Date), 2187.5, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Loan_Scheduler] OFF
SET IDENTITY_INSERT [dbo].[tbl_payment] ON 

INSERT [dbo].[tbl_payment] ([Payment_ID], [Payment_Amount], [payment_date], [loan_id], [Customer_id]) VALUES (1, 10000, CAST(N'2024-01-20 00:00:00.000' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[tbl_payment] OFF
SET IDENTITY_INSERT [dbo].[tbl_Source_Of_Income] ON 

INSERT [dbo].[tbl_Source_Of_Income] ([SOI_id], [SOI_Description]) VALUES (1, N'Private Job')
INSERT [dbo].[tbl_Source_Of_Income] ([SOI_id], [SOI_Description]) VALUES (2, N'Goverment Job')
INSERT [dbo].[tbl_Source_Of_Income] ([SOI_id], [SOI_Description]) VALUES (3, N'Own Bussniss')
SET IDENTITY_INSERT [dbo].[tbl_Source_Of_Income] OFF
SET IDENTITY_INSERT [dbo].[tbl_tenure] ON 

INSERT [dbo].[tbl_tenure] ([Tenure_ID], [Duration], [IsActive]) VALUES (1, N'1 Year', 1)
INSERT [dbo].[tbl_tenure] ([Tenure_ID], [Duration], [IsActive]) VALUES (2, N'2 Year', 1)
INSERT [dbo].[tbl_tenure] ([Tenure_ID], [Duration], [IsActive]) VALUES (3, N'3 Year', 1)
INSERT [dbo].[tbl_tenure] ([Tenure_ID], [Duration], [IsActive]) VALUES (4, N'4 Year', 1)
INSERT [dbo].[tbl_tenure] ([Tenure_ID], [Duration], [IsActive]) VALUES (5, N'5 Years', 1)
INSERT [dbo].[tbl_tenure] ([Tenure_ID], [Duration], [IsActive]) VALUES (6, N'6 Years', 1)
INSERT [dbo].[tbl_tenure] ([Tenure_ID], [Duration], [IsActive]) VALUES (7, N'7 Years', 1)
INSERT [dbo].[tbl_tenure] ([Tenure_ID], [Duration], [IsActive]) VALUES (8, N'8 Years', 1)
INSERT [dbo].[tbl_tenure] ([Tenure_ID], [Duration], [IsActive]) VALUES (9, N'9 Years', 1)
INSERT [dbo].[tbl_tenure] ([Tenure_ID], [Duration], [IsActive]) VALUES (10, N'10 Years', 1)
SET IDENTITY_INSERT [dbo].[tbl_tenure] OFF
SET IDENTITY_INSERT [dbo].[tbl_users] ON 

INSERT [dbo].[tbl_users] ([user_id], [user_name], [user_pwd], [role_Id], [IsActive], [Customer_ID]) VALUES (1, N'test@gmail.com', N'123', 2, 1, 1)
INSERT [dbo].[tbl_users] ([user_id], [user_name], [user_pwd], [role_Id], [IsActive], [Customer_ID]) VALUES (2, N'Admin', N'admin', 1, 1, NULL)
INSERT [dbo].[tbl_users] ([user_id], [user_name], [user_pwd], [role_Id], [IsActive], [Customer_ID]) VALUES (3, N'SAdmin', N'admin', 3, 1, NULL)
INSERT [dbo].[tbl_users] ([user_id], [user_name], [user_pwd], [role_Id], [IsActive], [Customer_ID]) VALUES (4, N'test@gmail.com', N'123', 2, 1, 1)
INSERT [dbo].[tbl_users] ([user_id], [user_name], [user_pwd], [role_Id], [IsActive], [Customer_ID]) VALUES (1002, N'Junaid@gmail.com', N'123', 2, 1, 2)
SET IDENTITY_INSERT [dbo].[tbl_users] OFF
/****** Object:  StoredProcedure [dbo].[CheckEmailAvailability]    Script Date: 1/23/2024 11:22:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckEmailAvailability]
      @Email NVARCHAR(50)
AS
BEGIN
      SET NOCOUNT ON;
      IF NOT EXISTS(SELECT Customer_id FROM tbl_customer
                    WHERE Customer_Email_address = @Email)
      BEGIN
            SELECT 'TRUE'
      END
      ELSE
      BEGIN
            SELECT 'FALSE'
      END
END

GO
USE [master]
GO
ALTER DATABASE [Proj_LoanApp_By_BlockChain] SET  READ_WRITE 
GO
