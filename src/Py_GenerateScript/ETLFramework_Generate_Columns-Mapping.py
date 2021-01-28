#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import pandas as pd
import pandas.io.sql
import glob, os
import pyodbc
import pymssql
import psycopg2
from mysql import connector as mysql_connector
import pymysql
import pymongo
import urllib
import datetime
from chardet.universaldetector import UniversalDetector
from unidecode import unidecode
import cx_Oracle
import re


# In[2]:


# Configure Oracle Instant Client
cx_Oracle.init_oracle_client(lib_dir=r"C:\oracle\product\instantclient_19_9")


# # 1. General

# In[3]:


# special list
list_null = ['nan','None']


# ## 1.1 Get connection string

# In[4]:


def get_connection_string_sqlserver(server, database, user, password, port= 1433):
    '''
    Return a connection string SQL Server.
    '''
    port = int(port) if str(port) not in list_null else 1433
    driver = '{ODBC Driver 17 for SQL Server}' if '.database.windows.net' in str(server) else '{SQL Server}'
    conn_str = 'DRIVER=' + str(driver) + ';SERVER=' + str(server) + ';DATABASE=' + str(database) + ';'
    if str(port) not in list_null:
        conn_str += 'PORT=' + str(port) +';'
    if str(user) not in list_null:
        conn_str += 'UID=' + str(user) + ';PWD=' + str(password) + ';'
    else:
        conn_str += 'Trusted_Connection=yes;'
    
    return conn_str


# # 2. Get object type

# ## 2.1 SQL Server type

# In[5]:


def get_object_type_sqlserver(object_name, server, database, user, password, port= 1433):
    '''
    Return a object type.
    https://docs.microsoft.com/en-us/sql/relational-databases/system-catalog-views/sys-objects-transact-sql?view=sql-server-ver15
    '''
    conn_str = get_connection_string_sqlserver(server=server, database=database, user=user, password=password, port= port)
    conn = pyodbc.connect(conn_str)
    query = "SELECT type FROM sys.objects WHERE object_id = OBJECT_ID(?)"
    data = (object_name,)
    cur = conn.cursor()
    cur.execute(query,data)
    result = cur.fetchall()
    cur.close()
    conn.close()
    result = result[0][0].strip() if len(result) > 0 else None
    return result


# In[6]:


# get_object_type_sqlserver('sp_select_lead_partner','datatyksql.database.windows.net','easycredit','Datatyk','P@ssword123',None)


# ## 2.2 Postgresql type

# In[7]:


def get_object_type_postgresql(object_name, server, database, user, password, port=5432):
    '''
    Return V if the result is VIEW,SYSTEM VIEW
    Return U if the result is else VIEW,SYSTEM VIEW
    Return FN if the result is FUNCTION
    Return # if the result is else FUNCTION
    Return N/A if the result is else
    '''
    port = int(port) if str(port) not in list_null else 5432
    flag = object_name.rfind('.')
    schema_name = object_name[:object_name.rfind('.')] if flag >= 0 else 'public'
    obj_name = object_name[object_name.rfind('.')+1:]
    query = "select table_type from information_schema.tables where table_schema = %s and table_name = %s"
    data = (schema_name, obj_name)
    conn = psycopg2.connect(host=server, database=database, user=user, password=password, port=port)
    cur = conn.cursor()
    cur.execute(query, data)
    result = cur.fetchall()
    if len(result) > 0:
        result = 'V' if result[0][0] in ['VIEW','SYSTEM VIEW'] else 'U'
    else:
        query = '''select routine_type 
        from information_schema.routines 
        where routine_schema = %s and routine_name = %s order by specific_name desc;'''
        cur = conn.cursor()
        cur.execute(query, data)
        result = cur.fetchall()
        if len(result) > 0:
            result = 'FN' if result[0][0] == 'FUNCTION' else '#'
        else:
            result = 'N/A'
    cur.close()
    conn.close()
    return result


# In[8]:


# get_object_type_postgresql('actor', 'HIEUDO', 'dvdrental', 'hieudo', 'P@ssw0rd1', port=5432)


# ## 2.3 MySQL type

# In[9]:


def get_object_type_mysql(object_name, server, database, user, password, port=3306):
    '''
    Return V if the result is VIEW,SYSTEM VIEW
    Return U if the result is else VIEW,SYSTEM VIEW
    Return P if the result is PROCEDURE
    Return # if the result is else PROCEDURE
    Return N/A if the result is else
    '''
    port = int(port) if str(port) not in list_null else 3306
    flag = object_name.rfind('.')
    schema_name = object_name[:object_name.rfind('.')] if flag >= 0 else database
    obj_name = object_name[object_name.rfind('.')+1:]
    query = "select table_type from information_schema.tables where table_schema = %s and table_name = %s"
    data = (schema_name, obj_name)
    conn = pymysql.connect(host=server, database=database, user=user, password=password, port=port)
    cur = conn.cursor()
    cur.execute(query, data)
    result = cur.fetchall()
    if len(result) > 0:
        result = 'V' if result[0][0] in ['VIEW','SYSTEM VIEW'] else 'U' 
    else:
        query = '''select routine_type 
        from information_schema.routines 
        where routine_schema = %s and routine_name = %s order by specific_name desc;'''
        cur = conn.cursor()
        cur.execute(query, data)
        result = cur.fetchall()
        if len(result) > 0:
            result = 'P' if result[0][0] == 'PROCEDURE' else '#'
        else:
            result = 'N/A'
    cur.close()
    conn.close()
    return result


# In[10]:


# get_object_type_mysql('customers', 'HIEUDO', 'classicmodels', 'hieudo', 'P@ssw0rd1', port=3306)


# ## 2.4 Oracle type

# In[11]:


