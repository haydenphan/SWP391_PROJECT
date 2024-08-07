USE [master]
GO
/****** Object:  Database [OnlineLearningV2]    Script Date: 6/16/2024 1:01:02 AM ******/
CREATE DATABASE [OnlineLearningV2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineLearningV2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OnlineLearningV2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineLearningV2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OnlineLearningV2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OnlineLearningV2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineLearningV2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineLearningV2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineLearningV2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineLearningV2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineLearningV2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineLearningV2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineLearningV2] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineLearningV2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineLearningV2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineLearningV2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineLearningV2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineLearningV2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineLearningV2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OnlineLearningV2] SET QUERY_STORE = ON
GO
ALTER DATABASE [OnlineLearningV2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OnlineLearningV2]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/16/2024 1:01:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseCertificates]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCertificates](
	[CertificateID] [int] IDENTITY(1,1) NOT NULL,
	[LearnerID] [int] NULL,
	[InstructorID] [int] NULL,
	[CourseId] [int] NULL,
	[CertificateURL] [nvarchar](255) NOT NULL,
	[UploadDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CertificateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseEnrollments]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseEnrollments](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[StudentID] [int] NULL,
	[EnrollmentDate] [datetime] NULL,
	[IsCompleted] BIT NOT NULL DEFAULT 0,
	[CompletionDate] DATETIME NULL,
PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseFeedback]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseFeedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[StudentID] [int] NULL,
	[FeedbackText] [nvarchar](1000) NULL,
	[Rating] [int] NULL,
	[FeedbackDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseLanguages]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseLanguages](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseLevels]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseLevels](
	[LevelID] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[IsPublished] [bit] NULL,
	[SubcategoryID] [int] NULL,
	[LevelID] [int] NULL,
	[LanguageID] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[ImageURL] [nvarchar](255) NULL,
	[TotalEnrolled] [int] NULL,
	[LastUpdate] [datetime] NULL,
	[Requirements] [nvarchar](1000) NULL,
	[isCancelled] [bit] DEFAULT 0,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseSections]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseSections](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[SectionDescription] [nvarchar](255) NULL,
	[CourseID] [int] NULL,
	[SectionName] [nvarchar](100) NOT NULL,
	[SectionOrder] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstructorFeedback]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructorFeedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[InstructorID] [int] NOT NULL,
	[LearnerID] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Rating] [int] NOT NULL,
	[FeedbackDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LectureExtraMaterials]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LectureExtraMaterials](
	[LectureExtraMaterialsId] [int] IDENTITY(1,1) NOT NULL,
	[LectureID] [int] NOT NULL,
	[MaterialUrl] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LectureExtraMaterialsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LecturerCertificates]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LecturerCertificates](
	[CertificateID] [int] IDENTITY(1,1) NOT NULL,
	[ApprovalID] [int] NOT NULL,
	[CertificateURL] [nvarchar](255) NOT NULL,
	[UploadDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CertificateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Lectures]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[LectureID] [int] IDENTITY(1,1) NOT NULL,
	[SectionID] [int] NULL,
	[LectureName] [nvarchar](100) NOT NULL,
	[LectureURL] [nvarchar](255) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[LectureDescription] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[LectureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizAnswers]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizAnswers](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NULL,
	[AnswerText] [nvarchar](1000) NULL,
	[IsCorrect] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizQuestions]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizQuestions](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[QuizID] [int] NULL,
	[QuestionText] [nvarchar](1000) NULL,
	[QuestionType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizSubmissionDetails]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizSubmissionDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuizSubmissionID] [int] NULL,
	[QuestionID] [int] NULL,
	[AnswerID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizSubmissions]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizSubmissions](
	[SubmissionID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[QuizID] [int] NULL,
	[SubmissionDate] [datetime] NULL,
	[TimeSpent] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quizzes]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quizzes](
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[QuizDescription] [nvarchar](255) NULL,
	[SectionID] [int] NULL,
	[QuizName] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[Duration] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Subcategories]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcategories](
	[SubcategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[SubcategoryName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubcategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TransactionDetails]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionDetails](
    [TransactionDetailsID] [int] IDENTITY(1,1) NOT NULL,
    [TransactionID] [int] NOT NULL,
    [CourseID] [int] NOT NULL,
    [Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED ([TransactionDetailsID] ASC),
FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transactions]([TransactionID]),
FOREIGN KEY ([CourseID]) REFERENCES [dbo].[Courses]([CourseID])
);
GO

CREATE TABLE [dbo].[Cart] (
    [CartID] INT IDENTITY(1,1) NOT NULL,
    [UserID] INT NOT NULL,
    [Total_Amount] DECIMAL(10, 2) NULL,
    PRIMARY KEY CLUSTERED ([CartID] ASC)
) ON [PRIMARY];
GO

-- Tạo bảng CartDetails
CREATE TABLE [dbo].[CartDetails] (
    [CartDetailsID] INT IDENTITY(1,1) NOT NULL,
    [CartID] INT NOT NULL,
    [CourseID] INT NOT NULL,
    [Price] DECIMAL(10, 2) NULL,
    PRIMARY KEY CLUSTERED ([CartDetailsID] ASC)
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[Providers] (
    [ProviderID] [int] IDENTITY(1,1) NOT NULL,
    [ProviderName] [nvarchar](50) NOT NULL,
    PRIMARY KEY CLUSTERED ([ProviderID] ASC)
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](255) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NOT NULL,
	[RoleID] [int] NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[IsActive] [bit] NULL,
	[Avatar] [nvarchar](255) NULL,
	[Bio] [nvarchar](1000) NULL,
	[StoredSalt] [varbinary](max) NULL,
    ProviderID [int] NULL, 
	[WalletID] [INT] NULL,
	foreign key (ProviderID) references Providers(ProviderID),
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE InstructorApprovals (
	ApprovalID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    IsApproved BIT DEFAULT 0,
    RequestDate DATETIME DEFAULT GETDATE(),
    ApprovalDate DATETIME NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

/****** Object:  Table [dbo].[SectionComments]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionComments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[SectionID] [int] NULL,
	[UserID] [int] NULL,
	[CommentText] [nvarchar](1000) NOT NULL,
	[ParentCommentID] [int] NULL,
	[CommentDate] [datetime] NULL,
	[RepliedToUserID] [int] NULL,
	foreign key (RepliedToUserID) references Users(UserID),
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE CommentLikes (
    LikeID INT PRIMARY KEY IDENTITY(1,1),
    CommentID INT NOT NULL,
    UserID INT NOT NULL,
    FOREIGN KEY (CommentID) REFERENCES SectionComments(CommentID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO

CREATE TABLE Wallet (
    WalletID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Balance DECIMAL(10, 2) DEFAULT 0.00,
);
GO

CREATE TABLE Bank_Account (
    AccountID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    UserID INT NOT NULL,
    Account_Number VARCHAR(20) NOT NULL UNIQUE,
    Bank_Name VARCHAR(50) NOT NULL,
    Amount DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO

CREATE TABLE [dbo].[LectureProgress](
	[ProgressID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LectureID] [int] NOT NULL,
	[WatchedPercentage] INT CHECK ([WatchedPercentage] BETWEEN 0 AND 100),
	FOREIGN KEY ([UserID]) REFERENCES Users([UserID]),
    FOREIGN KEY ([LectureID]) REFERENCES Lectures([LectureID]),
PRIMARY KEY CLUSTERED 
(
	[ProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

create table Notifications(
	Id int primary key identity(1,1),
	UserId int foreign key references Users(UserID),
	Message nvarchar(max) not null,
	Type nvarchar(max) not null,
	TimeStamp datetime not null,
	Target nvarchar(100) null,
	TargetId int null,
	IsRead bit not null
)

/****** Object:  Table [dbo].[Report]    Script Date: 7/17/2024 9:20:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Report](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Time] [datetime] NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](255) NOT NULL,
	[IsReaded] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[reportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_UserID] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([UserID])
GO

ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_UserID]
GO

-- Insert default providers
INSERT INTO [dbo].[Providers] (ProviderName) VALUES ('Local'), ('Google')

SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Development')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Business')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Data Science')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'Marketing')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'Life Styles')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (6, N'Photography')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (7, N'Art & Design')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (8, N'Health & Fitness')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (9, N'Music')

SET IDENTITY_INSERT [dbo].[Categories] OFF

GO
SET IDENTITY_INSERT [dbo].[CourseLanguages] ON 

INSERT [dbo].[CourseLanguages] ([LanguageID], [LanguageName]) VALUES (1, N'English')
INSERT [dbo].[CourseLanguages] ([LanguageID], [LanguageName]) VALUES (2, N'Spanish')
INSERT [dbo].[CourseLanguages] ([LanguageID], [LanguageName]) VALUES (3, N'French')
INSERT [dbo].[CourseLanguages] ([LanguageID], [LanguageName]) VALUES (4, N'German')
SET IDENTITY_INSERT [dbo].[CourseLanguages] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseLevels] ON 

INSERT [dbo].[CourseLevels] ([LevelID], [LevelName]) VALUES (1, N'Beginner')
INSERT [dbo].[CourseLevels] ([LevelID], [LevelName]) VALUES (2, N'Intermediate')
INSERT [dbo].[CourseLevels] ([LevelID], [LevelName]) VALUES (3, N'Advanced')
SET IDENTITY_INSERT [dbo].[CourseLevels] OFF
GO

-- Insert required data into the Courses table
SET IDENTITY_INSERT [dbo].[Courses] ON;

INSERT INTO [dbo].[Courses] 
([CourseID], [CourseName], [Description], [CreatedBy], [CreatedDate], [IsPublished], [SubcategoryID], [LevelID], [LanguageID], [Price], [ImageURL], [TotalEnrolled], [LastUpdate], [Requirements], [isCancelled]) 
VALUES 
(1, N'Introduction to Machine Learning', N'This comprehensive course covers the basics of machine learning, including supervised and unsupervised learning. You will learn how to implement various machine learning algorithms using Python, with a strong emphasis on practical applications. Topics include data preprocessing, model training, and evaluation, as well as real-world case studies to demonstrate the effectiveness of machine learning techniques.', 2, GETDATE(), 1, 3, 2, 1, CAST(59.99 AS Decimal(10, 2)), N'https://res.cloudinary.com/dieoz2rgk/image/upload/v1721542914/o5gbhgrtmflpaumlf24x.jpg', 120, GETDATE(), N'Basic knowledge of Python and statistics.', 0),
(2, N'Graphic Design Masterclass', N'Learn the essentials of graphic design in this extensive course. Topics covered include typography, color theory, and layout design. You will gain hands-on experience using Adobe Photoshop and Illustrator to create stunning visual content. The course also covers advanced design techniques and best practices for digital and print media, ensuring you have a well-rounded skill set for any graphic design project.', 2, GETDATE(), 1, 13, 1, 1, CAST(49.99 AS Decimal(10, 2)), N'https://res.cloudinary.com/dieoz2rgk/image/upload/v1721543114/nsg2didzwtjc2fsix3ws.jpg', 250, GETDATE(), N'No prior experience required.', 0),
(3, N'Advanced Python Programming', N'This advanced course takes you deep into Python programming. You will explore complex concepts such as decorators, generators, context managers, and more. Through practical exercises and real-world examples, you will learn how to write more efficient and elegant code, and how to apply these advanced techniques to solve complex programming challenges.', 2, GETDATE(), 1, 1, 3, 1, CAST(39.99 AS Decimal(10, 2)), N'https://res.cloudinary.com/dieoz2rgk/image/upload/v1721543257/owkf84oeqgolqfrinqnd.png', 500, GETDATE(), N'Basic knowledge of Python.', 0),
(4, N'Digital Marketing Strategy', N'Master the art of digital marketing strategy in this comprehensive course. Learn about SEO, SEM, content marketing, and social media advertising. The course also covers analytics and data-driven decision-making, helping you to develop effective marketing strategies that drive results. Case studies and practical exercises will provide you with the skills needed to excel in the digital marketing field.', 2, GETDATE(), 1, 17, 2, 1, CAST(89.99 AS Decimal(10, 2)), N'https://res.cloudinary.com/dieoz2rgk/image/upload/v1721543371/gawj7hyxl5rtia11skfx.jpg', 200, GETDATE(), N'No prior experience required', 0),
(5, N'JavaScript for Beginners', N'An introductory course on JavaScript designed for complete beginners. This course covers fundamental concepts and practical applications for web development. You will learn about variables, data types, functions, and control structures, as well as DOM manipulation and event handling. By the end of the course, you will be able to build interactive web pages and understand the basics of JavaScript programming.', 2, GETDATE(), 1, 1, 1, 1, CAST(29.99 AS Decimal(10, 2)), N'https://res.cloudinary.com/dieoz2rgk/image/upload/v1721543503/p6ru8r9rx18lmpleodgq.jpg', 200, GETDATE(), N'Basic knowledge of HTML and CSS.', 0),
(6, N'Project Management Professional (PMP) Exam Prep', N'Prepare for the PMP certification exam with this in-depth course. You will learn about project management processes and knowledge areas, as well as best practices for managing projects effectively. The course includes practice exams and tips for passing the PMP exam, ensuring you are fully prepared to achieve your certification and advance your career in project management.', 2, GETDATE(), 1, 7, 2, 1, CAST(99.99 AS Decimal(10, 2)), N'https://res.cloudinary.com/dieoz2rgk/image/upload/v1721543646/hghjonazdb88sjrdudtc.jpg', 80, GETDATE(), N'Experience in project management.', 0),
(7, N'Cybersecurity Fundamentals', N'Learn the basics of cybersecurity in this introductory course. Topics include threat analysis, risk management, and security best practices. You will gain an understanding of common cyber threats and how to protect against them. The course also covers network security, encryption, and incident response, providing a solid foundation for a career in cybersecurity.', 1, GETDATE(), 1, 9, 1, 1, CAST(45.99 AS Decimal(10, 2)), N'https://res.cloudinary.com/dieoz2rgk/image/upload/v1721543784/fgqh8ddp9ztqrfazm0jx.png', 220, GETDATE(), N'No prior experience required.', 0),
(8, N'Full Stack Web Development', N'Become a full stack web developer by learning both front-end and back-end technologies. This course covers HTML, CSS, JavaScript, Node.js, Express, and MongoDB. You will learn how to build complete web applications from scratch, including how to design user interfaces, implement server-side logic, and manage databases. The course includes hands-on projects to help you apply your skills and build a portfolio.', 1, GETDATE(), 1, 1, 3, 1, CAST(79.99 AS Decimal(10, 2)), N'https://res.cloudinary.com/dieoz2rgk/image/upload/v1721543956/htscitjaaypruirmefi0.jpg', 220, GETDATE(), N'Basic knowledge of programming.', 0),
(9, N'Data Analysis with Excel', N'Learn how to perform data analysis using Microsoft Excel in this practical course. Topics include pivot tables, VLOOKUP, and data visualization. You will learn how to manipulate and analyze data, create charts and graphs, and use advanced Excel functions to gain insights from data. The course also covers best practices for data management and reporting.', 1, GETDATE(), 1, 3, 1, 1, CAST(34.99 AS Decimal(10, 2)), N'https://res.cloudinary.com/dieoz2rgk/image/upload/v1721544127/tpdbx3bbr1ujfnu7wgqg.jpg', 150, GETDATE(), N'Basic knowledge of Excel.', 0),
(10, N'Artificial Intelligence for Business', N'Explore how AI can be applied in business scenarios to enhance decision-making and operational efficiency. This course covers AI technologies such as machine learning, natural language processing, and computer vision. You will learn how to use AI tools and techniques to solve business problems, improve customer experiences, and drive innovation. Case studies and real-world examples will help you understand the practical applications of AI in business.', 1, GETDATE(), 1, 2, 2, 1, CAST(88.99 AS Decimal(10, 2)), N'https://res.cloudinary.com/dieoz2rgk/image/upload/v1721544289/iceipmgt367qoofo16qv.png', 100, GETDATE(), N'Basic knowledge of AI and business concepts.', 0);

SET IDENTITY_INSERT [dbo].[Courses] OFF;

GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Learner')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Instructor')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Subcategories] ON 

INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (1, 1, N'Web Development');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (2, 1, N'Mobile Development');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (3, 1, N'Game Development');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (4, 1, N'Database Development');

INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (5, 2, N'Entrepreneurship');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (6, 2, N'Communication');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (7, 2, N'Management');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (8, 2, N'Sales');

INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (9, 3, N'Network & Security');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (10, 3, N'Hardware');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (11, 3, N'Operating Systems');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (12, 3, N'IT Certification');

INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (13, 4, N'Digital Marketing');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (14, 4, N'SEO');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (15, 4, N'Social Media Marketing');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (16, 4, N'Content Marketing');

INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (17, 7, N'Graphic Design');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (18, 7, N'Web Design');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (19, 7, N'UI/UX Design');
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (20, 7, N'3D Design');
SET IDENTITY_INSERT [dbo].[Subcategories] OFF
GO

-- Insert required data into the Wallet table
SET IDENTITY_INSERT [dbo].[Wallet] ON;

INSERT [dbo].[Wallet] ([WalletID], [Balance]) 
VALUES 
(1, 0),
(2, 0);

SET IDENTITY_INSERT [dbo].[Wallet] OFF;

-- Insert required data into the Users table
SET IDENTITY_INSERT [dbo].[Users] ON;

INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [FirstName], [LastName], [Email], [RoleID], [RegistrationDate], [IsActive], [Avatar], [Bio], [StoredSalt], [ProviderID], [WalletID]) 
VALUES 
(1, N'instructor1', N'2471e8a64a8791951486d2af7aa88baeb09345269c4266dd9e1221b684eb7d64', N'Jason', N'Kim', N'john@example.com', 2, GETDATE(), 1, N'https://res.cloudinary.com/dieoz2rgk/image/upload/v1721541875/srqny4f8ildadvwhg1p9.jpg', N'No bio yet', CONVERT(varbinary(max), N'0x8DC22B9BE7B19226B0CF952B035C3A33', 1), 
    (SELECT [ProviderID] FROM [dbo].[Providers] WHERE [ProviderName] = 'Local'), 1),
(2, N'instructor2', N'ab10b6c2c3ea1cf63f59fb1c5a6e8dfa9cd9b8e1c444c12a342211e06ee2aad9', N'Jane', N'Smith', N'jane@example.com', 2, GETDATE(), 1, N'https://res.cloudinary.com/dieoz2rgk/image/upload/v1721541874/wmybx861sxx9z70okgof.png', N'No bio yet', CONVERT(varbinary(max), N'0xB9ACAF3FD8CA55F63EBB7949E40ED6BD', 1), 
    (SELECT [ProviderID] FROM [dbo].[Providers] WHERE [ProviderName] = 'Local'), 2);

SET IDENTITY_INSERT [dbo].[Users] OFF;

SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4B91A9943]    Script Date: 6/16/2024 1:01:03 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D105345C41B04A]    Script Date: 6/16/2024 1:01:03 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CourseCertificates] ADD  DEFAULT (getdate()) FOR [UploadDate]
GO
ALTER TABLE [dbo].[CourseEnrollments] ADD  DEFAULT (getdate()) FOR [EnrollmentDate]
GO
ALTER TABLE [dbo].[CourseFeedback] ADD  DEFAULT (getdate()) FOR [FeedbackDate]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [IsPublished]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [TotalEnrolled]
GO
ALTER TABLE [dbo].[CourseSections] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[LecturerCertificates] ADD  DEFAULT (getdate()) FOR [UploadDate]
GO
ALTER TABLE [dbo].[Lectures] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[QuizAnswers] ADD  DEFAULT ((0)) FOR [IsCorrect]
GO
ALTER TABLE [dbo].[QuizSubmissions] ADD  DEFAULT (getdate()) FOR [SubmissionDate]
GO
ALTER TABLE [dbo].[Quizzes] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SectionComments] ADD  DEFAULT (getdate()) FOR [CommentDate]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (getdate()) FOR [TransactionDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([WalletID])
REFERENCES [dbo].[Wallet] ([WalletID])
GO
ALTER TABLE [dbo].[CourseCertificates]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[CourseCertificates]  WITH CHECK ADD FOREIGN KEY([LearnerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[CourseCertificates]  WITH CHECK ADD FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[CourseEnrollments]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[CourseEnrollments]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[CourseFeedback]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[CourseFeedback]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_CourseLanguages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[CourseLanguages] ([LanguageID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_CourseLanguages]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_CourseLevels] FOREIGN KEY([LevelID])
REFERENCES [dbo].[CourseLevels] ([LevelID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_CourseLevels]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Subcategories] FOREIGN KEY([SubcategoryID])
REFERENCES [dbo].[Subcategories] ([SubcategoryID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Subcategories]
GO
ALTER TABLE [dbo].[CourseSections]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[InstructorFeedback]  WITH CHECK ADD  CONSTRAINT [FK_Instructor] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[InstructorFeedback] CHECK CONSTRAINT [FK_Instructor]
GO
ALTER TABLE [dbo].[InstructorFeedback]  WITH CHECK ADD  CONSTRAINT [FK_Learner] FOREIGN KEY([LearnerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[InstructorFeedback] CHECK CONSTRAINT [FK_Learner]
GO
ALTER TABLE [dbo].[LectureExtraMaterials]  WITH CHECK ADD FOREIGN KEY([LectureID])
REFERENCES [dbo].[Lectures] ([LectureID])
GO
ALTER TABLE [dbo].[LecturerCertificates]  WITH CHECK ADD FOREIGN KEY([ApprovalID])
REFERENCES [dbo].[InstructorApprovals] ([ApprovalID])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([SectionID])
REFERENCES [dbo].[CourseSections] ([SectionID])
GO
ALTER TABLE [dbo].[QuizAnswers]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuizQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[QuizQuestions]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quizzes] ([QuizID])
GO
ALTER TABLE [dbo].[QuizSubmissionDetails]  WITH CHECK ADD FOREIGN KEY([AnswerID])
REFERENCES [dbo].[QuizAnswers] ([AnswerID])
GO
ALTER TABLE [dbo].[QuizSubmissionDetails]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuizQuestions] ([QuestionID])
GO
ALTER TABLE [dbo].[QuizSubmissionDetails]  WITH CHECK ADD FOREIGN KEY([QuizSubmissionID])
REFERENCES [dbo].[QuizSubmissions] ([SubmissionID])
GO
ALTER TABLE [dbo].[QuizSubmissions]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quizzes] ([QuizID])
GO
ALTER TABLE [dbo].[QuizSubmissions]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Quizzes]  WITH CHECK ADD FOREIGN KEY([SectionID])
REFERENCES [dbo].[CourseSections] ([SectionID])
GO
ALTER TABLE [dbo].[SectionComments]  WITH CHECK ADD FOREIGN KEY([ParentCommentID])
REFERENCES [dbo].[SectionComments] ([CommentID])
GO
ALTER TABLE [dbo].[SectionComments]  WITH CHECK ADD FOREIGN KEY([SectionID])
REFERENCES [dbo].[CourseSections] ([SectionID])
GO
ALTER TABLE [dbo].[SectionComments]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Subcategories]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Cart] 
ADD CONSTRAINT FK_Cart_UserID FOREIGN KEY (UserID) REFERENCES [dbo].[Users] (UserID);
GO
ALTER TABLE [dbo].[CartDetails] 
ADD CONSTRAINT FK_CartDetails_CartID FOREIGN KEY (CartID) REFERENCES [dbo].[Cart] (CartID);
GO
ALTER TABLE [dbo].[CartDetails] 
ADD CONSTRAINT FK_CartDetails_CourseID FOREIGN KEY (CourseID) REFERENCES [dbo].[Courses] (CourseID)
GO

-- Add CHECK constraint to ensure ProviderName only accepts specific values
ALTER TABLE [dbo].[Providers]
ADD CONSTRAINT CHK_Providers_ProviderName CHECK ([ProviderName] IN ('Local', 'Google'))
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[CourseFeedback]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO

ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD CHECK  (([Status]='Failed' OR [Status]='Completed' OR [Status]='Pending'))
GO
USE [master]
GO
ALTER DATABASE [OnlineLearningV2] SET  READ_WRITE 
GO

