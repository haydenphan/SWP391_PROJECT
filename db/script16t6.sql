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
	[UserID] [int] NULL,
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
	[UserID] [int] NULL,
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
	[IsGraded] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Duration] [int] NULL,
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

/****** Object:  Table [dbo].[Users]    Script Date: 6/16/2024 1:01:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[RoleID] [int] NULL,
	[RegistrationDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Avatar] [nvarchar](255) NULL,
	[Bio] [nvarchar](1000) NULL,
	[StoredSalt] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

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

SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Development')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Business')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'IT & Software')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'Design')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'Marketing')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseFeedback] ON 

INSERT [dbo].[CourseFeedback] ([FeedbackID], [CourseID], [StudentID], [FeedbackText], [Rating], [FeedbackDate]) VALUES (3, 3, 1, N'Great course! Covered all the basics I needed to know.', 5, CAST(N'2024-06-02T12:40:05.410' AS DateTime))
INSERT [dbo].[CourseFeedback] ([FeedbackID], [CourseID], [StudentID], [FeedbackText], [Rating], [FeedbackDate]) VALUES (4, 4, 4, N'The instructor was very clear and concise in explaining the concepts.', 4, CAST(N'2024-06-02T12:40:05.410' AS DateTime))
INSERT [dbo].[CourseFeedback] ([FeedbackID], [CourseID], [StudentID], [FeedbackText], [Rating], [FeedbackDate]) VALUES (5, 5, 1, N'The content was informative and well-structured.', 4, CAST(N'2024-06-02T12:40:05.410' AS DateTime))
INSERT [dbo].[CourseFeedback] ([FeedbackID], [CourseID], [StudentID], [FeedbackText], [Rating], [FeedbackDate]) VALUES (6, 5, 4, N'Enjoyed the practical exercises provided in the course.', 5, CAST(N'2024-06-02T12:40:05.410' AS DateTime))
INSERT [dbo].[CourseFeedback] ([FeedbackID], [CourseID], [StudentID], [FeedbackText], [Rating], [FeedbackDate]) VALUES (7, 4, 1, N'Good overview of digital marketing strategies.', 4, CAST(N'2024-06-02T12:40:05.410' AS DateTime))
INSERT [dbo].[CourseFeedback] ([FeedbackID], [CourseID], [StudentID], [FeedbackText], [Rating], [FeedbackDate]) VALUES (8, 3, 4, N'Would have liked more practical examples.', 3, CAST(N'2024-06-02T12:40:05.410' AS DateTime))
INSERT [dbo].[CourseFeedback] ([FeedbackID], [CourseID], [StudentID], [FeedbackText], [Rating], [FeedbackDate]) VALUES (9, 3, 1, N'very good', 3, CAST(N'2024-06-04T08:08:31.880' AS DateTime))
INSERT [dbo].[CourseFeedback] ([FeedbackID], [CourseID], [StudentID], [FeedbackText], [Rating], [FeedbackDate]) VALUES (10, 3, 2, N'bad course', 2, CAST(N'2024-06-04T09:26:07.757' AS DateTime))
INSERT [dbo].[CourseFeedback] ([FeedbackID], [CourseID], [StudentID], [FeedbackText], [Rating], [FeedbackDate]) VALUES (11, 3, 2, N'very very very bad', 1, CAST(N'2024-06-04T09:34:19.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[CourseFeedback] OFF
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
(1, N'Web Development Fundamentals', N'Learn the basics of web development including HTML, CSS, and JavaScript.', 2, GETDATE(), 1, 1, 1, 1, CAST(29.99 AS Decimal(10, 2)), N'https://example.com/web_dev.jpg', 120, GETDATE(), NULL, 0),
(2, N'Introduction to Data Science', N'An introductory course to data science covering basic concepts and tools like Python, pandas, and numpy.', 2, GETDATE(), 1, 3, 2, 1, CAST(49.99 AS Decimal(10, 2)), N'https://example.com/data_science.jpg', 150, GETDATE(), NULL, 0),
(3, N'Digital Marketing Essentials', N'Master the fundamentals of digital marketing, including SEO, social media marketing, and email marketing.', 2, GETDATE(), 1, 17, 1, 1, CAST(39.99 AS Decimal(10, 2)), N'https://example.com/digital_marketing.jpg', 500, GETDATE(), NULL, 0),
(4, N'Python Programming for Beginners', N'An introductory course to Python programming, covering basic concepts and syntax.', 3, GETDATE(), 1, 1, 1, 1, CAST(19.99 AS Decimal(10, 2)), N'https://example.com/python_beginners.jpg', 200, GETDATE(), NULL, 0),
(5, N'Mastering Excel', N'Learn advanced Excel techniques for data analysis and business reporting.', 4, GETDATE(), 1, 2, 2, 1, CAST(29.99 AS Decimal(10, 2)), N'https://example.com/mastering_excel.jpg', 250, GETDATE(), NULL, 0),
(6, N'Graphic Design Basics', N'Introduction to graphic design, including tools and basic design principles.', 3, GETDATE(), 1, 4, 1, 1, CAST(25.99 AS Decimal(10, 2)), N'https://example.com/graphic_design_basics.jpg', 300, GETDATE(), NULL, 0),
(7, N'Advanced SQL Techniques', N'Learn advanced SQL techniques for database management and analysis.', 5, GETDATE(), 1, 4, 3, 1, CAST(39.99 AS Decimal(10, 2)), N'https://example.com/advanced_sql.jpg', 180, GETDATE(), NULL, 0),
(8, N'SEO Strategies for 2024', N'Comprehensive guide to modern SEO strategies and best practices for 2024.', 2, GETDATE(), 1, 5, 2, 1, CAST(34.99 AS Decimal(10, 2)), N'https://example.com/seo_strategies_2024.jpg', 120, GETDATE(), NULL, 0),
(9, N'Java Programming Mastery', N'Deep dive into Java programming, covering advanced topics and best practices.', 4, GETDATE(), 1, 1, 3, 1, CAST(45.99 AS Decimal(10, 2)), N'https://example.com/java_programming.jpg', 220, GETDATE(), NULL, 0);

SET IDENTITY_INSERT [dbo].[Courses] OFF;

GO
SET IDENTITY_INSERT [dbo].[InstructorFeedback] ON 

INSERT [dbo].[InstructorFeedback] ([FeedbackID], [InstructorID], [LearnerID], [Comment], [Rating], [FeedbackDate]) VALUES (1, 1, 1, N'not bad', 4, CAST(N'2024-06-14T11:07:46.700' AS DateTime))
INSERT [dbo].[InstructorFeedback] ([FeedbackID], [InstructorID], [LearnerID], [Comment], [Rating], [FeedbackDate]) VALUES (2, 1, 1, N'qua te', 3, CAST(N'2024-06-14T12:42:14.227' AS DateTime))
INSERT [dbo].[InstructorFeedback] ([FeedbackID], [InstructorID], [LearnerID], [Comment], [Rating], [FeedbackDate]) VALUES (3, 1, 1, N'qua te', 3, CAST(N'2024-06-14T12:42:58.040' AS DateTime))
SET IDENTITY_INSERT [dbo].[InstructorFeedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Learner')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Instructor')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Subcategories] ON 

INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (1, 1, N'Web Development')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (2, 1, N'Mobile Development')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (3, 1, N'Game Development')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (4, 1, N'Database Development')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (5, 2, N'Entrepreneurship')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (6, 2, N'Communication')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (7, 2, N'Management')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (8, 2, N'Sales')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (9, 3, N'Network & Security')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (10, 3, N'Hardware')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (11, 3, N'Operating Systems')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (12, 3, N'IT Certification')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (13, 4, N'Graphic Design')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (14, 4, N'Web Design')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (15, 4, N'UI/UX Design')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (16, 4, N'3D Design')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (17, 5, N'Digital Marketing')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (18, 5, N'SEO')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (19, 5, N'Social Media Marketing')
INSERT [dbo].[Subcategories] ([SubcategoryID], [CategoryID], [SubcategoryName]) VALUES (20, 5, N'Content Marketing')
SET IDENTITY_INSERT [dbo].[Subcategories] OFF
GO
-- Insert required data into the Users table
SET IDENTITY_INSERT [dbo].[Users] ON;

INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [FirstName], [LastName], [Email], [RoleID], [RegistrationDate], [IsActive], [Avatar], [Bio], [StoredSalt]) 
VALUES 
(1, N'student1', N'password_hash_1', N'John', N'Doe', N'john@example.com', 1, GETDATE(), 1, NULL, NULL, NULL),
(2, N'lecturer1', N'password_hash_2', N'Jane', N'Smith', N'jane@example.com', 2, GETDATE(), 1, NULL, NULL, NULL),
(3, N'admin1', N'password_hash_3', N'Admin', N'User', N'admin@example.com', 3, GETDATE(), 1, NULL, NULL, NULL),
(4, N'student2', N'password_hash_4', N'Alice', N'Johnson', N'alice@example.com', 1, GETDATE(), 1, NULL, NULL, NULL),
(5, N'instructor2', N'password_hash_5', N'Robert', N'Brown', N'robert@example.com', 2, GETDATE(), 1, NULL, NULL, NULL);

SET IDENTITY_INSERT [dbo].[Users] OFF;

GO
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
ALTER TABLE [dbo].[Quizzes] ADD  DEFAULT ((0)) FOR [IsGraded]
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
ALTER TABLE [dbo].[CourseCertificates]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[CourseCertificates]  WITH CHECK ADD FOREIGN KEY([UserID])
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
ALTER TABLE [dbo].[LecturerCertificates]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
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
ALTER TABLE [dbo].[Quizzes]  WITH CHECK ADD  CONSTRAINT [FK_Quizzes_Sections] FOREIGN KEY([SectionID])
REFERENCES [dbo].[CourseSections] ([SectionID])
GO
ALTER TABLE [dbo].[Quizzes] CHECK CONSTRAINT [FK_Quizzes_Sections]
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