def get_object_type_oracle(object_name, server, user, password, port=1521, service_name=''):
    '''
    Return V if the result is VIEW
    Return U if the result is TABLE
    Return P if the result is PROCEDURE
    Return FN if the result is FUNCTION
    Return # if the result is else things
    Return N/A if the result is Unknown
    '''
    port = int(port) if str(port) not in list_null else 1521
    flag = object_name.rfind('.')
    owner = object_name[:object_name.rfind('.')] if flag >= 0 else user
    obj_name = object_name[object_name.rfind('.')+1:]
    query = "select object_type from sys.all_objects where owner = :owner and object_name = :object_name"
    data = (owner.upper(), obj_name.upper())
    dsn = server + ':' + str(port)
    if str(service_name) not in list_null and len(service_name) > 0:
        dsn += '/' + service_name
    conn = cx_Oracle.connect(user= user, password= password, dsn= dsn, encoding="UTF-8")
    cur = conn.cursor()
    cur.execute(query, data)
    result = cur.fetchall()
    if len(result) > 0:
        result = result[0][0]
        if result in ['VIEW']:
            result = 'V'
        elif result in ['TABLE']:
            result = 'U'
        elif result in ['FUNCTION']:
            result = 'FN'
        elif result in ['PROCEDURE']:
            result = 'P'
        else:
            result = '#'
        return result
    else:
        result = 'N/A'
    cur.close()
    conn.close()
    return result


# In[12]:


# get_object_type_oracle(object_name='product', server='52.187.41.67', user='hieudo', password='123', port=1521)


# ## 2.99 General TYPE

# In[13]:


def get_object_type(object_name, server, database, user, password, db_type='sqlserver', port= 1433, service_name= ''):
    '''
    Return Object Type of a object name in a database.
    '''
#     password = urllib.parse.quote(str(password))
    result = ''
    if db_type.lower() in ['sql server','sqlserver']:
        result = get_object_type_sqlserver(object_name=object_name, server=server, database=database,
                                           user=user, password=password, port=port)
    elif db_type.lower() in ['postgresql','postgres']:
        result = get_object_type_postgresql(object_name=object_name, server=server, database=database,
                                            user=user, password=password, port=port)
    elif db_type.lower() in ['mysql','my sql']:
        result = get_object_type_mysql(object_name=object_name, server=server, database=database,
                                       user=user, password=password, port=port)
    elif db_type.lower() in ['oracle']:
        result = get_object_type_oracle(object_name=object_name, server=server, user=user, 
                                        password=password, port=port, service_name=service_name)
    elif db_type.lower() in ['mongodb']:
        # C: Collection
        result = 'C'
    elif db_type.lower() == 'excel':
        result = 'excel'
    elif db_type.lower() == 'csv':
        result = 'csv'
    else:
        pass
    return result


# # 3. Get columns

# ## 3.1 Columns of Text file

# In[14]:


def get_columns_textfile(db_type='excel', input_directory='N/A', search_pattern='*.*', 
                         partsheetname_or_delimited = ',', skip_line_number = 0):
    '''
    Input:
        - database_type: excel,csv
        - input_directory: directory of files
        - search_pattern: *.*
        - partsheetname_or_delimited: part sheet name with excel, delimited with csv
        - skip_line_number: skip line number of files
    Output: a DataFrame
        - name: name of columns
        - raw_data_type: data type of DataFrame
        - data_type: data types are converted to SQL Server
    '''
    skip_line_number = 0 if str(skip_line_number) in list_null else int(skip_line_number)
    result = None
    dic_dtypes = {'int64':'int','float64':'float','object':'nvarchar(255)','datetime64[ns]':'datetime','datetime64':'datetime',
                 'bool':'bit'}
    if db_type.lower() == 'excel':
        directory = input_directory if input_directory[-1] != '\\' else (input_directory[:-1])
        os.chdir(directory)
        file_name = glob.glob(search_pattern)[0]
        path = os.path.join(directory, file_name)
        if os.path.isfile(path):
            excel = pd.ExcelFile(path)
            sheet_names = [str(sheet_name) for sheet_name in excel.sheet_names if str(partsheetname_or_delimited) in str(sheet_name)]
            sheetname = sheet_names[0] if len(sheet_names) > 0 else excel.sheet_names[0]
            result = excel.parse(sheetname , skiprows = skip_line_number).dtypes.to_frame()
            result = result.reset_index().rename(columns={0:'raw_data_type','index':'name'})
            result['data_type'] = result['raw_data_type'].apply(lambda x: dic_dtypes.get(str(x)))
            result['name'] = result['name'].str.strip().apply(lambda x: unidecode(x))
            result['is_key'] = np.nan
        else:
            pass
    elif db_type.lower() == 'csv':
        directory = input_directory if input_directory[-1] != '\\' else (input_directory[:-1])
        os.chdir(directory)
        file_name = glob.glob(search_pattern)[0]
        path = os.path.join(directory, file_name)
        ## detect encoding
        detector = UniversalDetector()
        detector.reset()
        for line in open(path, 'rb'):
            detector.feed(line)
            if detector.done: break
        detector.close()
        encoding_file = detector.result.get('encoding')
        ## detect encoding
        if os.path.isfile(path):
            result = pd.read_csv(path, delimiter = partsheetname_or_delimited, skiprows = skip_line_number,
                                encoding=encoding_file).dtypes.to_frame()
            result = result.reset_index().rename(columns={0:'raw_data_type','index':'name'})
            result['data_type'] = result['raw_data_type'].apply(lambda x: dic_dtypes.get(str(x),'Unknown'))
            result['name'] = result['name'].str.strip().apply(lambda x: unidecode(x))
            result['is_key'] = np.nan
        else:
            pass
    else:
        pass
    return result


# In[15]:


# result = get_columns_textfile(db_type='csv', input_directory=r'C:\Users\nguye\Downloads', search_pattern='DATAKYT*.csv', 
#                           partsheetname_or_delimited = ',', skip_line_number = 0)


# ## 3.2 Columns of SQL Server

# In[16]:


