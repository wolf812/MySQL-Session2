Create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer(
cID int auto_increment primary key,
cName varchar(50) not null,
cAge int not null
);
create table Orders(
oID int auto_increment primary key,
cID int,
foreign key (cID) references Customer(cId),
oDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
oTotalPrice float
);
create table Product(
pID int auto_increment primary key,
pName varchar(50) not null,
pPrice float
);
create table OrderDetail(
oID int,
pID int,
foreign key(oID) references Orders(oID),
foreign key(pID) references Product(pId),
primary key(oID,pID),
odQTY int
)