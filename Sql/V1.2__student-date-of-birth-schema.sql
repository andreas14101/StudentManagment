BEGIN TRANSACTION;
ALTER TABLE [Students] ADD [DateOfBirth] date NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250301152838_student-date-of-birth', N'9.0.2');

COMMIT;
GO