def get_columns_sqlserver(object_name, server, database, user, password, port=1433):
    '''
    Input:
        - object_name: name of table/view/procedure
        - server: server name/ip server
        - database: database name
        - user: user name
        - password: password
        - port: port of server
    Output: a DataFrame
        - name: name of columns
        - raw_data_type: data type of SQL Server
        - data_type: data types are converted to SQL Server
        - is_key: column is primary key of object_name (TABLE:U)
    '''
    conn_str = get_connection_string_sqlserver(server=server, database=database, user=user, password=password, port= port)
    query = "DECLARE @object NVARCHAR(255) = N'"+ object_name +"""';
IF EXISTS(SELECT 1 FROM sys.objects WHERE (type = 'P' OR type = 'V' OR type = 'U') AND object_id = OBJECT_ID(@object))
BEGIN
    DECLARE @object_type CHAR(2);
    SELECT @object_type = type FROM sys.objects WHERE object_id = OBJECT_ID(@object);
    DECLARE @tsql NVARCHAR(500) = IIF(@object_type = 'P', N'EXEC ', N'SELECT * FROM ') + @object;
    EXEC sp_describe_first_result_set @tsql = @tsql;
END;"""
    objecttype = get_object_type_sqlserver(object_name=object_name, server=server, database=database, 
                                           user=user, password=password, port=port)
    if not objecttype is None:
        conn_str = get_connection_string_sqlserver(server=server, database=database, user=user, password=password, port= port)
        conn = pyodbc.connect(conn_str)
        result = pandas.read_sql(query, conn)
        conn.close()
        result['raw_data_type'] = result['system_type_name']
        result = result[['name','raw_data_type','system_type_name']].rename(columns={'system_type_name':'data_type'})
        result['name'] = result['name'].str.strip()
        dic_data_type = {'hierarchyid':'nvarchar(1000)'}
        result['data_type'] = result['data_type'].apply(lambda x: dic_data_type.get(x,x))
        
        ### get column key
        flag = object_name.rfind('.')
        schema_name = object_name[:object_name.rfind('.')].strip() if flag >= 0 else 'dbo'
        obj_name = object_name[object_name.rfind('.')+1:].strip()
        if objecttype in ['U']:
            query = "DECLARE @schema NVARCHAR(255) = N'"+ schema_name +"';\n"
            query += "DECLARE @table NVARCHAR(255) = N'"+ obj_name +"';\n"
            query += '''SELECT COLUMN_NAME AS [name]
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC
        INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KU
            ON TC.CONSTRAINT_TYPE = 'PRIMARY KEY'
               AND TC.CONSTRAINT_NAME = KU.CONSTRAINT_NAME
               AND KU.TABLE_SCHEMA = @schema
               AND KU.TABLE_NAME = @table
    ORDER BY KU.TABLE_NAME,
             KU.ORDINAL_POSITION;'''
            conn = pyodbc.connect(conn_str)
            cols_key = pandas.read_sql(query, conn)
            conn.close()
            result['is_key'] = result['name'].apply(lambda x: (1 if x in cols_key['name'].values else None))
        else:
            result['is_key'] = np.nan
#             result.loc[0,'is_key'] = 1
    else:
        result = None
        
    return result


# In[17]:


# get_columns_sqlserver('HumanResources.Employee', 'localhost', 'adventureworks2012', None, None, port=1433)


# ## 3.3 Columns Postgresql

# In[18]:


def get_columns_postgresql(object_name, server, database, user, password, port=5432):
    '''
    Input:
        - object_name: name of table/view/function
        - server: server name/ip server
        - database: database name
        - user: user name
        - password: password
        - port: port of server
    Output: a DataFrame
        - name: name of columns
        - raw_data_type: data type of PostgreSQL
        - data_type: data types are converted to SQL Server
        - is_key: column is primary key of object_name (TABLE:U)
    '''
    port = int(port) if str(port) not in list_null else 5432
    result = ''
    flag = object_name.rfind('.')
    schema_name = object_name[:object_name.rfind('.')] if flag >= 0 else 'public'
    obj_name = object_name[object_name.rfind('.')+1:]
    data = (schema_name, obj_name)
    
    objecttype = get_object_type_postgresql(object_name=object_name, server=server, database=database,
                                            user=user, password=password, port=port)
    conn = psycopg2.connect(host=server, database=database, user=user, password=password, port=port)
    if objecttype in ['U','V']:
        query = '''
select column_name, data_type, udt_name as data_type_2, concat('(',character_maximum_length,')') as character_length
from information_schema.columns
where table_schema = %s
and table_name = %s
order by ordinal_position;'''
        cur = conn.cursor()
        cur.execute(query, data)
        result = cur.fetchall()
        cur.close()
    elif objecttype == 'FN':
        query = '''
select p.parameter_name as column_name, p.data_type as data_type, p.udt_name as data_type_2, null as character_length
from information_schema.parameters p
	LEFT JOIN information_schema.routines r ON r.specific_name=p.specific_name
where p.parameter_mode = 'OUT'
and r.specific_schema = %s
and r.routine_name= %s
and p.specific_name = (select r1.specific_name
					   from information_schema.routines r1
					   where r1.specific_schema = r.specific_schema
					   and r1.routine_name = r.routine_name
					   order by r1.specific_name desc
					   limit 1)
ORDER BY p.ordinal_position;'''
        cur = conn.cursor()
        cur.execute(query, data)
        result = cur.fetchall()
        cur.close()
    else:
        pass
    if len(result)>0:
        result = pd.DataFrame(result)
        dic_data_type = {'bigint': 'bigint','bytea':'varbinary(max)','boolean':'bit','bool':'bit',
                         'char':'nvarchar(255)','character':'nvarchar(255)','date':'datetime',
                         'timestamp without time zone':'datetime','timestamp':'datetime',
                         'decimal':'float','dec':'float','double':'float','double precision':'float',
                         'float':'float','numeric':'float','real':'real',
                         'integer': 'int','int':'int','money':'money','smallint': 'smallint',
                         'varchar':'nvarchar(255)','xml':'xml',
                         'character varying':'nvarchar(255)','text':'nvarchar(max)',
                         'tsvector' : 'nvarchar(max)','USER-DEFINED':'nvarchar(max)','ARRAY':'nvarchar(max)'}
        list_data_type_raw = ['USER-DEFINED','ARRAY']
        result['raw_data_type'] = np.where(result.iloc[:,1].isin(list_data_type_raw), result.iloc[:,2], result.iloc[:,1])
        if objecttype in ['U','V']:
            result.iloc[:,1] = np.where(result.iloc[:,2].str.contains('char'),'nvarchar'+result.iloc[:,3],result.iloc[:,1])
        result['data_type'] = result.iloc[:,1].apply(lambda x: dic_data_type.get(x,x))
