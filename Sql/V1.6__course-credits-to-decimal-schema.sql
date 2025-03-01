BEGIN TRANSACTION;
CREATE TABLE [Courses_v1_1] (
    [Id] uniqueidentifier NOT NULL,
    [Title] nvarchar(max) NOT NULL,
    [InstructorId] uniqueidentifier NULL,
    [Credits] decimal(5,2) NOT NULL,
    CONSTRAINT [PK_Courses_v1_1] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Courses_v1_1_Instructors_InstructorId] FOREIGN KEY ([InstructorId]) REFERENCES [Instructors] ([Id])
);

CREATE TABLE [Enrollments_v1_2] (
    [Id] uniqueidentifier NOT NULL,
    [StudentId] uniqueidentifier NOT NULL,
    [CourseId] uniqueidentifier NOT NULL,
    [Grade] int NULL,
    CONSTRAINT [PK_Enrollments_v1_2] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Enrollments_v1_2_Courses_v1_1_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses_v1_1] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Enrollments_v1_2_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]) ON DELETE CASCADE
);

CREATE INDEX [IX_Courses_v1_1_InstructorId] ON [Courses_v1_1] ([InstructorId]);

CREATE INDEX [IX_Enrollments_v1_2_CourseId] ON [Enrollments_v1_2] ([CourseId]);

CREATE INDEX [IX_Enrollments_v1_2_StudentId] ON [Enrollments_v1_2] ([StudentId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250301162027_change-course-credits-to-decimal', N'9.0.2');

COMMIT;
GO

