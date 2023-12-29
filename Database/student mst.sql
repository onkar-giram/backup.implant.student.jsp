USE [DBstudent]
GO

/****** Object:  Table [dbo].[student_mst]    Script Date: 6/18/2019 12:48:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[student_mst](
	[stud_id] [int] IDENTITY(1,1) NOT NULL,
	[stud_name] [nvarchar](20) NOT NULL,
	[mob_no] [nvarchar](15) NOT NULL,
	[mail_id] [nvarchar](25) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[reg_date] [date] NOT NULL,
	[reg_status] [int] NOT NULL,
 CONSTRAINT [PK_student_mst] PRIMARY KEY CLUSTERED 
(
	[stud_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


