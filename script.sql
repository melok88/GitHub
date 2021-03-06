USE [master]
GO
/****** Object:  Database [StudentsDB]    Script Date: 06.03.2015 14:50:51 ******/
CREATE DATABASE [StudentsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StudentsDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StudentsDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StudentsDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentsDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StudentsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentsDB] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentsDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentsDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StudentsDB]
GO
/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 06.03.2015 14:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddStudent] as
begin
insert into student (Name, IDGroup) values ('Сидоров', 1)
end
GO
/****** Object:  Table [dbo].[groups]    Script Date: 06.03.2015 14:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[groups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Groups] [varchar](50) NULL,
 CONSTRAINT [PK_groups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student]    Script Date: 06.03.2015 14:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[IDGroup] [int] NOT NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[View_1]    Script Date: 06.03.2015 14:50:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        Name, IDGroup
FROM            dbo.student

GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_groups] FOREIGN KEY([IDGroup])
REFERENCES [dbo].[groups] ([ID])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_groups]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "student"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [StudentsDB] SET  READ_WRITE 
GO
