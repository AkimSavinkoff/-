set ansi_padding on
go
set ansi_nulls on
go
set quoted_identifier on
go

create database [Kino]
go 

use [Kino]
go

create table Dolj(
Id_Dolj int not null identity (1,1) primary key,
Nazv_Dolj varchar (256),
Oklad int not null)
go

create table Autoriz(
Id_Auto int not null identity (1,1) primary key,
Login_ varchar (256) not null,
Pasword_ varchar (256) not null)
go

create table Sotrud(
Id_Sotrud int not null identity (1,1) primary key,
F_S varchar (256) not null,
I_S varchar (256) not null,
O_S varchar (256) not null,
Phone_Number varchar (17) not null,
Date_Of_Bithd varchar (11) not null,
Dolj_S int not null,
Autorir_S int not null,
constraint [FK_Dolj_S] foreign key (Dolj_S)
	references [dbo].[Dolj] (Id_Dolj),
constraint [FK_Autoriz_S] foreign key (Autorir_S)
	references [dbo].[Autoriz] (Id_Auto))
go

create table klient(
Id_Klient int not null identity (1,1) primary key,
F_K varchar (256) not null,
I_K varchar (256) not null,
O_K varchar (256) not null,
Phone_Number varchar (17) not null)
go


create table Ganr_Film(
Id_ganr_F int not null identity (1,1) primary key,
Nazv varchar (256) not null)
go

create table Afisha(
Id_Afisha int not null identity (1,1) primary key,
Nazv varchar (256) not null,
Dlitelnost varchar (14) not null,
Ganr_Id int,
Chena int,
constraint [FK_Ganr] foreign key (Ganr_Id)
	references [dbo].[Ganr_Film] (Id_ganr_F))
go


create table Pokupka_Bileta(
Id_Pocupka int not null identity (1,1) primary key,
Afisha_Id int,
klient_Id int,
Sotrud_Id int,
constraint [FK_Afisha] foreign key (Afisha_Id)
	references [dbo].[Afisha] (Id_Afisha),
constraint [FK_klient] foreign key (klient_Id)
	references [dbo].[klient] (Id_Klient),
constraint [FK_Sotrud] foreign key (Sotrud_Id)
	references [dbo].[Sotrud] (Id_Sotrud))
go

Insert Into [dbo].[Dolj] Values ('Сотрудник отедла кадров',75000),
									  ('Сотрудник отдела формирвоания рассписания',50000),
									  ('Кассир',50000)					
go

Insert Into [dbo].[Ganr_Film] Values ('Класика'),
								('Романтика'),
								('Фентези'),
								('Приключения')
go

Insert Into [dbo].[Afisha] Values ('Джуманджи 1','1:30', 4, 500),
								('Джуманджи 2','1:42', 4, 550),
								('Джуманджи 3','1:23', 4, 450)
go
Insert Into [dbo].[Autoriz] Values ('test1','test1')
go

Insert Into [dbo].[klient] Values ('Иванов','Иван', 'Иванович', '+8(984)941-24-12'),
								('Галустян','Иван', 'Эдуардович', '+8(984)941-54-15'),
								('Петрухан','Иван', 'Петрович', '+8(984)521-24-52')
go

Insert Into [dbo].[Sotrud] Values ('Иванов','Иван', 'Иванович', '+8(984)941-24-12', '12.12.1990',1,1),
								('Галустян','Иван', 'Эдуардович', '+8(984)941-54-15', '12.12.1993',2,1),
								('Петрухан','Иван', 'Петрович', '+8(984)521-24-52', '12.12.1997',3,1)
go

Insert Into [dbo].[Pokupka_Bileta] Values (1,1,3),
								(2,2,3),
								(3,3,3)
go

create procedure [dbo].[Afisha_Insert]
@Nazv [varchar] (256), @Dlitelnost [varchar] (14), @Ganr_Id int, @Chena int
as 
	insert into [dbo].[Afisha] (Nazv, Dlitelnost, Ganr_Id, Chena) 
	values (@Nazv, @Dlitelnost, @Ganr_Id, @Chena)
go

create procedure [dbo].[Afisha_Update]
@Id int,@Nazv [varchar] (256), @Dlitelnost [varchar] (14), @Ganr_Id int, @Chena int
as 
	update [dbo].[Afisha] set 
	Nazv = @Nazv,
	Dlitelnost = @Dlitelnost,
	Ganr_Id = @Ganr_Id,
	Chena = @Chena
	where 
		Id_Afisha = @Id
