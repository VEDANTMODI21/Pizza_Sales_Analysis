USE [PIZZA_DB]
GO

/****** Object:  Table [dbo].[pizza_sales]    Script Date: 23-12-2025 15:29:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[pizza_sales](
	[pizza_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[pizza_name_id] [varchar](50) NOT NULL,
	[quantity] [tinyint] NOT NULL,
	[order_date] [date] NOT NULL,
	[order_time] [time](7) NOT NULL,
	[unit_price] [float] NOT NULL,
	[total_price] [float] NOT NULL,
	[pizza_size] [varchar](50) NOT NULL,
	[pizza_category] [varchar](50) NOT NULL,
	[pizza_ingredients] [varchar](200) NOT NULL,
	[pizza_name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO


