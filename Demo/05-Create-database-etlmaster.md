Create Database ETLMaster
=========================

- Database ETLMaster
- Introduction etl_connection & etl_watermark

## Database ETLMaster
- Nơi lưu giữ và định nghĩa meta data của data pipelines
- [ETLMaster_Tables.sql](../ETLMaster_Database/ETLMaster_Tables.sql): script tạo tables
- [ETLMaster_StoreProcedures.sql](../ETLMaster_Database/ETLMaster_StoreProcedures.sql): script tạo store procedure. Các ngôn ngữ lập trình sẽ tương tác với database qua các store procedure này. (Project này dùng C#)
- [ETLMaster_Views.sql](../ETLMaster_Database/ETLMaster_Views.sql): script tạo views.

## Introduction etl_connection & etl_watermark
### etl_connection
Lưu trữ các thông tin về connection như: database_type, driver, server, database, user, password, input_directory, archive_directory,... và có thể thay đổi giá trị của các thông tin cho phù hợp với môi trường đang setup.

### etl_watermark
Lưu trữ các thông tin về data pipelines như: source_object, source_query, destination_table, destination_table_type, destination_sp_upsert,... và khi muốn load thêm 1 table thì chỉ cần định nghĩa thêm trong bảng này 1 dòng với Enable = 1 là được.(Enable = 1 là mỗi lần chạy job etl sẽ load table này, ngược lại Enable = 0 thì không load)

### Note
- [Script insert etl_connection & etl_watermark](SQL_Script/_9999_ETLMaster.sql)
- Nếu bạn không dùng các connection khác như: MySql, PostgreSQL, MongoDB,...thì:
  - etl_connection: không cần thiết phải xóa các dòng này.
  - etl_watermark: bạn phải update Enable = 0 đối với các source_connection_id mà bạn không dùng. Hoặc bạn không insert những dòng(với source_connection_id mà bạn không dùng) này vào etl_watermark. (Cá nhân tôi nghĩ insert tất cả vào rồi dùng lệnh update Enable = 0 thì sẽ nhanh hơn)
- Nếu bạn load cả [Flat Files](03-Determine-etl-tables-and-generate-query.md#flat-files) thì nên thay đổi thông tin input_directory, archive_directory ở [script insert](SQL_Script/_9999_ETLMaster.sql) trước khi insert vào etl_connection.
