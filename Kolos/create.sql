/****** Object:  Table [Client] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Client](
    [IdClient] [int] IDENTITY(1,1) NOT NULL,
    [FirstName] [nvarchar](100) NOT NULL,
    [LastName] [nvarchar](100) NOT NULL,
    [Email] [nvarchar](100) NOT NULL,
    CONSTRAINT [Client_pk] PRIMARY KEY CLUSTERED
(
[IdClient] ASC
)
    ) ON [PRIMARY]
    GO
/****** Object:  Table [Order] ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [Order](
    [IdOrder] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](200) NOT NULL,
    [Description] [nvarchar](1000) NOT NULL,
    [CreationDate] [date] NOT NULL,
    [IdClient] [int] NOT NULL,
    CONSTRAINT [Order_pk] PRIMARY KEY CLUSTERED
(
[IdOrder] ASC
)
    ) ON [PRIMARY]
    GO
/****** Object:  Table [ProductType] ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [ProductType](
    [IdProductType] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](200) NOT NULL,
    CONSTRAINT [ProductType_pk] PRIMARY KEY CLUSTERED
(
[IdProductType] ASC
)
    ) ON [PRIMARY]
    GO
/****** Object:  Table [Product] ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [Product](
    [IdProduct] [int] IDENTITY(1,1) NOT NULL,
    [Name] [nvarchar](200) NOT NULL,
    [Price] [float] NOT NULL,
    [IdProductType] [int] NOT NULL,
    CONSTRAINT [Product_pk] PRIMARY KEY CLUSTERED
(
[IdProduct] ASC
)
    ) ON [PRIMARY]
    GO
/****** Object:  Table [Order_Product] ******/
    SET ANSI_NULLS ON
    GO
    SET QUOTED_IDENTIFIER ON
    GO
