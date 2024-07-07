CREATE TABLE Report (
    reportID INT IDENTITY(1,1) PRIMARY KEY,
    userID INT NOT NULL,
    time DATETIME,
    title NVARCHAR(255) NOT NULL,
    isReaded BIT NOT NULL,
    isNewComment BIT NOT NULL,
    CONSTRAINT FK_UserID FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Report (userID, time, title, isReaded, isNewComment)
VALUES 
    (1, '2024-07-06 10:00:00', N'Report 1',  1, 0),
    (2, '2024-07-06 11:00:00', N'Report 2',  0, 1),
    (4, '2024-07-06 13:00:00', N'Report 4',  0, 0),
    (5, '2024-07-06 14:00:00', N'Report 5',  1, 1),
    (7, '2024-07-06 16:00:00', N'Report 7',  1, 0),
    (8, '2024-07-06 17:00:00', N'Report 8',  0, 1),
    (9, '2024-07-06 18:00:00', N'Report 9',  1, 0);

CREATE TABLE Comment (
    id INT IDENTITY(1,1) PRIMARY KEY,
    reportID INT NOT NULL,
    isReply BIT NOT NULL,
    content NVARCHAR(MAX) NOT NULL,
    time DATETIME,
    CONSTRAINT FK_ReportID FOREIGN KEY (reportID) REFERENCES Report(reportID)
);

INSERT INTO Comment (reportID, isReply, content, time)
VALUES 
    (1, 0, N'Đây là comment 1', '2024-07-06 10:00:00'),
    (1, 1, N'Đây là phản hồi cho comment 1', '2024-07-06 10:30:00'),
    (2, 0, N'Đây là comment 2', '2024-07-06 11:00:00'),
    (2, 0, N'Đây là comment 3', '2024-07-06 12:00:00'),
    (3, 1, N'Đây là phản hồi cho comment 3', '2024-07-06 13:00:00');

ALTER TABLE Report
ALTER COLUMN isNewComment BIT NULL;
