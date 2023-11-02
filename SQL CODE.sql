--###Chapter 31. SQL Create (creating databse and table)

-- Remember to select command before executing it, otherwise management studio will try to execute 
-- all commands at the same time which can cause unexpected issues.


-- SQL command for creating database named CookBookDB.
create database CookBookDB


-- SQL command for selecting CookBookDB before writing queries
use CookBookDB

--###End of chapter


--###Chapter 31.1. Primary key

-- SQL command for creating table Ingredients with appropriate columns 
-- and types of data that can be stored in those columns
create table Ingredients(
	Id int identity(1,1) primary key,
	Name nvarchar(50) not null,
	Weight decimal(18,2) not null,
	KcalPer100g decimal(18,2) not null,
	PricePer100g decimal(18,2) not null,
	Type nvarchar(50) not null
);
--###End of Chapter


--###Chapter 32. SQL queries (Insert)

-- SQL command for inserting data in table Ingredients
insert into Ingredients (Name, Weight, KcalPer100g, PricePer100g, Type)
values 
('apple', 200, 50, 0.4, 'fruit'),
('banana', 300, 90, 0.3, 'fruit'),
('orange', 200, 40, 0.2, 'fruit')

--###End of chapter


--###Chapter 33. SQL queries (Select)

-- SQL command for selecting data from table Ingredients
select * from Ingredients

--###End of chapter


--###Chapter 34. SQL queries (Where and Like)

-- SQL command for selecting data from the Ingredients table, but only for those records which 
-- have the letter 't' in their name.
select * from Ingredients where Name like '%t%'

--###End of chapter


--###Chapter 35. SQL queries (Update)

-- SQL command for updating the 'PricePer100g' column to 1.5 for the record with 'Id' equal to 2 
-- in the 'Ingredients' table.
update Ingredients
set PricePer100g=1.5
where Id=2

--###End of chapter


--###Chapter 36. SQL queries (Delete)

-- SQL command for deleting all records in the 'Ingredients' table.
delete from Ingredients 

--###End of chapter


--###Chapter 37. SQL Stored procedures

-- SQL command for creating procedure which inserts records into 'Ingredients' table.
-- Think of it as function which saves data into 'Ingredients' table.
create procedure InsertIngredientProcedure
	(@Name nvarchar(50), @Weight decimal(18,2), @KcalPer100g decimal(18,2),
	@PricePer100g decimal(18,2), @Type nvarchar(50))
as
begin
	insert into Ingredients (Name, Weight, KcalPer100g, PricePer100g, Type)
	values (@Name, @Weight, @KcalPer100g, @PricePer100g, @Type)
end

-- SQL command for executing previously created procedure. 
-- So, here we are calling previously created function with exact values which we want to save.
exec InsertIngredientProcedure 'milk', 1000, 50, 0.3, 'liquid'

--###End of chapter
