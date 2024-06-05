INSERT INTO [dbo].[Categories] ([CategoryName]) VALUES
('Development'),
('Art & Design'),
('Business'),
('Life Style'),
('Health & Fitness'),
('Data Science'),
('Marketing'),
('Photography');
GO

INSERT INTO [dbo].[Subcategories] ([SubcategoryName], [CategoryID]) VALUES
('Mobile App', 1),
('Web Development', 1),
('Development Tools', 1),
('Database', 1),
('Programming Language', 1),
('Web Design', 2),
('Graphic Design', 2),
('Design Tools', 2),
('Communications', 3),
('Finance', 3),
('Management', 3),
('Sales', 3),
('Nutrition', 5),
('Dieting', 5);
GO

INSERT INTO [dbo].[Levels] ([LevelName]) VALUES
('Beginner'),
('Intermediate'),
('Expert');
GO

INSERT INTO [dbo].[Courses] (
    [CourseName],
    [Description],
    [CreatedBy],
    [CreatedDate],
    [IsPublished],
    [SubcategoryID],
    [TotalEnrolled],
    [LastUpdate],
    [Requirements],
    [LevelID],
    [Price],
    [Language],
    [Duration],
    [BackgroundImage],
    [Curriculum]
) VALUES
('Introduction to Mobile App Development', 'Learn the basics of mobile app development using Java and Kotlin.', 3, '2023-01-01', 1, 1, 200, '2023-05-01', 'Basic knowledge of programming', 1, 0.00, 'English', 30, 'path/to/image1.jpg', 'Curriculum details...'),
('Advanced Web Development', 'Master advanced web development techniques with React and Node.js.', 3, '2023-02-15', 1, 2, 150, '2023-05-10', 'Intermediate knowledge of web development', 2, 50.00, 'English', 45, 'path/to/image2.jpg', 'Curriculum details...'),
('Database Design and Management', 'Comprehensive guide to designing and managing databases.', 3, '2023-03-01', 1, 4, 300, '2023-05-15', 'Basic understanding of databases', 1, 30.00, 'English', 40, 'path/to/image3.jpg', 'Curriculum details...'),
('Graphic Design for Beginners', 'Learn graphic design fundamentals and tools.', 3, '2023-01-10', 1, 7, 100, '2023-04-20', 'No prior knowledge required', 1, 20.00, 'English', 20, 'path/to/image4.jpg', 'Curriculum details...'),
('Financial Management 101', 'Introduction to financial management principles and practices.', 3, '2023-03-05', 1, 10, 80, '2023-05-18', 'Basic understanding of finance', 1, 40.00, 'English', 35, 'path/to/image5.jpg', 'Curriculum details...'),
('Nutrition and Diet Planning', 'Learn how to create balanced and healthy diet plans.', 3, '2023-02-20', 1, 13, 120, '2023-05-20', 'Interest in health and nutrition', 2, 25.00, 'English', 25, 'path/to/image6.jpg', 'Curriculum details...'),
('Yoga for Beginners', 'A complete guide to starting yoga practice for beginners.', 3, '2023-01-25', 1, 14, 250, '2023-05-22', 'No prior experience required', 1, 0.00, 'English', 15, 'path/to/image7.jpg', 'Curriculum details...')
GO