#         return result
        result = result.iloc[:,[0,4,5]].rename(columns={0:'name'})
        result['name'] = result['name'].str.strip()
        
        ### get is_key column
        if objecttype in ['U']:
            query = '''
SELECT ccu.column_name AS name
FROM information_schema.table_constraints tc 
JOIN information_schema.constraint_column_usage AS ccu USING (constraint_name, table_schema, table_name)
WHERE tc.constraint_type='PRIMARY KEY'
	AND ccu.table_schema=%s
	AND ccu.table_name =%s;
            '''
            cur = conn.cursor()
            cur.execute(query, data)
            cols_key = cur.fetchall()
            cur.close()
            cols_key = pd.DataFrame(cols_key)
            result['is_key'] = result['name'].apply(lambda x: (1 if x in cols_key.iloc[:,0].values else None))
        else:
            result['is_key'] = np.nan
#             result.loc[0,'is_key'] = 1
    else:
        result = None
    # close connection
    conn.close()
    return result


# In[19]:


# get_columns_postgresql('actor', 'localhost', 'dvdrental', 'hieudo', 'P@ssw0rd1', port=5432)


# ## 3.4 Columns MySQL

# In[20]:


def get_columns_mysql(object_name, server, database, user, password, port=3306):
    '''
    Input:
        - object_name: name of table/view/procedure
        - server: server name/ip server
        - database: database name
        - user: user name
        - password: password
        - port: port of server
    Output: a DataFrame
        - name: name of columns
        - raw_data_type: data type of MySQL
        - data_type: data types are converted to SQL Server
    '''
    port = int(port) if str(port) not in list_null else 3306
    result = ''
    flag = object_name.rfind('.')
    schema_name = object_name[:object_name.rfind('.')] if flag >= 0 else database
    obj_name = object_name[object_name.rfind('.')+1:]
    data = (schema_name, obj_name)
    
    objecttype = get_object_type_mysql(object_name=object_name, server=server, database=database,
                                       user=user, password=password, port=port)
    conn = pymysql.connect(host=server, database=database, user=user, password=password, port=int(port))
    if objecttype in ['U','V']:
        query = '''
select column_name, data_type, column_type as data_type_2, concat('(',character_maximum_length,')') as character_length
from information_schema.columns
where table_schema = %s
and table_name = %s
order by ordinal_position;'''
        cur = conn.cursor()
        cur.execute(query, data)
        result = cur.fetchall()
        cur.close()
    elif objecttype == 'P':
        data = (datetime.date(1900,1,1),datetime.datetime.now())
        query = 'CALL ' + object_name + '(%s, %s)'
        try:
            result = pd.read_sql(query,conn,params=data).head(1)
        except:
            query = 'CALL ' + object_name + '()'
            result = pd.read_sql(query,conn).head(1)
        finally:
            pass
    else:
        pass
    #return result
    if len(result)>0 and objecttype in ['U','V']:
        result = pd.DataFrame(result)
        dic_data_type = {'tinyint':'tinyint','smallint': 'smallint','int': 'int','mediumint':'int','bigint': 'bigint',
                         'decimal':'float','float':'float','double':'float','real':'float','numeric':'float',
                         'datetime':'datetime','date':'datetime','time':'time','timestamp':'datetime',
                         'year':'smallint','enum':'nvarchar(255)','set':'nvarchar(255)',
                         'char':'nvarchar(255)','varchar':'nvarchar(255)','tinytext':'nvarchar(255)',
                         'text':'nvarchar(max)','mediumtext':'nvarchar(max)','longtext':'nvarchar(max)',
                         'USER-DEFINED':'nvarchar(500)', 'ARRAY':'nvarchar(max)','geometry' : 'nvarchar(max)',
                         'binary':'varbinary(4000)','varbinary':'varbinary(8000)','tinyblob':'varbinary(4000)',
                         'blob':'varbinary(max)','mediumblob':'varbinary(max)','longblob':'varbinary(max)',
                         'boolean':'bit','bool':'bit'}
        result.iloc[:,1] = np.where(result.iloc[:,1].str.contains('char',regex=False),'nvarchar'+result.iloc[:,3],result.iloc[:,1])
        result['data_type'] = result.iloc[:,1].apply(lambda x: dic_data_type.get(x,x))
        result = result.iloc[:,[0,2,4]].rename(columns={0:'name',2:'raw_data_type'})
        
        ### get column is_key
        if objecttype in ['U']:
            query = '''
SELECT column_name as name
FROM information_schema.table_constraints AS tc 
JOIN information_schema.key_column_usage AS kcu USING(constraint_name,table_schema,table_name)
WHERE tc.constraint_type='PRIMARY KEY'
	AND kcu.table_schema=%s
    AND kcu.table_name=%s;
            '''
            cur = conn.cursor()
            cur.execute(query, data)
            cols_key = cur.fetchall()
            cur.close()
            cols_key = pd.DataFrame(cols_key)
            result['is_key'] = result['name'].apply(lambda x: (1 if x in cols_key.iloc[:,0].values else None))
        else:
            result['is_key'] = np.nan
#             result.loc[0,'is_key'] = 1
    elif len(result)>0 and objecttype in ['P']:
        dic_dtypes = {'int64':'int','float64':'float','object':'nvarchar(255)','datetime64[ns]':'datetime',
                      'datetime64':'datetime'}
        result = pd.DataFrame(result.dtypes)
        result['name'] = result.index
        result['raw_data_type'] = result[0]
        result['data_type'] = result['raw_data_type'].apply(lambda x: dic_dtypes.get(str(x),'Unknown'))
        result = result[['name','raw_data_type','data_type']]
        result.reset_index(drop=True)
        result['name'] = result['name'].str.strip()
        
        ### get column is_key
        result['is_key'] = np.nan
    else:
        result = None
    conn.close()
    return result


