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

INSERT INTO [dbo].[CourseLevels] ([LevelName]) VALUES
('Beginner'),
('Intermediate'),
('Expert');
GO

-- Insert data into CourseLanguages
INSERT INTO [dbo].[CourseLanguages] (LanguageName)
VALUES 
('English'), 
('Spanish'), 
('French');

-- Insert data into Courses
INSERT INTO [dbo].[Courses] (CourseName, Description, CreatedBy, CreatedDate, IsPublished, SubcategoryID, LevelID, LanguageID, Price, ImageURL, TotalEnrolled, LastUpdate, Requirements)
VALUES 
('Intro to Mobile App Development', 'Learn the basics of mobile app development.', 3, GETDATE(), 1, 1, 1, 1, 99.99, 'mobileapp.jpg', 200, GETDATE(), 'Basic programming knowledge'),
('Advanced Web Development', 'Master advanced web development skills.', 3, GETDATE(), 1, 2, 3, 1, 149.99, 'webdev.jpg', 180, GETDATE(), 'Intermediate web development knowledge'),
('Development Tools Overview', 'A comprehensive guide to development tools.', 3, GETDATE(), 1, 3, 1, 1, 59.99, 'devtools.jpg', 130, GETDATE(), 'No prerequisites'),
('Database Design Fundamentals', 'Learn the fundamentals of database design.', 3, GETDATE(), 1, 4, 1, 1, 79.99, 'database.jpg', 120, GETDATE(), 'Basic SQL knowledge'),
('Mastering Python Programming', 'Become an expert in Python programming.', 3, GETDATE(), 1, 5, 3, 1, 199.99, 'python.jpg', 210, GETDATE(), 'Intermediate programming knowledge'),
('Creative Web Design', 'Explore creative web design techniques.', 3, GETDATE(), 1, 6, 2, 1, 89.99, 'webdesign.jpg', 170, GETDATE(), 'Basic HTML and CSS knowledge'),
('Graphic Design Basics', 'Start your journey in graphic design.', 3, GETDATE(), 1, 7, 1, 1, 49.99, 'graphicdesign.jpg', 160, GETDATE(), 'No prerequisites'),
('Design Tools Mastery', 'Master the essential design tools.', 3, GETDATE(), 1, 8, 3, 1, 119.99, 'designtools.jpg', 140, GETDATE(), 'Basic design knowledge'),
('Effective Communication Skills', 'Enhance your communication skills.', 3, GETDATE(), 1, 9, 2, 1, 29.99, 'communications.jpg', 190, GETDATE(), 'No prerequisites'),
('Finance for Beginners', 'Understand the basics of finance.', 3, GETDATE(), 1, 10, 1, 1, 39.99, 'finance.jpg', 150, GETDATE(), 'No prerequisites'),
('Project Management Essentials', 'Learn the essentials of project management.', 3, GETDATE(), 1, 11, 2, 1, 69.99, 'management.jpg', 175, GETDATE(), 'Basic business knowledge'),
('Advanced Sales Techniques', 'Master advanced sales techniques.', 3, GETDATE(), 1, 12, 3, 1, 99.99, 'sales.jpg', 110, GETDATE(), 'Intermediate sales knowledge'),
('Nutrition and Health', 'Learn about nutrition and health.', 3, GETDATE(), 1, 13, 1, 1, 19.99, 'nutrition.jpg', 220, GETDATE(), 'No prerequisites'),
('Dieting Tips and Tricks', 'Get the best tips and tricks for dieting.', 3, GETDATE(), 1, 14, 2, 1, 29.99, 'dieting.jpg', 140, GETDATE(), 'Basic nutrition knowledge'),
('Data Science for Beginners', 'Introduction to data science.', 3, GETDATE(), 1, 6, 1, 1, 129.99, 'datascience.jpg', 190, GETDATE(), 'Basic programming knowledge'),
('Digital Marketing Essentials', 'Learn the fundamentals of digital marketing.', 3, GETDATE(), 1, 7, 2, 1, 59.99, 'digitalmarketing.jpg', 150, GETDATE(), 'Basic internet skills'),
('Photography for Beginners', 'Start your photography journey.', 3, GETDATE(), 1, 8, 1, 1, 49.99, 'photography.jpg', 160, GETDATE(), 'No prerequisites'),
('Advanced Photography Techniques', 'Master advanced photography techniques.', 3, GETDATE(), 1, 8, 3, 1, 119.99, 'advphotography.jpg', 140, GETDATE(), 'Basic photography knowledge'),
('Life Style Coaching', 'Learn how to be a life style coach.', 3, GETDATE(), 1, 11, 2, 1, 69.99, 'lifestyle.jpg', 175, GETDATE(), 'Basic coaching skills'),
('Health & Fitness Basics', 'Start your journey in health and fitness.', 3, GETDATE(), 1, 13, 1, 1, 19.99, 'healthfitness.jpg', 220, GETDATE(), 'No prerequisites');
GO