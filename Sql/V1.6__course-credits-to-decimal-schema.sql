BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303094522_change-course-credits-to-decimal'
)
BEGIN
    EXEC sp_rename N'[Enrollments_v1_2].[Grade]', N'FinalGrade', 'COLUMN';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303094522_change-course-credits-to-decimal'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250303094522_change-course-credits-to-decimal', N'9.0.2');
END;

COMMIT;
GO