CREATE TABLE [Order_Product](
    [IdOrder] [int] NOT NULL,
    [IdProduct] [int] NOT NULL,
    [Quantity] [int] NOT NULL,
     CONSTRAINT [Order_Product_pk] PRIMARY KEY CLUSTERED
    (
    [IdOrder] ASC,
[IdProduct] ASC
)
    ) ON [PRIMARY]
    GO
    SET IDENTITY_INSERT [Client] ON

    INSERT [Client] ([IdClient], [FirstName], [LastName], [Email]) VALUES (1, N'Andrzej', N'Malewski', N'malewski@wp.pl')
    INSERT [Client] ([IdClient], [FirstName], [LastName], [Email]) VALUES (2, N'Marcin', N'Malędowski', N'moleda@wp.pl')
    INSERT [Client] ([IdClient], [FirstName], [LastName], [Email]) VALUES (3, N'Krzysztof', N'Kowalewicz', N'kowalewicz@wp.pl')
    INSERT [Client] ([IdClient], [FirstName], [LastName], [Email]) VALUES (4, N'Anna', N'Kostrzewska', N'akostrzew@onet.pl')
    SET IDENTITY_INSERT [Client] OFF
    GO
    SET IDENTITY_INSERT [ProductType] ON

    INSERT [ProductType] ([IdProductType], [Name]) VALUES (1, 'Accessory')
    INSERT [ProductType] ([IdProductType], [Name]) VALUES (2, 'Food')
    INSERT [ProductType] ([IdProductType], [Name]) VALUES (3, 'Materials')
    SET IDENTITY_INSERT [ProductType] OFF
    GO
    SET IDENTITY_INSERT [Product] ON

    INSERT [Product] ([IdProduct], [Name], [Price], [IdProductType]) VALUES (1, 'Water', 2, 2)
    INSERT [Product] ([IdProduct], [Name], [Price], [IdProductType]) VALUES (2, 'Dog food', 10, 2)
    INSERT [Product] ([IdProduct], [Name], [Price], [IdProductType]) VALUES (3, 'Cat food', 8, 2)
    INSERT [Product] ([IdProduct], [Name], [Price], [IdProductType]) VALUES (4, 'Dog leash', 20, 1)
    INSERT [Product] ([IdProduct], [Name], [Price], [IdProductType]) VALUES (5, 'Cat leash', 15, 1)
    INSERT [Product] ([IdProduct], [Name], [Price], [IdProductType]) VALUES (6, 'Dog collar', 25, 1)
    INSERT [Product] ([IdProduct], [Name], [Price], [IdProductType]) VALUES (7, 'Cat collar', 20, 1)

    SET IDENTITY_INSERT [Product] OFF
    GO
    SET IDENTITY_INSERT [Order] ON

    INSERT [Order] ([IdOrder], [Name], [Description], [CreationDate], [IdClient]) VALUES (1, 'AX_123', '', CAST(N'2020-05-12' AS Date), 1)
    INSERT [Order] ([IdOrder], [Name], [Description], [CreationDate], [IdClient]) VALUES (2, 'CX_124', '', CAST(N'2020-06-14' AS Date), 1)
    INSERT [Order] ([IdOrder], [Name], [Description], [CreationDate], [IdClient]) VALUES (3, 'CX_125', '', CAST(N'2020-07-15' AS Date), 1)
    INSERT [Order] ([IdOrder], [Name], [Description], [CreationDate], [IdClient]) VALUES (4, 'FX_126', '', CAST(N'2020-03-12' AS Date), 1)
    INSERT [Order] ([IdOrder], [Name], [Description], [CreationDate], [IdClient]) VALUES (5, 'GX_127', '', CAST(N'2020-02-11' AS Date), 2)
    INSERT [Order] ([IdOrder], [Name], [Description], [CreationDate], [IdClient]) VALUES (6, 'ZX_128', '', CAST(N'2020-01-22' AS Date), 2)

    SET IDENTITY_INSERT [Order] OFF
    GO
    INSERT [Order_Product] ([IdOrder], [IdProduct], [Quantity]) VALUES (1, 1, 4)
    INSERT [Order_Product] ([IdOrder], [IdProduct], [Quantity]) VALUES (1, 2, 2)
    INSERT [Order_Product] ([IdOrder], [IdProduct], [Quantity]) VALUES (1, 3, 3)
    INSERT [Order_Product] ([IdOrder], [IdProduct], [Quantity]) VALUES (1, 4, 1)
    INSERT [Order_Product] ([IdOrder], [IdProduct], [Quantity]) VALUES (3, 5, 2)
    INSERT [Order_Product] ([IdOrder], [IdProduct], [Quantity]) VALUES (3, 6, 1)
    INSERT [Order_Product] ([IdOrder], [IdProduct], [Quantity]) VALUES (4, 7, 1)
    INSERT [Order_Product] ([IdOrder], [IdProduct], [Quantity]) VALUES (4, 1, 2)
    INSERT [Order_Product] ([IdOrder], [IdProduct], [Quantity]) VALUES (5, 2, 3)
    INSERT [Order_Product] ([IdOrder], [IdProduct], [Quantity]) VALUES (5, 3, 2)
    INSERT [Order_Product] ([IdOrder], [IdProduct], [Quantity]) VALUES (6, 4, 1)

    GO
ALTER TABLE [Order]  WITH CHECK ADD  CONSTRAINT [Order_Client] FOREIGN KEY([IdClient])
    REFERENCES [Client] ([IdClient])
    GO
ALTER TABLE [Order] CHECK CONSTRAINT [Order_Client]
    GO
ALTER TABLE [Product]  WITH CHECK ADD  CONSTRAINT [Product_ProductType] FOREIGN KEY([IdProductType])
    REFERENCES [ProductType] ([IdProductType])
    GO
ALTER TABLE [Product] CHECK CONSTRAINT [Product_ProductType]
    GO
ALTER TABLE [Order_Product]  WITH CHECK ADD  CONSTRAINT [Order_Product_Order] FOREIGN KEY([IdOrder])
    REFERENCES [Order] ([IdOrder])
    GO
ALTER TABLE [Order_Product] CHECK CONSTRAINT [Order_Product_Order]
    GO
ALTER TABLE [Order_Product]  WITH CHECK ADD  CONSTRAINT [Order_Product_Product] FOREIGN KEY([IdProduct])
    REFERENCES [Product] ([IdProduct])
    GO
ALTER TABLE [Order_Product] CHECK CONSTRAINT [Order_Product_Product]
    GO
