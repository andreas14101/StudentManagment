BEGIN TRANSACTION;
ALTER TABLE [Students] ADD [DateOfBirth] date NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250226101213_student-date-of-birth', N'9.0.2');

COMMIT;
GO

