USE [DBstudent]
GO

/****** Object:  Table [dbo].[class_test_mst]    Script Date: 6/18/2019 12:46:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[class_test_mst](
	[class_test_id] [int] IDENTITY(1,1) NOT NULL,
	[student_class] [nvarchar](50) NOT NULL,
	[test_name] [nvarchar](50) NOT NULL,
	[subject] [nvarchar](50) NOT NULL,
	[marks] [float] NOT NULL,
	[date] [date] NOT NULL,
	[start_time] [time](7) NOT NULL,
	[endtime] [time](7) NOT NULL,
	[reg_date] [date] NOT NULL,
	[reg_status] [int] NOT NULL
) ON [PRIMARY]

GO


