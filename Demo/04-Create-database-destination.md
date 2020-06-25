Create Database Destination
===========================

* Database Dev_Staging
* Database Dev_DW

## Database Dev_Staging

* Tạo cấu trúc các table với các column tương ứng với các table source và một số column riêng của database Dev_Staging.
* Tạo cấu trúc các table type tương ứng chính xác số lượng và thứ tự column của Store Procedure/Function/Query(SFQ) ở Source.
* Tạo store procedure upsert để MERGE data từ SFQ ở Source với table tương ứng ở Staging.
* Tạo store procedure select để chuẩn bị data để load sang Data Warehouse(DW)
* [_100_Staging_SQLServer_Dev_Staging.sql](SQL_Script/_100_Staging_SQLServer_Dev_Staging.sql)

## Database Dev_DW

* Tạo cấu trúc các table phù hợp với các store procedure select ở Dev_Staging
* Tạo cấu trúc các table type tương ứng chính xác số lượng và thứ tự column của Store Procedure ở Staging.
* Tạo store procedure upsert để MERGE data từ Store Procedure ở Staging với table tương ứng ở DW.
* [_200_DW_SQLServer_Dev_DW.sql](SQL_Script/_200_DW_SQLServer_Dev_DW.sql)