Create Database LibraryDB
Use LibraryDB

Create Table Authors (
Id Int  Identity (1,1) Primary Key,
Name Nvarchar (50),
Surname Nvarchar (50)
)

Create Table Books (
Id Int  Identity (1,1) Primary Key,
Name Nvarchar (100),
PageCount Int Check (PageCount >0),
CostPrice Decimal (6,2),
SalePrice Decimal (6,2),
AuthorId Int Foreign Key References Authors(Id),
)

Create Table BooksTags (
Id Int  Identity (1,1) Primary Key,
BookId Int Foreign Key References Books(Id),
TagId Int Foreign Key References Tags(Id)
)

Create Table Tags (
Id Int  Identity (1,1) Primary Key,
Name Nvarchar (100)
)
Select * From Authors
Select * From Books
Select * From Tags
Select * From BooksTags

Insert Into Authors
Values ('Zulfi', 'Livaneli'),
('Cafar', 'Cabbarli'),
('Celil', 'Memmedguluzade'),
('Victor', 'Huqo')

Insert Into Books
Values ('Serenad', 467,6, 13,1),
('Kardeslerim', 516, 7, 15,1),
('Sevil', 315, 3, 9,2),
('Ana', 260, 4, 10,2),
('Danabas kendinin ehvalatlari', 400, 5.50, 11,3),
('Oluler', 355, 6, 12,3),
('Anamin kitabi', 200, 4, 8,3),
('Sefiller', 1500, 15, 25,4),
('Edam mehkumunun son gunu', 78, 2, 4,4),
('Qurbaneli bey', 120, 3, 5,3)

Insert Into Tags
Values 
('BestSeller'),
('Featured'),
('New'),
('Classic'),
('Azerbaycan edebiyyati'),
('Xarici edebiyyat')
Insert Into BooksTags
Values 
(1,1),
(1,6),
(2,3),
(2,6),
(1,3),
(3,5),
(4,5),
(5,5),
(6,5),
(7,5),
(10,5),
(8,1),
(8,4),
(8,6),
(9,4),
(9,6)

Select B.Id, B.Name, B.SalePrice, B.PageCount, A.Name As 'Author Name', A.Surname As 'Author Surname', T.Name As 'Tag Name' From Books As B
Inner Join Authors As A
On B.AuthorId = A.Id
Inner Join BooksTags As BT
On B.Id = BT.BookId
Inner Join Tags As T
On BT.TagId = T.Id
