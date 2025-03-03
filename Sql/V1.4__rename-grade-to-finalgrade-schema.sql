BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303093856_rename-grade-to-finalgrade'
)
BEGIN
    EXEC sp_rename N'[Enrollments_v1_1].[Grade]', N'FinalGrade', 'COLUMN';
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250303093856_rename-grade-to-finalgrade'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250303093856_rename-grade-to-finalgrade', N'9.0.2');
END;

COMMIT;
GO

