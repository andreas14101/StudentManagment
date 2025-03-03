IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303084614_initial-schema'
)
BEGIN
    CREATE TABLE [Courses] (
        [Id] uniqueidentifier NOT NULL,
        [Title] nvarchar(max) NOT NULL,
        [Credits] int NOT NULL,
        CONSTRAINT [PK_Courses] PRIMARY KEY ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303084614_initial-schema'
)
BEGIN
    CREATE TABLE [Students] (
        [Id] uniqueidentifier NOT NULL,
        [FirstName] nvarchar(max) NOT NULL,
        [LastName] nvarchar(max) NOT NULL,
        [Email] nvarchar(max) NOT NULL,
        [EnrollmentDate] datetime2 NOT NULL,
        CONSTRAINT [PK_Students] PRIMARY KEY ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303084614_initial-schema'
)
BEGIN
    CREATE TABLE [Enrollments] (
        [Id] uniqueidentifier NOT NULL,
        [StudentId] uniqueidentifier NOT NULL,
        [CourseId] uniqueidentifier NOT NULL,
        [Grade] int NULL,
        CONSTRAINT [PK_Enrollments] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Enrollments_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Enrollments_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303084614_initial-schema'
)
BEGIN
    CREATE INDEX [IX_Enrollments_CourseId] ON [Enrollments] ([CourseId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303084614_initial-schema'
)
BEGIN
    CREATE INDEX [IX_Enrollments_StudentId] ON [Enrollments] ([StudentId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303084614_initial-schema'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250303084614_initial-schema', N'9.0.2');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303085255_student-middle-name'
)
BEGIN
    ALTER TABLE [Students] ADD [MiddleName] nvarchar(max) NULL;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303085255_student-middle-name'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250303085255_student-middle-name', N'9.0.2');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303092010_student-date-of-birth'
)
BEGIN
    ALTER TABLE [Students] ADD [DateOfBirth] date NULL;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303092010_student-date-of-birth'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250303092010_student-date-of-birth', N'9.0.2');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303092745_instructor'
)
BEGIN
    ALTER TABLE [Courses] DROP CONSTRAINT [FK_Courses_Instructors_InstructorId];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303092745_instructor'
)
BEGIN
    DECLARE @var sysname;
    SELECT @var = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Courses]') AND [c].[name] = N'InstructorId');
    IF @var IS NOT NULL EXEC(N'ALTER TABLE [Courses] DROP CONSTRAINT [' + @var + '];');
    ALTER TABLE [Courses] ALTER COLUMN [InstructorId] uniqueidentifier NULL;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303092745_instructor'
)
BEGIN
    ALTER TABLE [Courses] ADD CONSTRAINT [FK_Courses_Instructors_InstructorId] FOREIGN KEY ([InstructorId]) REFERENCES [Instructors] ([Id]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303092745_instructor'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250303092745_instructor', N'9.0.2');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303093601_rename-grade-to-finalgrade'
)
BEGIN
    CREATE TABLE [Enrollment_v1_1] (
        [Id] uniqueidentifier NOT NULL,
        [StudentId] uniqueidentifier NOT NULL,
        [CourseId] uniqueidentifier NOT NULL,
        [FinalGrade] int NULL,
        CONSTRAINT [PK_Enrollment_v1_1] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Enrollment_v1_1_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Enrollment_v1_1_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303093601_rename-grade-to-finalgrade'
)
BEGIN
    CREATE INDEX [IX_Enrollment_v1_1_CourseId] ON [Enrollment_v1_1] ([CourseId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303093601_rename-grade-to-finalgrade'
)
BEGIN
    CREATE INDEX [IX_Enrollment_v1_1_StudentId] ON [Enrollment_v1_1] ([StudentId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303093601_rename-grade-to-finalgrade'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250303093601_rename-grade-to-finalgrade', N'9.0.2');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303103810_department'
)
BEGIN
    CREATE TABLE [Departoments] (
        [Id] uniqueidentifier NOT NULL,
        [Name] nvarchar(max) NOT NULL,
        [Dudget] float NOT NULL,
        [StartDate] date NOT NULL,
        [DepartmentHeadId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_Departoments] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Departoments_Instructors_DepartmentHeadId] FOREIGN KEY ([DepartmentHeadId]) REFERENCES [Instructors] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303103810_department'
)
BEGIN
    CREATE INDEX [IX_Departoments_DepartmentHeadId] ON [Departoments] ([DepartmentHeadId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303103810_department'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250303103810_department', N'9.0.2');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    ALTER TABLE [Courses] DROP CONSTRAINT [FK_Courses_Instructors_InstructorId];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    ALTER TABLE [Enrollment_v1_1] DROP CONSTRAINT [FK_Enrollment_v1_1_Courses_CourseId];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    ALTER TABLE [Enrollment_v1_1] DROP CONSTRAINT [FK_Enrollment_v1_1_Students_StudentId];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    ALTER TABLE [Enrollments] DROP CONSTRAINT [FK_Enrollments_Courses_CourseId];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    ALTER TABLE [Enrollment_v1_1] DROP CONSTRAINT [PK_Enrollment_v1_1];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    ALTER TABLE [Courses] DROP CONSTRAINT [PK_Courses];
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    EXEC sp_rename N'[Enrollment_v1_1]', N'Enrollments_v1_1', 'OBJECT';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    EXEC sp_rename N'[Courses]', N'Course', 'OBJECT';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    EXEC sp_rename N'[Enrollments_v1_1].[IX_Enrollment_v1_1_StudentId]', N'IX_Enrollments_v1_1_StudentId', 'INDEX';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    EXEC sp_rename N'[Enrollments_v1_1].[IX_Enrollment_v1_1_CourseId]', N'IX_Enrollments_v1_1_CourseId', 'INDEX';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    EXEC sp_rename N'[Course].[IX_Courses_InstructorId]', N'IX_Course_InstructorId', 'INDEX';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    ALTER TABLE [Enrollments_v1_1] ADD CONSTRAINT [PK_Enrollments_v1_1] PRIMARY KEY ([Id]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    ALTER TABLE [Course] ADD CONSTRAINT [PK_Course] PRIMARY KEY ([Id]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    CREATE TABLE [Courses_v1_1] (
        [Id] uniqueidentifier NOT NULL,
        [Title] nvarchar(max) NOT NULL,
        [InstructorId] uniqueidentifier NULL,
        [Credits] decimal(5,2) NOT NULL,
        CONSTRAINT [PK_Courses_v1_1] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Courses_v1_1_Instructors_InstructorId] FOREIGN KEY ([InstructorId]) REFERENCES [Instructors] ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    CREATE TABLE [Enrollments_v1_2] (
        [Id] uniqueidentifier NOT NULL,
        [StudentId] uniqueidentifier NOT NULL,
        [CourseId] uniqueidentifier NOT NULL,
        [FinalGrade] int NULL,
        CONSTRAINT [PK_Enrollments_v1_2] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Enrollments_v1_2_Courses_v1_1_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses_v1_1] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Enrollments_v1_2_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    CREATE INDEX [IX_Courses_v1_1_InstructorId] ON [Courses_v1_1] ([InstructorId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    CREATE INDEX [IX_Enrollments_v1_2_CourseId] ON [Enrollments_v1_2] ([CourseId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    CREATE INDEX [IX_Enrollments_v1_2_StudentId] ON [Enrollments_v1_2] ([StudentId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    ALTER TABLE [Course] ADD CONSTRAINT [FK_Course_Instructors_InstructorId] FOREIGN KEY ([InstructorId]) REFERENCES [Instructors] ([Id]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    ALTER TABLE [Enrollments] ADD CONSTRAINT [FK_Enrollments_Course_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Course] ([Id]) ON DELETE CASCADE;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    ALTER TABLE [Enrollments_v1_1] ADD CONSTRAINT [FK_Enrollments_v1_1_Course_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Course] ([Id]) ON DELETE CASCADE;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    ALTER TABLE [Enrollments_v1_1] ADD CONSTRAINT [FK_Enrollments_v1_1_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]) ON DELETE CASCADE;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303114554_change-course-credit-to-decimal'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250303114554_change-course-credit-to-decimal', N'9.0.2');
END;

COMMIT;
GO

