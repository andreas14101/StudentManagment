BEGIN TRANSACTION;
CREATE TABLE [EnrollmentV1_1] (
    [Id] uniqueidentifier NOT NULL,
    [StudentId] uniqueidentifier NOT NULL,
    [CourseId] uniqueidentifier NOT NULL,
    [FinalGrade] int NULL,
    CONSTRAINT [PK_EnrollmentV1_1] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_EnrollmentV1_1_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_EnrollmentV1_1_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]) ON DELETE CASCADE
);

CREATE INDEX [IX_EnrollmentV1_1_CourseId] ON [EnrollmentV1_1] ([CourseId]);

CREATE INDEX [IX_EnrollmentV1_1_StudentId] ON [EnrollmentV1_1] ([StudentId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250226104942_rename-grade', N'9.0.2');

COMMIT;
GO

