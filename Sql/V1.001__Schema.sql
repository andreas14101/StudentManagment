BEGIN TRANSACTION;
ALTER TABLE [Students] ADD [MiddleName] nvarchar(max) NULL;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250226095522_student-middlename', N'9.0.2');

COMMIT;
GO

