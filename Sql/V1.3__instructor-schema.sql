BEGIN TRANSACTION;
ALTER TABLE [Courses] ADD [InstructorId] uniqueidentifier NULL;

CREATE TABLE [Instructors] (
    [Id] uniqueidentifier NOT NULL,
    [FirstName] nvarchar(max) NOT NULL,
    [LastName] nvarchar(max) NOT NULL,
    [Email] nvarchar(max) NOT NULL,
    [HireDate] date NOT NULL,
    CONSTRAINT [PK_Instructors] PRIMARY KEY ([Id])
);

CREATE INDEX [IX_Courses_InstructorId] ON [Courses] ([InstructorId]);

ALTER TABLE [Courses] ADD CONSTRAINT [FK_Courses_Instructors_InstructorId] FOREIGN KEY ([InstructorId]) REFERENCES [Instructors] ([Id]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250301153528_instructor', N'9.0.2');

COMMIT;
GO

