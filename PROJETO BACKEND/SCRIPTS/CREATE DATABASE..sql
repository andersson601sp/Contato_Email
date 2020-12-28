USE [master]
GO

/****** Object:  Database [email]    Script Date: 26/12/2020 21:56:05 ******/
CREATE DATABASE [email]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'email', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\email.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'email_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\email_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [email].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [email] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [email] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [email] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [email] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [email] SET ARITHABORT OFF 
GO

ALTER DATABASE [email] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [email] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [email] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [email] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [email] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [email] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [email] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [email] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [email] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [email] SET  DISABLE_BROKER 
GO

ALTER DATABASE [email] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [email] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [email] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [email] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [email] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [email] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [email] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [email] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [email] SET  MULTI_USER 
GO

ALTER DATABASE [email] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [email] SET DB_CHAINING OFF 
GO

ALTER DATABASE [email] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [email] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [email] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [email] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [email] SET QUERY_STORE = OFF
GO

ALTER DATABASE [email] SET  READ_WRITE 
GO