# In[21]:


# get_columns_mysql('products', 'localhost', 'classicmodels', 'hieudo', 'P@ssw0rd1', port=3306)


# ## 3.5 Columns Oracle

# In[22]:


def get_columns_oracle(object_name, server, user, password, port=1521, source_object_parameters='', service_name=''):
    '''
    Input:
        - object_name: name of table/view/function
        - server: server name/ip server
        - user: user name
        - password: password
        - port: port of server
        - service_name: service name of instance
    Output: a DataFrame
        - name: name of columns
        - raw_data_type: data type of PostgreSQL
        - data_type: data types are converted to SQL Server
        - is_key: column is primary key of object_name (TABLE:U)
    '''
    port = int(port) if str(port) not in list_null else 1521
    if str(source_object_parameters) in list_null:
        source_object_parameters = ''
    result = None
    object_type = get_object_type_oracle(object_name=object_name, server=server, user=user, password=password,
                                         port=port, service_name=service_name)
    
    flag = object_name.rfind('.')
    owner = object_name[:object_name.rfind('.')] if flag >= 0 else user
    obj_name = object_name[object_name.rfind('.')+1:]
    data = (owner.upper(), obj_name.upper())
    dsn = server + ':' + str(port)
    if str(service_name) not in list_null and len(service_name) > 0:
        dsn += '/' + service_name
    conn = cx_Oracle.connect(user= user, password= password, dsn= dsn, encoding="UTF-8")
    # python library data type 2 oracle data type
    pytype2otype_dict = {cx_Oracle.DB_TYPE_BFILE:"BFILE",
cx_Oracle.DB_TYPE_BINARY_DOUBLE:"BINARY_DOUBLE",
cx_Oracle.DB_TYPE_BINARY_FLOAT:"BINARY_FLOAT",
cx_Oracle.DB_TYPE_BLOB:"BLOB",
cx_Oracle.DB_TYPE_CHAR:"CHAR",
cx_Oracle.DB_TYPE_CLOB:"CLOB",
cx_Oracle.DB_TYPE_CURSOR:"CURSOR",
cx_Oracle.DB_TYPE_DATE:"DATE",
cx_Oracle.DB_TYPE_INTERVAL_DS:"INTERVAL DAY TO SECOND",
cx_Oracle.DB_TYPE_JSON:"JSON",
cx_Oracle.DB_TYPE_LONG:"LONG",
cx_Oracle.DB_TYPE_LONG_RAW:"LONG RAW",
cx_Oracle.DB_TYPE_NCHAR:"NCHAR",
cx_Oracle.DB_TYPE_NCLOB:"NCLOB",
cx_Oracle.DB_TYPE_NUMBER:"NUMBER",
cx_Oracle.DB_TYPE_NVARCHAR:"NVARCHAR2",
cx_Oracle.DB_TYPE_OBJECT:"OBJECT",
cx_Oracle.DB_TYPE_RAW:"RAW",
cx_Oracle.DB_TYPE_ROWID:"ROWID",
cx_Oracle.DB_TYPE_TIMESTAMP:"TIMESTAMP",
cx_Oracle.DB_TYPE_TIMESTAMP_LTZ:"TIMESTAMP WITH LOCAL TIME ZONE",
cx_Oracle.DB_TYPE_TIMESTAMP_TZ:"TIMESTAMP WITH TIME ZONE",
cx_Oracle.DB_TYPE_ROWID:"UROWID",
cx_Oracle.DB_TYPE_VARCHAR:"VARCHAR2",
}
    
    if object_type in ['U','V']:
        query = '''select column_name, data_type, char_length, char_col_decl_length, data_precision, data_scale, 
case nullable when 'N' then 0 when 'Y' then 1 else (null) end as nullable
from sys.all_tab_columns 
where owner = :owner and table_name = :table_name order by column_id'''
        cur = conn.cursor()
        cur.execute(query, data)
        result = cur.fetchall()
        cur.close()
    elif object_type in ['FN']:
        query = object_name
        cur = conn.cursor()
        paras = []
        [paras.append(x.strip()) for x in source_object_parameters.split(',') if len(x) > 0]
        result = cur.callfunc(query, cx_Oracle.DB_TYPE_CURSOR, paras)
        result = result.description
    elif object_type in ['P']:
        query = object_name
        cur = conn.cursor()
        output = cur.var(cx_Oracle.DB_TYPE_CURSOR)
        paras = []
        paras.append(output)
        [paras.append(x.strip()) for x in source_object_parameters.split(',') if len(x) > 0]
        try:
            cur.callproc(query, paras)
        except:
            paras = []
            [paras.append(x.strip()) for x in source_object_parameters.split(',') if len(x) > 0]
            paras.append(output)
            cur.callproc(query, paras)
        result = output.getvalue().description
    else:
        pass
    otype2stype_list = [("BFILE", "VARBINARY(MAX)", 0),
("BINARY_DOUBLE", "float", 0),
("BINARY_FLOAT", "float", 0),
("BLOB", "VARBINARY(MAX)", 0),
("CURSOR", "CURSOR", 0),
("DATE", "DATETIME", 0),
("INTERVAL DAY.*TO SECOND.*", "DATETIME", 0),
("JSON", "NVARCHAR(MAX)", 0),
("LONG RAW", "IMAGE", 0),
("LONG", "VARCHAR(MAX)", 0),
("NCLOB", "NVARCHAR(MAX)", 0),
("CLOB", "VARCHAR(MAX)", 0),
("NUMBER", "FLOAT", 0),
("OBJECT", "NVARCHAR(MAX)", 0),
("RAW", "VARBINARY(2000)", 0),
("UROWID", "CHAR(18)", 0),
("ROWID", "CHAR(18)", 0),
("TIMESTAMP.*WITH LOCAL TIME ZONE", "VARCHAR(37)", 0),
("TIMESTAMP.*WITH TIME ZONE", "VARCHAR(37)", 0),
("TIMESTAMP.*", "DATETIME", 0),
("NVARCHAR2", "NVARCHAR", 1),
("NCHAR", "NCHAR", 1),
("VARCHAR2", "VARCHAR", 1),
("CHAR", "CHAR", 1)
]
    def get_data_type_sqlserver(data_type, char_length=255):
        #, char_col_decl_length=255, data_precision=20, data_scale=5, nullable=1):
        for otype2stype in otype2stype_list:
            prog = re.compile(otype2stype[0])
            match = prog.search(str(data_type))
            if match:
                data_type = otype2stype[1]
                if otype2stype[2] == 1:
                    data_type += '(' + str(char_length) + ')'
                break
            else:
                continue
        return data_type
    if len(result)>0:
        columns = ['column_name', 'data_type', 'char_length', 'char_col_decl_length', 
                   'data_precision', 'data_scale', 'nullable']
        result = pd.DataFrame(result, columns=columns)
        result['data_type'] = result['data_type'].apply(lambda x: pytype2otype_dict.get(x,x))
        result['data_type_sqlserver'] = result.apply(lambda x: get_data_type_sqlserver(x['data_type'], x['char_length']), axis=1)
        result = result[['column_name', 'data_type', 'data_type_sqlserver']].rename(columns={'column_name':'name',
                'data_type':'raw_data_type', 'data_type_sqlserver':'data_type'})
        ## get is_key column
        if object_type in ['U']:
            query = '''select cols.column_name as name
--cols.table_name, cols.column_name, cols.position, cons.status, cons.owner
FROM all_constraints cons, all_cons_columns cols
WHERE cons.constraint_type = 'P'
AND cons.owner = :owner
AND cols.table_name = :table_name
AND cons.constraint_name = cols.constraint_name
AND cons.owner = cols.owner
ORDER BY cols.table_name, cols.position'''
            cur = conn.cursor()
            cur.execute(query, data)
            cols_key = cur.fetchall()
            cur.close()
            result['is_key'] = result['name'].apply(lambda x: 1 if x in cols_key[0] else np.nan) if len(cols_key)>0 else np.nan
        else:
            result['is_key'] = np.nan
    else:
        result = None
    # close connection
    conn.close()
    return result


