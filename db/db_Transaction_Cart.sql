-------------TRANSACTION-------------
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

CREATE TABLE [dbo].[TransactionDetails](
    [TransactionDetailsID] [int] IDENTITY(1,1) NOT NULL,
    [TransactionID] [int] NOT NULL,
    [CourseID] [int] NOT NULL,
    [Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED ([TransactionDetailsID] ASC),
FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[Transactions]([TransactionID]),
FOREIGN KEY ([CourseID]) REFERENCES [dbo].[Courses]([CourseID])
);

SELECT * FROM [dbo].[Transactions] 
SELECT * FROM [dbo].[TransactionDetails] 


--------------------CART------------------

CREATE TABLE [dbo].[Cart] (
    [CartID] INT IDENTITY(1,1) NOT NULL,
    [UserID] INT NOT NULL,
    [Total_Amount] DECIMAL(10, 2) NULL,
    PRIMARY KEY CLUSTERED ([CartID] ASC)
) ON [PRIMARY];

-- Thêm khóa ngoại cho bảng Cart
ALTER TABLE [dbo].[Cart] 
ADD CONSTRAINT FK_Cart_UserID FOREIGN KEY (UserID) REFERENCES [dbo].[Users] (UserID);

-- Tạo bảng CartDetails
CREATE TABLE [dbo].[CartDetails] (
    [CartDetailsID] INT IDENTITY(1,1) NOT NULL,
    [CartID] INT NOT NULL,
    [CourseID] INT NOT NULL,
    [Price] DECIMAL(10, 2) NULL,
    PRIMARY KEY CLUSTERED ([CartDetailsID] ASC)
) ON [PRIMARY];

-- Thêm khóa ngoại cho bảng CartDetails
ALTER TABLE [dbo].[CartDetails] 
ADD CONSTRAINT FK_CartDetails_CartID FOREIGN KEY (CartID) REFERENCES [dbo].[Cart] (CartID);

ALTER TABLE [dbo].[CartDetails] 
ADD CONSTRAINT FK_CartDetails_CourseID FOREIGN KEY (CourseID) REFERENCES [dbo].[Courses] (CourseID)


select * from Cart
select * from CartDetails
