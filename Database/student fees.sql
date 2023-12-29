USE [DBstudent]
GO

/****** Object:  Table [dbo].[student_fees]    Script Date: 6/18/2019 12:48:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[student_fees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[class_name] [nvarchar](50) NOT NULL,
	[annual_yr] [nvarchar](50) NOT NULL,
	[amount] [float] NOT NULL,
	[reg_date] [date] NOT NULL,
	[reg_status] [int] NOT NULL
) ON [PRIMARY]

GO