# In[23]:


get_columns_oracle(object_name='get_products', server='40.65.143.121', user='hieudo', password='123', port=1521)


# ## 3.6 Columns MongoDB

# In[24]:


def get_columns_mongodb(object_name, server, database, user, password, port=27017):
    '''
    Input:
        - object_name: name of table/view/procedure
        - server: server name/ip server
        - database: database name
        - user: user name
        - password: password
        - port: port of server
    Output: a DataFrame
        - name: name of columns
        - raw_data_type: data type of MongoDB
        - data_type: data types are converted to SQL Server
        - is_key: column is primary key of object_name
    '''
    port = int(port) if str(port) not in list_null else 27017
    result = ''
    conn_str = "mongodb://" + str(user) +":" + urllib.parse.quote(str(password)) +"@" + str(server) +":"+ str(int(port)) +"/"
    print(conn_str)
    myclient = pymongo.MongoClient(conn_str)
    mydb = myclient[str(database)]
    mycol = mydb[str(object_name)]
    df = pd.DataFrame.from_records(mycol.find()).head()
    dic_dtypes = {'int64':'int','float64':'float','object':'nvarchar(1000)','datetime64[ns]':'datetime','datetime64':'datetime',
                 "<class 'dict'>":'nvarchar(max)', "<class 'list'>":'nvarchar(max)'}
    result = pd.DataFrame(df.dtypes)
    cols_sys = ['_id','_updatedat','_insertedat','_logid','_logid_list','_filelogid','_filelogid_list']
    result['name'] = result.index
    condition = result['name'].isin(cols_sys)
    result['name'][condition] = result['name'][condition] + '_mongodb'
    result['raw_data_type1'] = df.iloc[0,:].apply(lambda x: type(x))
    result['raw_data_type2'] = result[0]
    result['raw_data_type'] = np.where(result['raw_data_type1'].isin([type({}),type([])]),
                                       result['raw_data_type1'],result['raw_data_type2'])
    result['data_type'] = result['raw_data_type'].apply(lambda x: dic_dtypes.get(str(x),'Unknown'))
    result = result[['name','raw_data_type','data_type']]
    result['name'] = result['name'].str.strip()
    
    ### get column is_key
    result['is_key'] = np.nan
    result.iloc[0,result.columns.get_loc('is_key')] = 1
    return result


# In[25]:


# get_columns_mongodb('restaurants','192.168.1.69','sample_db','hieudo','P@ssw0rd1')


# ## 3.99 General Columns

# In[26]:


def get_columns(object_name, server, database, user, password, db_type='sqlserver', port = 1433,
                source_object_parameters = '', service_name='',
                input_directory='N/A', partsheetname_or_delimited = ',', skip_line_number = 0):
    result = ''
    if str(port) not in list_null:port = int(port)
    # SQL Server
    if db_type.lower() in ['sql server','sqlserver']:
        result = get_columns_sqlserver(object_name=object_name, server=server, database=database, 
                                       user=user, password=password, port=port)
    # Postgresql
    elif db_type.lower() in ['postgresql','postgres']:
        result = get_columns_postgresql(object_name=object_name, server=server, database=database, 
                                        user=user, password=password, port=port)
    # MySQL
    elif db_type.lower() in ['mysql','my sql']:
        result = get_columns_mysql(object_name=object_name, server=server, database=database, 
                                   user=user, password=password, port=port)
    # Oracle
    elif db_type.lower() in ['oracle']:
        result = get_columns_oracle(object_name=object_name, server=server, user=user, password=password, 
                                    port=port, source_object_parameters=source_object_parameters, service_name=service_name)
    # MongoDB
    elif db_type.lower() in ['mongodb']:
        result = get_columns_mongodb(object_name=object_name, server=server, database=database, 
                                     user=user, password=password, port=port)
    elif db_type.lower() in ['excel','csv']:
        result = get_columns_textfile(db_type=db_type, 
                                      input_directory=input_directory, 
                                      search_pattern=object_name, 
                                      partsheetname_or_delimited = partsheetname_or_delimited, 
                                      skip_line_number = skip_line_number)
    else:
        pass
    return result


