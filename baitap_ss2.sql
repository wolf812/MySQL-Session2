Create database baitap_ss2;
use baitap_ss2;
/*
1. Tạo bảng Product gồm các thông tin sau:
    - Product_Id - mã sản phẩm - char(5) - khóa chính
    - Product_Name - tên sản phẩm - varchar(100) - not null - unique
    - Price - float - có giá trị >0
    - Descriptions - text - not null
    - Product_status - bit - mặc định là 1
*/

Create table Product(
Product_Id char(5) primary key,
Product_Name varchar(100) not null unique,
Price float check(price>0),
Description text not null,
Product_status bit not null
);
/*
2. Tạo bảng Order - hóa đơn gồm các thông tin sau
    - Order_id - Mã hóa đơn - int - tự tăng
    - Created - Ngày tạo - date - mặc định là ngày hiện tại
    - Total_amount - float
    - Order_Status: bit mặc định là 0
*/
Create table Orders (
Orders_Id int auto_increment primary key,
create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Total_amout float,
Orders_Status bit default(0)
);
/* 3. Tạo bảng Order-Detail - Hóa đơn chi tiết gồm các thông tin sau:
    - Order_id - Mã hóa đơn - khóa ngoại của bảng Order
    - Product_id - mã sản phẩm - khóa ngoại của bảng product
    - (Order_id,Product_id) xác định khóa chính của bảng Order_Detail
    - Price - Giá sản phẩm lúc mua - float
    - Quantity - Số lượng sản phẩm mua - int
    - Amount - Thành tiền - tính tự động bằng công thức: price * quantity
*/
create table order_detail(
product_id char(5),
orders_id int,
price float,
quantity int,
amount float as (price*quantity),
primary key(orders_id,product_id),
foreign key (orders_id) references Orders(orders_id),
foreign key (product_id) references Product(product_id)
)