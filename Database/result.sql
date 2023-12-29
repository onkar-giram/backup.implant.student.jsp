USE [DBstudent]
GO

/****** Object:  Table [dbo].[result]    Script Date: 6/18/2019 12:47:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[result](
	[result_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[class_test_id] [int] NOT NULL,
	[obtained_marks] [float] NOT NULL,
	[reg_date] [date] NOT NULL,
	[reg_status] [int] NOT NULL,
 CONSTRAINT [PK_result] PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


