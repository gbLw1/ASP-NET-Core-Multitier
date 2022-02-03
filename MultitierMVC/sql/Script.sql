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
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220121201233_Initial')
BEGIN
    CREATE TABLE [Fornecedores] (
        [Id] uniqueidentifier NOT NULL,
        [Nome] VARCHAR(200) NOT NULL,
        [Documento] VARCHAR(14) NOT NULL,
        [TipoFornecedor] int NOT NULL,
        [Ativo] bit NOT NULL,
        CONSTRAINT [PK_Fornecedores] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220121201233_Initial')
BEGIN
    CREATE TABLE [Enderecos] (
        [Id] uniqueidentifier NOT NULL,
        [Logradouro] VARCHAR(200) NOT NULL,
        [Numero] VARCHAR(50) NOT NULL,
        [Complemento] VARCHAR(250) NULL,
        [Cep] VARCHAR(8) NOT NULL,
        [Bairro] VARCHAR(100) NOT NULL,
        [Cidade] VARCHAR(100) NOT NULL,
        [Estado] VARCHAR(50) NOT NULL,
        [FornecedorId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_Enderecos] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Enderecos_Fornecedores_FornecedorId] FOREIGN KEY ([FornecedorId]) REFERENCES [Fornecedores] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220121201233_Initial')
BEGIN
    CREATE TABLE [Produtos] (
        [Id] uniqueidentifier NOT NULL,
        [Nome] VARCHAR(200) NOT NULL,
        [Descricao] VARCHAR(1000) NOT NULL,
        [Imagem] VARCHAR(100) NOT NULL,
        [Valor] DECIMAL(15,2) NOT NULL,
        [DataCadastro] datetime2 NOT NULL,
        [Ativo] bit NOT NULL,
        [FornecedorId] uniqueidentifier NOT NULL,
        CONSTRAINT [PK_Produtos] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Produtos_Fornecedores_FornecedorId] FOREIGN KEY ([FornecedorId]) REFERENCES [Fornecedores] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220121201233_Initial')
BEGIN
    CREATE UNIQUE INDEX [IX_Enderecos_FornecedorId] ON [Enderecos] ([FornecedorId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220121201233_Initial')
BEGIN
    CREATE INDEX [IX_Produtos_FornecedorId] ON [Produtos] ([FornecedorId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220121201233_Initial')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220121201233_Initial', N'6.0.1');
END;
GO

COMMIT;
GO