go

create procedure [dbo].[Afisha_Delete]
@Id [int]
as
	delete from [dbo].[Afisha]
	where
		Id_Afisha = @Id
go


create procedure [dbo].[Autoriz_Insert]
@Login_ [varchar] (256), @Pasword_ [varchar] (256)
as 
	insert into [dbo].[Autoriz] (Login_, Pasword_) 
	values (@Login_, @Pasword_)
go

create procedure [dbo].[Autoriz_Update]
@Id int,@Login_ [varchar] (256), @Pasword_ [varchar] (256)
as 
	update [dbo].[Autoriz] set 
	Login_ = @Login_,
	Pasword_ = @Pasword_
	where 
		Id_Auto = @Id
go

create procedure [dbo].[Autoriz_Delete]
@Id [int]
as
	delete from [dbo].[Autoriz]
	where
		Id_Auto = @Id
go

create procedure [dbo].[Dolj_Insert]
@Nazv_Dolj varchar (256), @Oklad int
as 
	insert into [dbo].[Dolj] (Nazv_Dolj, Oklad) 
	values (@Nazv_Dolj, @Oklad)
go

create procedure [dbo].[Dolj_Update]
@Id int,@Nazv_Dolj varchar (256), @Oklad int
as 
	update [dbo].[Dolj] set 
	Nazv_Dolj = @Nazv_Dolj,
	Oklad = @Oklad
	where 
		Id_Dolj = @Id
go

create procedure [dbo].[Dolj_Delete]
@Id [int]
as
	delete from [dbo].[Dolj]
	where
		Id_Dolj = @Id
go


create procedure [dbo].[Ganr_Film_Insert]
@Nazv varchar (256)
as 
	insert into [dbo].[Ganr_Film] (Nazv) 
	values (@Nazv)
go

create procedure [dbo].[Ganr_Film_Update]
@Id int,@Nazv varchar (256)
as 
	update [dbo].[Ganr_Film] set 
	Nazv = @Nazv
	where 
		Id_ganr_F = @Id
go

create procedure [dbo].[Ganr_Film_Delete]
@Id [int]
as
	delete from [dbo].[Ganr_Film]
	where
		Id_ganr_F = @Id
go

create procedure [dbo].[klient_Insert]
@F_K varchar (256), @I_K varchar (256), @O_K varchar (256), @Phone_Number varchar (17)
as 
	insert into [dbo].[klient] (F_K, I_K, O_K, Phone_Number) 
	values (@F_K, @I_K, @O_K, @Phone_Number)
go

create procedure [dbo].[klient_Update]
@Id int,@F_K varchar (256), @I_K varchar (256), @O_K varchar (256), @Phone_Number varchar (17)
as 
	update [dbo].[klient] set 
	F_K = @F_K,
	I_K= @I_K,
	O_K = @O_K,
	Phone_Number = @Phone_Number
	where 
		Id_Klient = @Id
go

create procedure [dbo].[klient_Delete]
@Id [int]
as
	delete from [dbo].[klient]
	where
		Id_Klient = @Id
go

create procedure [dbo].[Sotrud_Insert]
@F_K varchar (256), @I_K varchar (256), @O_K varchar (256), @Phone_Number varchar (17), @Date_Of_Bithd varchar (17), @Dolj_S int, @Autorir_S int 
as 
	insert into [dbo].[Sotrud] (F_S, I_S, O_S, Phone_Number, Date_Of_Bithd, Dolj_S, Autorir_S) 
	values (@F_K, @I_K, @O_K, @Phone_Number, @Date_Of_Bithd, @Dolj_S, @Autorir_S)
go

create procedure [dbo].[Sotrud_Update]
@Id int,@F_K varchar (256), @I_K varchar (256), @O_K varchar (256), @Phone_Number varchar (17), @Date_Of_Bithd varchar (17), @Dolj_S int, @Autorir_S int 
as 
	update [dbo].[Sotrud] set 
	F_S = @F_K,
	I_S= @I_K,
	O_S = @O_K,
	Phone_Number = @Phone_Number,
	Date_Of_Bithd = @Date_Of_Bithd,
	Dolj_S = @Dolj_S,
	Autorir_S = @Autorir_S
	where 
		Id_Sotrud = @Id
go

