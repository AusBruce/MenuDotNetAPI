IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(450) NOT NULL,
        [ProviderKey] nvarchar(450) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(450) NOT NULL,
        [Name] nvarchar(450) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250102120220_initalMigration'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250102120220_initalMigration', N'9.0.0');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250103121005_addApplicationUser'
)
BEGIN
    ALTER TABLE [AspNetUsers] ADD [Name] nvarchar(max) NULL;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250103121005_addApplicationUser'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250103121005_addApplicationUser', N'9.0.0');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250103121826_addMenuItem'
)
BEGIN
    CREATE TABLE [MenuItems] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Description] nvarchar(max) NULL,
        [SpecialTag] nvarchar(max) NULL,
        [Category] nvarchar(max) NULL,
        [Price] float NOT NULL,
        [Image] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_MenuItems] PRIMARY KEY ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250103121826_addMenuItem'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250103121826_addMenuItem', N'9.0.0');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250103123850_initialSeedMenuItem'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Category', N'Description', N'Image', N'Name', N'Price', N'SpecialTag') AND [object_id] = OBJECT_ID(N'[MenuItems]'))
        SET IDENTITY_INSERT [MenuItems] ON;
    EXEC(N'INSERT INTO [MenuItems] ([Id], [Category], [Description], [Image], [Name], [Price], [SpecialTag])
    VALUES (1, N''Appetizer'', N''Fusc tincidunt maximus leo, sed scelerisque massa auctor sit amet. Donec ex mauris, hendrerit quis nibh ac, efficitur fringilla enim.'', N''https://redmangoimages01.blob.core.windows.net/redmango/spring roll.jpg'', N''Spring Roll'', 7.9900000000000002E0, N''''),
    (2, N''Appetizer'', N''Fusc tincidunt maximus leo, sed scelerisque massa auctor sit amet. Donec ex mauris, hendrerit quis nibh ac, efficitur fringilla enim.'', N''https://redmangoimages01.blob.core.windows.net/redmango/idli.jpg'', N''Idli'', 8.9900000000000002E0, N''''),
    (3, N''Appetizer'', N''Fusc tincidunt maximus leo, sed scelerisque massa auctor sit amet. Donec ex mauris, hendrerit quis nibh ac, efficitur fringilla enim.'', N''https://redmangoimages01.blob.core.windows.net/redmango/pani puri.jpg'', N''Panu Puri'', 8.9900000000000002E0, N''Best Seller''),
    (4, N''Entrée'', N''Fusc tincidunt maximus leo, sed scelerisque massa auctor sit amet. Donec ex mauris, hendrerit quis nibh ac, efficitur fringilla enim.'', N''https://redmangoimages01.blob.core.windows.net/redmango/hakka noodles.jpg'', N''Hakka Noodles'', 10.99E0, N''''),
    (5, N''Entrée'', N''Fusc tincidunt maximus leo, sed scelerisque massa auctor sit amet. Donec ex mauris, hendrerit quis nibh ac, efficitur fringilla enim.'', N''https://redmangoimages01.blob.core.windows.net/redmango/malai kofta.jpg'', N''Malai Kofta'', 12.99E0, N''Top Rated''),
    (6, N''Entrée'', N''Fusc tincidunt maximus leo, sed scelerisque massa auctor sit amet. Donec ex mauris, hendrerit quis nibh ac, efficitur fringilla enim.'', N''https://redmangoimages01.blob.core.windows.net/redmango/paneer pizza.jpg'', N''Paneer Pizza'', 11.99E0, N''''),
    (7, N''Entrée'', N''Fusc tincidunt maximus leo, sed scelerisque massa auctor sit amet. Donec ex mauris, hendrerit quis nibh ac, efficitur fringilla enim.'', N''https://redmangoimages01.blob.core.windows.net/redmango/paneer tikka.jpg'', N''Paneer Tikka'', 13.99E0, N''Chef''''s Special''),
    (8, N''Dessert'', N''Fusc tincidunt maximus leo, sed scelerisque massa auctor sit amet. Donec ex mauris, hendrerit quis nibh ac, efficitur fringilla enim.'', N''https://redmangoimages01.blob.core.windows.net/redmangoimages/carrot love.jpg'', N''Carrot Love'', 4.9900000000000002E0, N''''),
    (9, N''Dessert'', N''Fusc tincidunt maximus leo, sed scelerisque massa auctor sit amet. Donec ex mauris, hendrerit quis nibh ac, efficitur fringilla enim.'', N''https://redmangoimages01.blob.core.windows.net/redmango/rasmalai.jpg'', N''Rasmalai'', 4.9900000000000002E0, N''Chef''''s Special''),
    (10, N''Dessert'', N''Fusc tincidunt maximus leo, sed scelerisque massa auctor sit amet. Donec ex mauris, hendrerit quis nibh ac, efficitur fringilla enim.'', N''https://redmangoimages01.blob.core.windows.net/redmango/sweet rolls.jpg'', N''Sweet Rolls'', 3.9900000000000002E0, N''Top Rated'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Category', N'Description', N'Image', N'Name', N'Price', N'SpecialTag') AND [object_id] = OBJECT_ID(N'[MenuItems]'))
        SET IDENTITY_INSERT [MenuItems] OFF;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250103123850_initialSeedMenuItem'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250103123850_initialSeedMenuItem', N'9.0.0');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250108121055_addShoppingCartandCartItemToDb'
)
BEGIN
    CREATE TABLE [ShoppingCarts] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(max) NULL,
        CONSTRAINT [PK_ShoppingCarts] PRIMARY KEY ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250108121055_addShoppingCartandCartItemToDb'
)
BEGIN
    CREATE TABLE [CartItems] (
        [Id] int NOT NULL IDENTITY,
        [MenuItemId] int NOT NULL,
        [Quantity] int NOT NULL,
        [ShoppingCartId] int NOT NULL,
        CONSTRAINT [PK_CartItems] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_CartItems_MenuItems_MenuItemId] FOREIGN KEY ([MenuItemId]) REFERENCES [MenuItems] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_CartItems_ShoppingCarts_ShoppingCartId] FOREIGN KEY ([ShoppingCartId]) REFERENCES [ShoppingCarts] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250108121055_addShoppingCartandCartItemToDb'
)
BEGIN
    CREATE INDEX [IX_CartItems_MenuItemId] ON [CartItems] ([MenuItemId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250108121055_addShoppingCartandCartItemToDb'
)
BEGIN
    CREATE INDEX [IX_CartItems_ShoppingCartId] ON [CartItems] ([ShoppingCartId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250108121055_addShoppingCartandCartItemToDb'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250108121055_addShoppingCartandCartItemToDb', N'9.0.0');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250110113735_addOrderHeaderAndDetails'
)
BEGIN
    CREATE TABLE [OrderHeaders] (
        [OrderHeaderId] int NOT NULL IDENTITY,
        [PickupName] nvarchar(max) NOT NULL,
        [PickupPhoneNumber] nvarchar(max) NOT NULL,
        [PickupEmail] nvarchar(max) NOT NULL,
        [ApplicationUserId] nvarchar(450) NULL,
        [OrderTotal] float NOT NULL,
        [OrderDate] datetime2 NOT NULL,
        [StripePaymentIntentID] nvarchar(max) NULL,
        [Status] nvarchar(max) NULL,
        [TotalItems] int NOT NULL,
        CONSTRAINT [PK_OrderHeaders] PRIMARY KEY ([OrderHeaderId]),
        CONSTRAINT [FK_OrderHeaders_AspNetUsers_ApplicationUserId] FOREIGN KEY ([ApplicationUserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250110113735_addOrderHeaderAndDetails'
)
BEGIN
    CREATE TABLE [OrderDetails] (
        [OrderDetailId] int NOT NULL IDENTITY,
        [OrderHeaderId] int NOT NULL,
        [MenuItemId] int NOT NULL,
        [Quantity] int NOT NULL,
        [ItemName] nvarchar(max) NOT NULL,
        [Price] float NOT NULL,
        CONSTRAINT [PK_OrderDetails] PRIMARY KEY ([OrderDetailId]),
        CONSTRAINT [FK_OrderDetails_MenuItems_MenuItemId] FOREIGN KEY ([MenuItemId]) REFERENCES [MenuItems] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_OrderDetails_OrderHeaders_OrderHeaderId] FOREIGN KEY ([OrderHeaderId]) REFERENCES [OrderHeaders] ([OrderHeaderId]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250110113735_addOrderHeaderAndDetails'
)
BEGIN
    CREATE INDEX [IX_OrderDetails_MenuItemId] ON [OrderDetails] ([MenuItemId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250110113735_addOrderHeaderAndDetails'
)
BEGIN
    CREATE INDEX [IX_OrderDetails_OrderHeaderId] ON [OrderDetails] ([OrderHeaderId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250110113735_addOrderHeaderAndDetails'
)
BEGIN
    CREATE INDEX [IX_OrderHeaders_ApplicationUserId] ON [OrderHeaders] ([ApplicationUserId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20250110113735_addOrderHeaderAndDetails'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20250110113735_addOrderHeaderAndDetails', N'9.0.0');
END;

COMMIT;
GO