# # Start code

# In[27]:


#fullpath_config = input('Input full path file config:')
#fullpath_config = r'C:\Users\nguye\OneDrive\Datatyk\Lavie_Staging\_Config.xlsx'
#directory_config = fullpath_config[:fullpath_config.rfind('\\')]

directory_config = os.getcwd()

list_files = [f for f in glob.glob('_config*')]
list_files_mtime = [os.path.getmtime(x) for x in list_files]
fullpath_config = directory_config + '\\' + list_files[list_files_mtime.index(max(list_files_mtime))]


connection = pd.read_excel(fullpath_config, sheet_name='Connection')
mappingtable = pd.read_excel(fullpath_config, sheet_name='MappingTable')
mappingtable = mappingtable[mappingtable['enable_generate']==1]


# In[28]:


mt = mappingtable.merge(connection, left_on='source_connection_id', right_on='connection_id', how='left',suffixes=('_mid','_src'))
mt = mt.merge(connection, left_on='destination_connection_id', right_on='connection_id', how='left',suffixes=('_src','_des'))
mt['object_type'] = None
mt['destination_table_is_exists'] = None
mt['scds'] = 1
mt['is_overwrite'] = 1
mt['enable_generate'] = 1
mt['enable_generate_sp_select_source'] = 1
mt['enable_generate_sp_select_destination'] = 1
mt['ordinal'] = mt.index
mt['destination_table_type'] = ''
mt['source_object'] = mt['source_object'].apply(lambda x: x.strip())
mt['destination_table'] = mt['destination_table'].apply(lambda x: x.replace(' ',''))


# In[29]:


list_columns_mapping = None
global flag_obj_name
list_na = ['nan','None']
cols_sys = ['_id','_validfrom','_validto','_updatedat','_insertedat','_deletedat','_isactive',
            '_logid','_logid_list','_filelogid','_filelogid_list']

for i, x in mt.iterrows():
    # get time t1
    t1 = np.datetime64('now')
    
    ### Get variables
    server_src = str(x['server_src']).strip()
    database_type_src = str(x['database_type_src']).strip()
    database_src = str(x['database_src']).strip()
    user_src = str(x['user_src']).strip()
    password_src = str(x['password_src']).strip()
    port_src = x['port_src']
    input_directory_src = str(x['input_directory_src']).strip()
    part_sheet_name_or_delimited_src = str(x['part_sheet_name_or_delimited_src']).strip()
    skip_line_number_src = x['skip_line_number_src']
    
    server_des = str(x['server_des']).strip()
    database_type_des = str(x['database_type_des']).strip()
    database_des = str(x['database_des']).strip()
    user_des = str(x['user_des']).strip()
    password_des = str(x['password_des']).strip()
    port_des = x['port_des']
    input_directory_des = str(x['input_directory_des']).strip()
    part_sheet_name_or_delimited_des = str(x['part_sheet_name_or_delimited_des']).strip()
    skip_line_number_des = x['skip_line_number_des']
    
    source_watermark_column = str(x['source_watermark_column']).strip()
    source_object = str(x['source_object']).strip()
    destination_table = str(x['destination_table']).strip()
    source_object_parameters = str(x['source_object_parameters']).strip()
    service_name=''
    ### END
    
    # get flag_object_name
    flag_obj_name = database_type_src + ' - ' + database_src + ' - ' + source_object
    # Get object type Table/View/SP
    object_type_src = get_object_type(source_object, server_src, database_src, 
                                      user_src, password_src, database_type_src, port_src)
    object_type_des = get_object_type(destination_table, server_des, database_des, 
                                      user_des, password_des, database_type_des, port_des)
        
    # Get columns source
    columns_src = get_columns(source_object, server_src, database_src, user_src, 
                              password_src, database_type_src, port_src, source_object_parameters, service_name,
                              input_directory_src, part_sheet_name_or_delimited_src, skip_line_number_src)

    # Get columns destination
    columns_des = get_columns(destination_table, server_des, database_des, user_des, 
                              password_des, database_type_des, port_des, source_object_parameters, service_name,
                              input_directory_des, part_sheet_name_or_delimited_des, skip_line_number_des)

    # Dictionary object type
    dic_objtype = {'U':'TABLE','V':'VIEW', 'P':'STORE PROCEDURE', 'excel': 'EXCEL', 'csv':'CSV','FN':'STORE FUNCTION',
                   'C':'COLLECTION','#':'Object Other', 'N/A':'Unknown', None:None}
    object_type_src_name = dic_objtype.get(object_type_src,'Unknown')
    mt.loc[i,'object_type'] = object_type_src_name
    mt.loc[i,'destination_table_is_exists'] = 0 if object_type_des is None else 1

    # check WatermarkColumn exixts?
    if (source_watermark_column not in list_na 
    and not source_watermark_column in columns_src['name'].values and source_watermark_column.lower() not in cols_sys):
        mt.loc[i,'source_watermark_column'] = np.nan
    
    # Remove columns name contains '_' and remove plank
    columns_src = columns_src[~columns_src['name'].str.lower().isin(cols_sys)]
    columns_src['name2'] = columns_src['name'].apply(lambda x: str(x).replace(' ',''))

    columns_des = columns_src if columns_des is None else columns_des
    columns_des = columns_des[~columns_des['name'].str.lower().isin(cols_sys)]
    columns_des['name2'] = columns_des['name'].apply(lambda x: str(x).replace(' ',''))

    # Get columns mapping source - destination
    all_columns = columns_src.merge(columns_des, left_on='name2', right_on='name2', how='outer',suffixes=('_src','_des'))


    # Mapping Source - Destination
    all_columns['column_name_des'] = all_columns['name_des'].where(~all_columns['data_type_des'].isna(),np.nan)
    all_columns['column_name_des'] = all_columns['column_name_des'].apply(lambda x: str(x).replace(' ',''))
    all_columns['column_name_src'] = all_columns['name_src'].where(~all_columns['data_type_src'].isna(),np.nan)
    all_columns['is_key'] = all_columns['is_key_src']
