-- 1. Создаём базу данных "Трекер расходов"
CREATE DATABASE ExpenseTracker;
GO

USE ExpenseTracker;
GO

-- 2. Таблица "Пользователи" 
CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1), -- ID автоматически увеличивается (1, 2, 3...)
    Name NVARCHAR(50) NOT NULL           
);
GO

-- 3. Таблица "Категории" (список категорий для расходов)
CREATE TABLE Categories (
    CategoryId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL           -- Например: Еда, Транспорт
);
GO

-- 4. Таблица "Расходы" (здесь все траты)
CREATE TABLE Expenses (
    ExpenseId INT PRIMARY KEY IDENTITY(1,1),
    Amount DECIMAL(10,2) NOT NULL,       -- Сумма (например: 100.50)
    Description NVARCHAR(255),           -- Описание (например: "Продукты в Пятёрочке")
    Date DATETIME DEFAULT GETDATE(),     -- Дата автоматически ставится текущая
    UserId INT REFERENCES Users(UserId), -- Кто потратил
    CategoryId INT REFERENCES Categories(CategoryId) -- К какой категории относится
);
GO

-- 5. Добавляем основные категории 
INSERT INTO Categories (Name)
VALUES 
    ('Еда'),
    ('Транспорт'),
    ('Жильё'),
    ('Развлечения');
GO

-- 6. 
-- добавляем пользователя
INSERT INTO Users (Name)
VALUES ('Анна');

-- добавляем расходы
INSERT INTO Expenses (Amount, Description, UserId, CategoryId)
VALUES 
    (1500.00, 'Аренда квартиры', 1, 3),
    (350.50, 'Продукты на неделю', 1, 1);
GO