Create Database Source
======================
Tạo các database từ các file backup
* [Các file để restore nằm trong folder Files](Files)

## Nội dung
- Flat Files
- SQLServer
- MySql
- PostgreSQL
- MongoDB

## Flat Files
* Các file có sẳn trong folder [Train_CSV](Train_CSV) và [Train_Excel](Train_Excel).

## SQLServer
* [Download file AdventureWorks2012.bak](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15)
* Restore database từ file AdventureWorks2012.bak → sử dụng tính năng restore trong SQL Server Management Studio(SSMS)

## MySql
* Chạy script mysqlsampledatabase.sql để restore

## PostgreSQL
* Restore database từ file dvdrental.tar → Sử dụng tính năng restore trong pgAdmin 4

## MongoDB
* Tạo 1 tên database bất kỳ, rồi import file restaurants.json (tương ứng với collection restaurants) vào database đó.