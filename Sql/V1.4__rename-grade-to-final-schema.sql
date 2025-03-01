BEGIN TRANSACTION;
CREATE TABLE [Enrollments_v1_1] (
    [Id] uniqueidentifier NOT NULL,
    [StudentId] uniqueidentifier NOT NULL,
    [CourseId] uniqueidentifier NOT NULL,
    [Grade] int NULL,
    CONSTRAINT [PK_Enrollments_v1_1] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Enrollments_v1_1_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Enrollments_v1_1_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]) ON DELETE CASCADE
);

CREATE INDEX [IX_Enrollments_v1_1_CourseId] ON [Enrollments_v1_1] ([CourseId]);

CREATE INDEX [IX_Enrollments_v1_1_StudentId] ON [Enrollments_v1_1] ([StudentId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250301154421_rename-grade-to-finalgrade', N'9.0.2');

COMMIT;
GO

