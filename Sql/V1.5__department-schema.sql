BEGIN TRANSACTION;
CREATE TABLE [Departoments] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NOT NULL,
    [Dudget] float NOT NULL,
    [StartDate] date NOT NULL,
    [DepartmentHeadId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_Departoments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Departoments_Instructors_DepartmentHeadId] FOREIGN KEY ([DepartmentHeadId]) REFERENCES [Instructors] ([Id]) ON DELETE CASCADE
);

CREATE INDEX [IX_Departoments_DepartmentHeadId] ON [Departoments] ([DepartmentHeadId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20250301160837_department', N'9.0.2');

COMMIT;
GO

