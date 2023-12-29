USE [DBstudent]
GO

/****** Object:  Table [dbo].[fees_structure_mst]    Script Date: 6/18/2019 12:47:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[fees_structure_mst](
	[fees_id] [int] IDENTITY(1,1) NOT NULL,
	[student_class] [nvarchar](50) NOT NULL,
	[parameter] [nvarchar](50) NOT NULL,
	[amount] [float] NOT NULL,
	[reg_date] [date] NOT NULL,
	[reg_status] [int] NOT NULL
) ON [PRIMARY]

GO


