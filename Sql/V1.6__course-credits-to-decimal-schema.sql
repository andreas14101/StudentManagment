BEGIN TRANSACTION;
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250303095905_change-course-credits-to-decimal', N'9.0.2');

COMMIT;
GO