#     all_columns.loc[0,'is_key'] = 1
    all_columns['index'] = None
    all_columns['ordinal'] = all_columns.index + 1
    all_columns['mapping_table_id'] = i
    if database_type_src.lower() in ['excel','csv','txt','text']:
        mt.loc[i,'collection_type'] = 'File'
        all_columns['source_object'] = (
            source_object + ' - ' + 
            ('ALL_SHEET' if part_sheet_name_or_delimited_src in list_na else '{' + part_sheet_name_or_delimited_src + '}')
        )
    else:
        mt.loc[i,'collection_type'] = 'DB'
        all_columns['source_object'] = database_type_src + ' - ' + source_object

    all_columns['destination_table'] = destination_table

    if list_columns_mapping is None:
        list_columns_mapping = all_columns
    else:
        list_columns_mapping = pd.concat([list_columns_mapping, all_columns], ignore_index=True)
        

    t2 = np.datetime64('now')
    print(t2-t1, ':', database_type_src, '-', database_src, '-', source_object)


# In[31]:


# flag_obj_name
# print(source_object, server_src, database_src, user_src, 
#                               password_src, database_type_src, port_src, source_object_parameters, service_name,
#                               input_directory_src, part_sheet_name_or_delimited_src, skip_line_number_src)


# In[32]:


# Columns: name, data_type_des, data_type_src, ColumnName_des, ColumnName_src, Ordinal, MappingTableID
list_columns_mapping = list_columns_mapping[['mapping_table_id','ordinal','source_object','column_name_src',
                                             'raw_data_type_src','data_type_src','destination_table','column_name_des',
                                             'data_type_des', 'is_key','index']]

list_columns_mapping['dynamic_data_mask'] = None
list_columns_mapping['is_used'] = 1
# mt
mt['batch_type'] = mt['connection_type_src'] + '2' + mt['connection_type_des']
mt['destination_sp_upsert'] = 'sp_upsert_' + mt['destination_table'].str.replace('.','_')
mt['destination_table_type'] = 'type_' + mt['destination_table'].str.replace('.','_')
mt['destination_sp_select'] = 'sp_select_' + mt['destination_table'].str.replace('.','_')
mt['enable_generate_sp_select_destination'] = mt['batch_type'].apply(lambda x: (0 if '2DW' in x else 1))

# made unique ingredient tb_destination
for i, x in mt.iterrows():
    temp = mt[mt['destination_table_type'] == x['destination_table_type']]
    if temp.shape[0] > 1:
        for j, k in temp.iterrows():
            mt.loc[j,'destination_sp_upsert'] += '_' + str(k['source_connection_id'])
            mt.loc[j,'destination_table_type'] += '_' + str(k['source_connection_id'])
            mt.loc[j,'destination_sp_select'] += '_' + str(k['source_connection_id'])
for i, x in mt.iterrows():
    temp = mt[mt['destination_table_type'] == x['destination_table_type']]
    if temp.shape[0] > 1:
        flag_temp = 0
        for j, k in temp.iterrows():
            mt.loc[j,'destination_sp_upsert'] += '_' + str(flag_temp)
            mt.loc[j,'destination_table_type'] += '_' + str(flag_temp)
            mt.loc[j,'destination_sp_select'] += '_' + str(flag_temp)
            flag_temp += 1


def get_sp_select_source_name(object_source, object_type):
    if object_type.upper() in ['TABLE','VIEW']:
        return 'sp_select_' + object_source.replace('.','_')
    else:
        object_source = ''
    return object_source
def get_enable_generate_sp_select_source(object_type):
    if object_type.upper() in ['TABLE','VIEW']:
        return 1
    return 0
mt['source_sp_select'] = mt.apply(lambda x: get_sp_select_source_name(x.source_object, x.object_type), axis=1)
mt['enable_generate_sp_select_source'] = mt.apply(lambda x: get_enable_generate_sp_select_source(x.object_type), axis=1)
# made unique ingredient object_source
for i, x in mt.iterrows():
    temp = mt[mt['source_sp_select'] == x['source_sp_select']]
    if temp.shape[0] > 1:
        for j, k in temp.iterrows():
            if len(mt.loc[j,'source_sp_select']) > 0:
                mt.loc[j,'source_sp_select'] += '_' + str(k['source_connection_id'])
for i, x in mt.iterrows():
    temp = mt[mt['source_sp_select'] == x['source_sp_select']]
    if temp.shape[0] > 1:
        flag_temp = 0
        for j, k in temp.iterrows():
            if len(mt.loc[j,'source_sp_select']) > 0:
                mt.loc[j,'source_sp_select'] += '_' + str(flag_temp)
                flag_temp += 1


# In[33]:


mapping_table = mt[['collection_type','source_watermark_column','batch_type','source_connection_id',
                    'source_object','object_type','destination_connection_id','destination_table',
                    'destination_table_is_exists','destination_sp_upsert', 'destination_table_type','source_sp_select',
                    'destination_sp_select','ordinal',
                    'scds','is_overwrite','enable_generate_sp_select_source','enable_generate_sp_select_destination',
                    'enable_generate']]


# # Export file _Columns-Mapping.xlsx

# In[35]:


file_name_cm = '_Columns-Mapping.xlsx'
file_full_path = directory_config+'\\'+file_name_cm
if os.path.exists(file_full_path):
    timestr = str(datetime.datetime.now())[:16].replace(' ','_').replace(':','-')
    file_name_cm = '_Columns-Mapping_' + timestr + '.xlsx'
file_full_path = directory_config+'\\'+file_name_cm
writer = pd.ExcelWriter(file_full_path, engine='xlsxwriter')
connection.to_excel(writer, sheet_name='Connection', index = False)
mapping_table.to_excel(writer, sheet_name='MappingTable', index_label = 'mapping_table_id')
list_columns_mapping.to_excel(writer, sheet_name='ColumnsMapping', index = False)
writer.save()
writer.close()
print('--------------DONE--------------')
print(file_full_path)


# In[ ]:


# mapping_table

