Determine ETL Tables & Generate Query
=====================================

## Determine ETL Tables
- ETL Tables of SQLServer
- ETL Tables of MySql
- ETL Tables of PostgreSQL
- ETL Tables of MongoDB


ETL Tables of SQLServer
-----------------------

ETL tất cả các table trong database AdventureWorks2012


ETL Tables of MySql
-------------------

ETL tất cả các table trong database classicmodels


ETL Tables of PostgreSQL
------------------------

ETL tất cả các table trong database dvdrental


ETL Tables of MongoDB
---------------------

ETL collection restaurants trong database sample_db(là tên database lúc tạo database source)


## Generate Query
Xác định lấy dữ liệu incremental/full thì dựa vào 1 column datetime để xác định(VD: ModifiedDate). Nếu không có column datetime thì được xem như là bảng đó full load cho mỗi lần etl, ngược lại nếu có column datetime thì là incremental load. Đối với những table dùng column datetime thì Store Procedure/Function/Query đều có 2 parameters là @WatermarkValue và @NewWatermarkValue.



Ở SQLServer, MySql có thể tạo Store Procedure/Query. Ở PostgreSQL có thể tạo Function/Query. Ở MongoDB thì cần xác định các field cần lấy.

Các file để tạo ra các câu query nằm ở [folder SQL_Script](SQL_Script) bao gồm các file sau:
* [_20_Source_SQLServer_AdventureWorks2012.sql](SQL_Script/_20_Source_SQLServer_AdventureWorks2012.sql)
* [_30_Source_MySQL_classicmodels.sql](SQL_Script/_30_Source_MySQL_classicmodels.sql)
* [_40_Source_PostgreSQL_dvdrental.sql](SQL_Script/_40_Source_PostgreSQL_dvdrental.sql)