create procedure [dbo].[Sotrud_Update_Dolj]
@Id int, @Dolj_S int
as 
	update [dbo].[Sotrud] set 
	Dolj_S = @Dolj_S
	where 
		Id_Sotrud = @Id
go

create procedure [dbo].[Sotrud_Delete]
@Id [int]
as
	delete from [dbo].[Sotrud]
	where
		Id_Sotrud = @Id
go

create procedure [dbo].[Pokupka_Bileta_Insert]
@Afisha_Id int, @klient_Id int, @Sotrud_Id int
as 
	insert into [dbo].[Pokupka_Bileta] (Afisha_Id, klient_Id, Sotrud_Id) 
	values (@Afisha_Id, @klient_Id, @Sotrud_Id)
go

create procedure [dbo].[Pokupka_Bileta_Update]
@Id int,@Afisha_Id int, @klient_Id int, @Sotrud_Id int
as 
	update [dbo].[Pokupka_Bileta] set 
	Afisha_Id = @Afisha_Id,
	klient_Id= @klient_Id,
	Sotrud_Id = @Sotrud_Id
	where 
		Id_Pocupka = @Id
go

create procedure [dbo].[Pokupka_Bileta_Delete]
@Id [int]
as
	delete from [dbo].[Pokupka_Bileta]
	where
		Id_Pocupka = @Id
go

CREATE VIEW [dbo].[View_Sotrud]
AS
SELECT dbo.Sotrud.Id_Sotrud AS Ключ, dbo.Sotrud.F_S AS Фамилия, dbo.Sotrud.I_S AS Имя, dbo.Sotrud.O_S AS Отчество, dbo.Sotrud.Phone_Number AS [Номер телефона], dbo.Sotrud.Date_Of_Bithd AS [Дата рождения], 
                  dbo.Dolj.Nazv_Dolj AS Должность, dbo.Dolj.Oklad AS Оклад, dbo.Autoriz.Login_ AS Аккаунт
FROM     dbo.Sotrud INNER JOIN
                  dbo.Autoriz ON dbo.Sotrud.Autorir_S = dbo.Autoriz.Id_Auto INNER JOIN
                  dbo.Dolj ON dbo.Sotrud.Dolj_S = dbo.Dolj.Id_Dolj
GO

CREATE VIEW [dbo].[View_Dolj]
AS
SELECT Id_Dolj AS Ключ, Nazv_Dolj AS Название, Oklad AS Оклад
FROM     dbo.Dolj
GO

CREATE VIEW [dbo].[View_Aficha]
AS
SELECT dbo.Afisha.Id_Afisha AS Ключ, dbo.Afisha.Nazv AS Название, dbo.Afisha.Dlitelnost AS Длительность, dbo.Ganr_Film.Nazv AS Жанр, dbo.Afisha.Chena AS Цена
FROM     dbo.Ganr_Film INNER JOIN
                  dbo.Afisha ON dbo.Ganr_Film.Id_ganr_F = dbo.Afisha.Ganr_Id
GO
CREATE VIEW [dbo].[View_Klient]
AS
SELECT Id_Klient AS Ключ, F_K AS Фамилия, I_K AS Имя, O_K AS Отчество, Phone_Number AS [Номер телефона]
FROM     dbo.klient
GO

CREATE VIEW [dbo].[View_Sellsis_Bilets]
AS
SELECT dbo.Pokupka_Bileta.Id_Pocupka AS Ключ, dbo.Afisha.Nazv AS [Название фильма], dbo.Afisha.Dlitelnost AS Длительность, dbo.Ganr_Film.Nazv AS Жанр, dbo.Afisha.Chena AS Цена, dbo.klient.F_K AS [Фамилия клиента], 
                  dbo.klient.Phone_Number AS [Номер телефона клиента], dbo.Sotrud.F_S AS [Фамилия сотрудника]
FROM     dbo.Pokupka_Bileta INNER JOIN
                  dbo.Afisha ON dbo.Pokupka_Bileta.Afisha_Id = dbo.Afisha.Id_Afisha INNER JOIN
                  dbo.klient ON dbo.Pokupka_Bileta.klient_Id = dbo.klient.Id_Klient INNER JOIN
                  dbo.Sotrud ON dbo.Pokupka_Bileta.Sotrud_Id = dbo.Sotrud.Id_Sotrud INNER JOIN
                  dbo.Ganr_Film ON dbo.Afisha.Ganr_Id = dbo.Ganr_Film.Id_ganr_F
GO
