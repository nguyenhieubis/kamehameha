Run ConsoleApp_TEST_kamehameha
==============================
Mở [folder app_console](app_console) có chứa file (_ConsoleApp_TEST_kamehameha.exe_) để chạy demo.
- Type connection string ETLMaster:
  - Nhập connection dạng [Microsoft SqlClient Data Provider for SQL Server connection strings](https://www.connectionstrings.com/microsoft-data-sqlclient/)
  - Không nhập connection (chỉ ấn Enter) thì connection được hiểu là Server: localhost, Database: ETLMaster, Login by current windows user. "Server=localhost;Database=ETLMaster;Trusted_Connection=True;"
- Type BATCH_TYPE: chỉ nhập 1 trong 2 giá trị Source2Staging hoặc Staging2DW
  - Nhập "Source2Staging" thì ETL data từ source sang staging. Không nhập (chỉ ấn Enter) thì giá trị default cũng là "Source2Staging".
  - Nhập "Staging2DW" thì ETL data từ staging sang data warehouse.
- Type COLLECTION_TYPES: nhập các collection cách nhau bởi dấu phẩy
  - Nhập "File,DB" thì sẽ load 2 collection là File và DB. Không nhập (chỉ ấn Enter) thì giá trị default cũng là "File,DB".
  - Nhập "File" thì sẽ load collection File, ngược lại nhập "DB" thì sẽ load collection DB.
- Type LOAD_TYPE: chỉ nhập 1 trong 3 giá trị 0/1/2
  - Nhập "0" thì sẽ là Incremental Load và nó sẽ áp dụng với các data pipeline có column datetime, nếu không có thì là full load. Không nhập (chỉ ấn Enter) thì giá trị default cũng là "0".
  - Nhập "1" thì sẽ là Full Load. Mỗi lần ETL là sẽ lấy tất cả các dữ liệu ở source và merge với destination.
  - Nhập "2" thì sẽ là Manual Load. Ví dụ: thay vì full load thì sẽ load lại dữ liệu từ ngày 2020-06-01. Bản demo này không áp dụng LOAD_TYPE này.
  