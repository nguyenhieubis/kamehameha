#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import pandas as pd
import datetime
import os, glob
from itertools import chain


# # General

# In[2]:


# Columns are column watermark
cols_watermark = ['_UpdatedAt']


# # 1. Generate store procedure select source

# ## 1.1 sp_select SQL Server

# In[3]:


def generate_sp_select_sqlserver(pd_columns, db_name = 'DATABASE_NAME', objectname = 'TABLE_NAME',
                                 sp_select_source = 'SP_SELECT_SOURCE', watermarkcolumn = 'COLUMN_NAME'):
    """
    input: pd_columns[['column_name_src','column_name_des','raw_data_type_src','data_type_src']]
    0: column_name_src
    1: column_name_des
    2: raw_data_type_src
    3: data_type_src
    """
    # Lấy những column bên source, không có t/h NULL AS Col_Dest
    # Lấy tên column theo tên column source
    result = ''
    #pd_columns = pd_columns[~pd_columns.iloc[:,1].isna()].reset_index(drop = True)
    pd_columns = pd_columns[~pd_columns.iloc[:,0].isna()].reset_index(drop = True)
    watermarkcolumn = str(watermarkcolumn)
    condition = (watermarkcolumn in pd_columns.iloc[:,0].to_string()) or (watermarkcolumn in cols_watermark)
    result += '-- PROCEDURE: ' + sp_select_source
    result += '\nUSE [' + db_name + '];'
    result += '\nGO'
    result += '\nDROP PROCEDURE IF EXISTS ' +'[' + sp_select_source.replace('.','_') + '];'
    result += '\nGO'
    result += '\nCREATE PROCEDURE [' + sp_select_source.replace('.','_') + ']'
    result += '\n(\n@WatermarkValue DATETIME,\n@NewWatermarkValue DATETIME\n)' if condition else ''
    result += '\nAS\nBEGIN\nSET NOCOUNT ON;\nSELECT '
    for i, x in pd_columns.iterrows():
        if str(x[0]) == 'nan':
            result += 'NULL AS '+ '[' + x[1] +']'
        else:
            result += ('TRY_CONVERT(' + str(x[3]) + ',') if x[2] != x[3] else ''
            result += '[' + str(x[0]) + ']'
            result += (') AS ' + '[' + str(x[0]) + ']') if x[2] != x[3] else ''
        if i != (pd_columns.shape[0] - 1):
            result += ',\n'
    result += '\nFROM ' + objectname + ' (NOLOCK)'
    result += ('\nWHERE [' + watermarkcolumn+'] BETWEEN @WatermarkValue AND @NewWatermarkValue;') if condition else ';'
    result += '\nEND\nGO'
    if not condition and str(watermarkcolumn) != 'nan':
        result += ('\n\n-- ' +watermarkcolumn+' does not exists in ' + objectname)
    result += '\n\n'
    return result


# ## 1.2 sp_select MySQL

# In[4]:


def generate_sp_select_mysql(pd_columns, db_name = 'DATABASE_NAME', objectname = 'TABLE_NAME',
                             sp_select_source = 'SP_SELECT_SOURCE', watermarkcolumn = 'COLUMN_NAME'):
    """input: pd_columns[['column_name_src','column_name_des']]
    0: column_name_src
    1: column_name_des"""
    # Lấy những column bên source, không có t/h NULL AS Col_Dest
    # Lấy tên column theo tên column source
    result = ''
    #pd_columns = pd_columns[~pd_columns.iloc[:,1].isna()].reset_index(drop = True)
    pd_columns = pd_columns[~pd_columns.iloc[:,0].isna()].reset_index(drop = True)
    watermarkcolumn = str(watermarkcolumn)
    condition = watermarkcolumn in pd_columns.iloc[:,0].to_string()
    result += '-- PROCEDURE: ' + sp_select_source
    result += '\nUSE `' + db_name + '`;'
    result += '\nDELIMITER $$'
    result += '\nDROP PROCEDURE IF EXISTS ' +'`' + sp_select_source.replace('.','_') + '`;'
    result += '\nCREATE PROCEDURE `' + sp_select_source.replace('.','_') + '`\n'
    result += '\n(\nIN WatermarkValue DATETIME,\nIN NewWatermarkValue DATETIME\n)\n' if condition else '()'
    result += '\nBEGIN\nSELECT '
    for i, x in pd_columns.iterrows():
        if str(x[0]) == 'nan':
            result += 'NULL AS '+ '`' + x[1] +'`'
        else:
            # result += str(x[0]) + ' AS '+ x[1]
            result += '`' + str(x[0]) + '`'
        if i != (pd_columns.shape[0] - 1):
            result += ',\n'
    result += '\nFROM ' + objectname
    result += ('\nWHERE `' + watermarkcolumn+'` >= WatermarkValue AND `'+watermarkcolumn+'` <= NewWatermarkValue;') if condition else ';'
    result += '\nEND\n$$'
    if not condition and str(watermarkcolumn) != 'nan':
        result += ('\n-- ' +watermarkcolumn+' does not exists in ' + objectname)
    result += '\n\n'
    return result


# ## 1.3 sp_select Postgresql

# In[5]:


def generate_sp_select_postgresql(pd_columns, objectname = 'TABLE_NAME',
                                  sp_select_source = 'SP_SELECT_SOURCE', watermarkcolumn = 'COLUMN_NAME'):
    """input: pd_columns[['column_name_src','column_name_des','raw_data_type_src']]
    0: column_name_src
    1: column_name_des
    2: raw_data_type_src"""
    # Lấy những column bên source, không có t/h NULL AS Col_Dest
    # Lấy tên column theo tên column source
    result = ''
    #pd_columns = pd_columns[~pd_columns.iloc[:,1].isna()].reset_index(drop = True)
    pd_columns = pd_columns[~pd_columns.iloc[:,0].isna()].reset_index(drop = True)
    watermarkcolumn = str(watermarkcolumn)
    condition = watermarkcolumn in pd_columns.iloc[:,0].to_string()
    result += '-- PROCEDURE: ' + sp_select_source
    result += '\nDROP FUNCTION IF EXISTS ' +'"' + sp_select_source.replace('.','_') + '"'
    result += '(WatermarkValue timestamp, NewWatermarkValue timestamp);\n' if condition else '();\n'
    result += '\nCREATE FUNCTION "' + sp_select_source.replace('.','_') + '"'
    result += '(WatermarkValue timestamp, NewWatermarkValue timestamp)' if condition else '()'
    result += '\nRETURNS TABLE('
    
    for i, x in pd_columns.iterrows():
        if str(x[0]) == 'nan':
            continue
        else:
            result += '"' + str(x[0]) + '" ' + str(x[2]) 
        if i != (pd_columns.shape[0] - 1):
            result += ',\n'
    
    result += '\n)'
    result += '\nLANGUAGE \'sql\''
    result += '\nAS $BODY$'
    result += '\nSELECT '
    for i, x in pd_columns.iterrows():
        if str(x[0]) == 'nan':
            result += 'NULL AS '+ '"' + x[1] +'"'
        else:
            # result += str(x[0]) + ' AS '+ x[1]
            result += '"' + str(x[0]) + '"'
        if i != (pd_columns.shape[0] - 1):
            result += ',\n'
    result += '\nFROM ' + objectname
    result += ('\nWHERE "' + watermarkcolumn+'" >= WatermarkValue AND "'+watermarkcolumn+'" <= NewWatermarkValue;') if condition else ';'
    result += '\n$BODY$;'
    if not condition and str(watermarkcolumn) != 'nan':
        result += ('\n-- ' +watermarkcolumn+' does not exists in ' + objectname)
    result += '\n\n'
    return result


# ## 1.4 General sp_select

# In[6]:


def generate_sp_select_src(pd_columns, db_name = 'DATABASE_NAME', objectname = 'TABLE_NAME',
                           sp_select_source = 'SP_SELECT_SOURCE', watermarkcolumn = 'COLUMN_NAME', db_type = "SQL_SERVER"):
    result = ''
    if db_type.lower() in ['sqlserver', 'sql server']:
        result = generate_sp_select_sqlserver(pd_columns = pd_columns, db_name = db_name, objectname = objectname,
                                              sp_select_source = sp_select_source, watermarkcolumn = watermarkcolumn)
    elif db_type.lower() in ['postgresql','postgres']:
        result = generate_sp_select_postgresql(pd_columns = pd_columns, objectname = objectname,
                                              sp_select_source = sp_select_source, watermarkcolumn = watermarkcolumn)
    elif db_type.lower() in ['mysql','my sql']:
        result = generate_sp_select_mysql(pd_columns = pd_columns, db_name = db_name, objectname = objectname,
                                              sp_select_source = sp_select_source, watermarkcolumn = watermarkcolumn)
    else:
        pass
    return result


# # 2. Generate query select source

# ## 2.1 query_select Sql Server

# In[7]:


# SQLServer
def get_query_select_src_sqlserver(pd_columns, objectname = 'TABLE_NAME', watermarkcolumn = 'COLUMN_NAME'):
    """
    input: pd_columns[['column_name_src','column_name_des','raw_data_type_src','data_type_src']]
    0: column_name_src
    1: column_name_des
    2: raw_data_type_src
    3: data_type_src
    """
    # Lấy những column bên source, không có t/h NULL AS Col_Dest
    # Lấy tên column theo tên column source
    #pd_columns = pd_columns[~pd_columns.iloc[:,1].isna()].reset_index(drop = True)
    pd_columns = pd_columns[~pd_columns.iloc[:,0].isna()].reset_index(drop = True)
    watermarkcolumn = str(watermarkcolumn)
    condition = (watermarkcolumn in pd_columns.iloc[:,0].to_string()) or (watermarkcolumn in cols_watermark)
    result = 'SELECT '
    for i, x in pd_columns.iterrows():
        if str(x[0]) == 'nan':
            result += 'NULL AS '+ '[' + x[1] +']'
        else:
            result += ('TRY_CONVERT(' + str(x[3]) + ',') if x[2] != x[3] else ''
            result += '[' + str(x[0]) + ']'
            result += (') AS ' + '[' + str(x[0]) + ']') if x[2] != x[3] else ''
        if i != (pd_columns.shape[0] - 1):
            result += ',\n'
    result += '\nFROM ' + objectname + ' (NOLOCK)'
    result += ('\nWHERE [' + watermarkcolumn+'] BETWEEN @WatermarkValue AND @NewWatermarkValue;') if condition else ';'
    if not condition and str(watermarkcolumn) != 'nan':
        result += ('\n\n-- ' +watermarkcolumn+' does not exist in ' + objectname)
    return result


# ## 2.3 query_select basic

# In[8]:


# MySQL, Postgresql
def get_query_select_src_basic(pd_columns, objectname = 'TABLE_NAME', watermarkcolumn = 'COLUMN_NAME'):
    """input: pd_columns[['column_name_src','column_name_des']]
    0: column_name_src
    1: column_name_des"""
    # Lấy những column bên source, không có t/h NULL AS Col_Dest
    # Lấy tên column theo tên column source
    #pd_columns = pd_columns[~pd_columns.iloc[:,1].isna()].reset_index(drop = True)
    pd_columns = pd_columns[~pd_columns.iloc[:,0].isna()].reset_index(drop = True)
    watermarkcolumn = str(watermarkcolumn)
    condition = (watermarkcolumn in pd_columns.iloc[:,0].to_string()) or (watermarkcolumn in cols_watermark)
    result = 'SELECT '
    for i, x in pd_columns.iterrows():
        if str(x[0]) == 'nan':
            result += 'NULL AS '+ '[' + x[1] +']'
        else:
            # result += str(x[0]) + ' AS '+ x[1]
            result += '[' + str(x[0]) + ']'
        if i != (pd_columns.shape[0] - 1):
            result += ',\n'
    result += '\nFROM ' + objectname+''
    result += ('\nWHERE [' + watermarkcolumn+'] > @WatermarkValue AND ['+watermarkcolumn+'] <= @NewWatermarkValue'+';') if condition else ';'
    if not condition and str(watermarkcolumn) != 'nan':
        result += ('\n\n-- ' +watermarkcolumn+' does not exist in ' + objectname)
    return result


# ## 2.4 query_select MongoDB

# In[9]:


# MongoDB
def get_query_select_src_mongodb(pd_columns):
    """input: pd_columns[['column_name_src','column_name_des']]
    0: column_name_src
    1: column_name_des"""
    pd_columns = pd_columns[~pd_columns.iloc[:,0].isna()].reset_index(drop = True)
    result = ''
    result += '{'
    for i, x in pd_columns.iterrows():
        result += '"'+ x[0].replace('_mongodb','') + '": 1'
        if i != (pd_columns.shape[0] - 1):
            result += ','
    result += '}'
    return result


# ## 2.5 General query_select

# In[10]:


def get_query_select_src(pd_columns, objectname = 'TABLE_NAME', watermarkcolumn = 'COLUMN_NAME', db_type = 'SQLServer'):
    result = get_query_select_src_basic(pd_columns = pd_columns, objectname = objectname, watermarkcolumn = watermarkcolumn)
    if db_type.lower() in ['sqlserver', 'sql server']:
        result = get_query_select_src_sqlserver(pd_columns = pd_columns, objectname = objectname, watermarkcolumn = watermarkcolumn)
    elif db_type.lower() in ['postgresql','postgres']:
        result = result.replace('[','"').replace(']','"').replace('@WatermarkValue','?').replace('@NewWatermarkValue','?')
    elif db_type.lower() in ['mysql','my sql']:
        result = result.replace('[','`').replace(']','`').replace('@WatermarkValue','?').replace('@NewWatermarkValue','?')
    elif db_type.lower() in ['oracle']:
        result = result.replace('[','"').replace(']','"').replace('@WatermarkValue',':WatermarkValue').replace('@NewWatermarkValue',':NewWatermarkValue')
    elif db_type.lower() in ['mongodb']:
        result = get_query_select_src_mongodb(pd_columns = pd_columns)
    else:
        pass
    return result


# # 3. Generate table type

# In[11]:


def generate_table_type(pd_columns, tabletypename = 'TABLE_TYPE_NAME'):
    """input: pd_columns[['column_name','data_type']]
    0: column_name
    1: data_type"""
    pd_columns = pd_columns[~pd_columns.iloc[:,0].isna()].reset_index(drop = True)
    result = '-- TABLE TYPE: ' + tabletypename +'\n'
    result += 'CREATE TYPE [' + tabletypename + '] AS TABLE(\n'
    for i,x in pd_columns.iterrows():
        result += '[' + x[0] + ']' + ' ' + x[1]
        if i != (pd_columns.shape[0] - 1):
            result += ',\n'
    result += '\n);\nGO'
    return result


# # 4. Generate table

# In[12]:


def generate_table(pd_columns, tablename = 'TABLE_NAME', scds = 1, collection_type ='FILE'):
    """input: pd_columns[['column_name','data_type','DynamicDataMask']]
    0: column_name
    1: data_type
    2: DynamicDataMask"""
    condition_filelog = 'file' in collection_type.lower()
    column_key_name = tablename[tablename.rfind('.')+1:]
    col_ext = []
    pd_etl = pd_columns[pd_columns.iloc[:,0] == '_LogID']
    if pd_etl.shape[0] == 0:
        col_ext.append(['_LogID','int',np.nan])
        col_ext.append(['_LogID_List','nvarchar(255)',np.nan])
    pd_etl = pd_columns[pd_columns.iloc[:,0] == '_FileLogID']
    if condition_filelog:
        if pd_etl.shape[0] == 0:
            col_ext.append(['_FileLogID','int',np.nan])
            col_ext.append(['_FileLogID_List','nvarchar(255)',np.nan])
    if len(col_ext) > 0:
        df_temp = pd.DataFrame(col_ext, columns=pd_columns.columns)
        pd_columns = pd.concat([pd_columns,df_temp], axis=0, ignore_index=True)
    pd_columns = pd_columns[~pd_columns.iloc[:,0].isna()].reset_index(drop = True)
    result = '\n-- TABLE: ' + tablename +'\n'
    result += 'DROP TABLE IF EXISTS ' + tablename +';\nGO\n'
    result += 'CREATE TABLE ' + tablename + '(\n'
    for i,x in pd_columns.iterrows():
        result += '[' + x[0] + ']' + ' ' + x[1]
        if x[2] >= 1:
            if x[2] == 2:result += ' MASKED WITH (FUNCTION = \'email()\') NULL'
            elif x[2] == 3:result += ' MASKED WITH (FUNCTION = \'random(1, 16)\') NULL'
            elif x[2] == 4:result += ' MASKED WITH (FUNCTION = \'partial(0,"XXX-XX-",4)\') NULL'
            else:result += ' MASKED WITH (FUNCTION = \'default()\') NULL'
        #if i != (pd_columns.shape[0] - 1):
        result += ',\n'
    result += '[_ID] int identity(1,1) PRIMARY KEY'
    result += ',\n[_ValidFrom] datetime,\n[_ValidTo] datetime' if scds == 2 else ''
    result += ',\n[_InsertedAt] datetime default getdate(),\n[_UpdatedAt] datetime default getdate()'
    result += ',\n[_DeletedAt] datetime,\n[_IsActive] bit default 1'
    result += '\n);\nGO'
    return result


# # 5. Generate store procedure upsert

# ## 5.1 sp_upsert SCDs Type 1

# In[13]:


def generate_sp_upsert_scds_type_1(pd_columns, table_name = 'TABLE_NAME' ,sp_upsert_name = 'SP_UPSERT_NAME', 
                       tabletypename = 'TABLE_TYPE_NAME', collection_type ='FILE'):
    """
    input: pd_columns['column_name_src','column_name_des','is_key','data_type_src','data_type_des']]
    0: column_name_src
    1: column_name_des
    2: is_key
    3: data_type_src
    4: data_type_des
    """
    condition_filelog = 'file' in collection_type.lower()
    # _CustomerID : '_' + column_key_name + 'ID'
    column_key_name = table_name[table_name.rfind('.')+1:]
    pd_columns = pd_columns[~pd_columns.iloc[:,1].isna()].reset_index(drop = True)
    pd_columns_temp = pd_columns
    # Get list columns
    # Begin
    cols = ''
    for i, x in pd_columns.iterrows():
        if str(x[0]) == 'nan':
            cols += 'NULL AS [' + x[1] + ']'
        else:
            cols += 'ISNULL(' if x[2] == 1 else ''
            if str(x[3]) == str(x[4]):
                cols += '_.' + '[' + x[0] + ']'
            else:
                cols += 'TRY_CONVERT(' + str(x[4]) + ', _.' + '[' + x[0] + ']' + ')'
            if x[2] == 1:
                cols += ', '
                if 'char' in str(x[4]):
                    cols += '\'\''
                elif 'date' in str(x[4]):
                    cols += '\'9999-12-31\''
                else:
                    cols += '0'
                cols += ')'
            cols += ' AS ' + '[' + x[1] + ']'
        if i != pd_columns.index.max():
            cols += ',\n'
    # End
    
    ######
    col_ext = []
    pd_etl = pd_columns[pd_columns.iloc[:,1] == '_LogID']
    if pd_etl.shape[0] == 0:
        col_ext.append(['@etl_logid','_LogID',np.nan,np.nan,np.nan])
        col_ext.append(['@etl_logid','_LogID_List',np.nan,np.nan,np.nan])
    pd_etl = pd_columns[pd_columns.iloc[:,1] == '_FileLogID']
    if condition_filelog:
        if pd_etl.shape[0] == 0:
            col_ext.append(['@etl_filelogid','_FileLogID',np.nan,np.nan,np.nan])
            col_ext.append(['@etl_filelogid','_FileLogID_List',np.nan,np.nan,np.nan])
    if len(col_ext) > 0:
        df_temp = pd.DataFrame(col_ext, columns=pd_columns.columns)
        pd_columns = pd.concat([pd_columns,df_temp], axis=0, ignore_index=True)
    ######
    
    result = '-- PROCEDURE: ' + sp_upsert_name +'\n'
    result += 'CREATE PROC [' + sp_upsert_name.replace('.','_') + ']'
    result += '\n(\n'
    result += '@tvp ['+tabletypename+ '] READONLY'
    result += ',\n@etl_logid int = -1,\n@etl_filelogid int = NULL'
    result += ',\n@new_watermark_value datetime = \'19000101\''
    result += '\n)\n'
    result += 'AS\nBEGIN\nSET NOCOUNT ON;\nMERGE ' + table_name+''' AS target
USING (\n'''
    result += 'SELECT '
    result += cols.replace('_.','')
    result += ',\n@etl_logid AS [_LogID],\n@etl_logid AS [_LogID_List]' if len(col_ext) > 0 else ''
    result += ',\n@etl_filelogid AS [_FileLogID],\n@etl_filelogid AS [_FileLogID_List]' if condition_filelog else ''
    result += '\nFROM @tvp\n) AS source'
    result += '\nON (\n'
    pd_columns_key = pd_columns[pd_columns.iloc[:,2] == 1].reset_index(drop = True)
    for i,x in pd_columns_key.iterrows():
        result += 'target.[' +x[1] +'] = source.['+x[1] +']\n'
        result += 'AND ' if i != pd_columns_key.index.max() else ''
    result +=''')
WHEN MATCHED THEN
UPDATE SET target.[_UpdatedAt] = GETDATE()'''
    ##
    pd_columns_not_key = pd_columns_temp[pd_columns_temp.iloc[:,2] != 1].reset_index(drop = True)
    for i,x in pd_columns_not_key.iterrows():
        result += ',\n'
        result += 'target.[' +x[1] +'] = source.['+x[1] + ']'
    
    if len(col_ext) > 0:
        result += ',\ntarget.[_LogID] = source.[_LogID]'
        result += ',\ntarget.[_LogID_List] = TRY_CONVERT(NVARCHAR(255),CONCAT( target.[_LogID], \',\', target.[_LogID_List]))'
    if condition_filelog:
        result += ',\ntarget.[_FileLogID] = source.[_FileLogID]'
        result += ',\ntarget.[_FileLogID_List] = TRY_CONVERT(NVARCHAR(255),CONCAT( target.[_FileLogID], \',\', target.[_FileLogID_List]))'
    ##
    result += '''\nWHEN NOT MATCHED BY TARGET THEN
INSERT '''
    
    #
    
    # Get list columns
    cols = '('
    for i, x in pd_columns.iterrows():
        cols += '_.' + '[' + x[1] + ']'
        if i != pd_columns.index.max():
            cols += ',\n'
    cols += '\n)'
    # End
    result += cols.replace('_.','')
    result += '\nVALUES ' + cols.replace('_.','source.') +';'
    result += '\nEND;\nGO'
    return result


# ## 5.2 sp_upsert SCDs Type 2

# In[14]:


def generate_sp_upsert_scds_type_2(pd_columns, table_name = 'TABLE_NAME' ,sp_upsert_name = 'SP_UPSERT_NAME', 
                       tabletypename = 'TABLE_TYPE_NAME', collection_type ='FILE'):
    """
    input: pd_columns['column_name_src','column_name_des','is_key','data_type_src','data_type_des']]
    0: column_name_src
    1: column_name_des
    2: is_key
    3: data_type_src
    4: data_type_des
    """
    condition_filelog = 'file' in collection_type.lower()
    # _CustomerID : '_' + column_key_name + 'ID'
    column_key_name = table_name[table_name.rfind('.')+1:]
    pd_columns = pd_columns[~pd_columns.iloc[:,1].isna()].reset_index(drop = True)
    
    ###### Add 4 columns if not exists
    col_ext = []
    pd_etl = pd_columns[pd_columns.iloc[:,1] == '_LogID']
    if pd_etl.shape[0] == 0:
        col_ext.append(['@etl_logid','_LogID',np.nan,np.nan,np.nan])
        col_ext.append(['@etl_logid','_LogID_List',np.nan,np.nan,np.nan])
    pd_etl = pd_columns[pd_columns.iloc[:,1] == '_FileLogID']
    if condition_filelog:
        if pd_etl.shape[0] == 0:
            col_ext.append(['@etl_filelogid','_FileLogID',np.nan,np.nan,np.nan])
            col_ext.append(['@etl_filelogid','_FileLogID_List',np.nan,np.nan,np.nan])
    pd_etl = pd_columns[pd_columns.iloc[:,1] == '_ValidFrom']
    if pd_etl.shape[0] == 0:
        col_ext.append(['@new_watermark_value','_ValidFrom',np.nan,np.nan,np.nan])
    if len(col_ext) > 0:
        df_temp = pd.DataFrame(col_ext, columns=pd_columns.columns)
        pd_columns = pd.concat([pd_columns,df_temp], axis=0, ignore_index=True)
    ######
    
    result = '-- PROCEDURE: ' + sp_upsert_name +'\n'
    result += 'CREATE PROC [' + sp_upsert_name.replace('.','_') + ']'
    result += '\n(\n'
    result += '@tvp [' + tabletypename + '] READONLY'
    result += ',\n@etl_logid int = -1,\n@etl_filelogid int = NULL'
    result += ',\n@new_watermark_value datetime = \'19000101\''
    result += '\n)\n'
    result += 'AS\nBEGIN\nSET NOCOUNT ON;'
    result += '\nUPDATE ' + table_name
    result += '\nSET [_ValidTo] = @new_watermark_value'
    result += '\n,[_LogID] = @etl_logid'
    result += '\n,[_LogID_List] = TRY_CONVERT(NVARCHAR(255),CONCAT( [_LogID], \',\', [_LogID_List]))'
    if condition_filelog:
        result += '\n,[_FileLogID] = @etl_filelogid'
        result += '\n,[_FileLogID_List] = TRY_CONVERT(NVARCHAR(255),CONCAT( [_FileLogID], \',\', [_FileLogID_List]))'
    result += '\n,[_UpdatedAt] = GETDATE()\n,[_IsActive] = 0'
    result += '\nFROM ' + table_name + ' AS target'
    result += '\nINNER JOIN @tvp AS source'
    result += '\nON (\n'
    pd_columns_key = pd_columns[pd_columns.iloc[:,2] == 1].reset_index(drop = True)
    for i,x in pd_columns_key.iterrows():
        result += 'target.[' +x[1] +'] = source.['+x[0] +']\n'
        result += 'AND ' if i != pd_columns_key.index.max() else ''
    result += ')\nWHERE target.[_IsActive] = 1;'
    result += '\n'
    result += '\nINSERT ' + table_name
    result += '\n'
    
    ###### Get list columns
    cols = '('
    for i, x in pd_columns.iterrows():
        cols += '_.' + '[' + x[1] + ']'
        if i != pd_columns.index.max():
            cols += ',\n'
    cols += '\n)'
    ###### End
    
    result += cols.replace('_.','')
    
    ###### Begin
    cols = ''
    for i, x in pd_columns.iterrows():
        if str(x[0]) == 'nan':
            cols += 'NULL AS ' + x[1]
        else:
            cols += 'ISNULL(' if x[2] == 1 else ''
            if str(x[3]) == str(x[4]):
                cols += '_.' 
                cols += '[' if str(x[0])[0] != '@' else ''
                cols += str(x[0])
                cols += ']' if str(x[0])[0] != '@' else ''
            else:
                cols += 'TRY_CONVERT(' + str(x[4]) + ', _.' 
                cols += '[' if str(x[0])[0] != '@' else ''
                cols += str(x[0])
                cols += ']' if str(x[0])[0] != '@' else ''
                cols += ')'
            if x[2] == 1:
                cols += ', '
                if 'char' in str(x[4]):
                    cols += '\'\''
                elif 'date' in str(x[4]):
                    cols += '\'9999-12-31\''
                else:
                    cols += '0'
                cols += ')'
            cols += ' AS ' + '[' + x[1] + ']'
        if i != pd_columns.index.max():
            cols += ',\n'
    ###### End
    result += '\nSELECT '
    result += cols.replace('_.','')
    result += '\nFROM @tvp;'
    result += '\nEND;\nGO'
    return result


# ## 5.3 sp_upsert SCDs Type 0

# In[15]:


def generate_sp_upsert_scds_type_0(pd_columns, table_name = 'TABLE_NAME' ,sp_upsert_name = 'SP_UPSERT_NAME', 
                       tabletypename = 'TABLE_TYPE_NAME', collection_type ='FILE'):
    """
    input: pd_columns['column_name_src','column_name_des','is_key','data_type_src','data_type_des']]
    0: column_name_src
    1: column_name_des
    2: is_key
    3: data_type_src
    4: data_type_des
    """
    condition_filelog = 'file' in collection_type.lower()

    # _CustomerID : '_' + column_key_name + 'ID'
    column_key_name = table_name[table_name.rfind('.')+1:]
    pd_columns = pd_columns[~pd_columns.iloc[:,1].isna()].reset_index(drop = True)
    pd_columns_temp = pd_columns
    # Get list columns
    # Begin
    cols = ''
    for i, x in pd_columns.iterrows():
        if str(x[0]) == 'nan':
            cols += 'NULL AS [' + x[1] + ']'
        else:
            cols += 'ISNULL(' if x[2] == 1 else ''
            if str(x[3]) == str(x[4]):
                cols += '_.' + '[' + x[0] + ']'
            else:
                cols += 'TRY_CONVERT(' + str(x[4]) + ', _.' + '[' + x[0] + ']' + ')'
            if x[2] == 1:
                cols += ', '
                if 'char' in str(x[4]):
                    cols += '\'\''
                elif 'date' in str(x[4]):
                    cols += '\'9999-12-31\''
                else:
                    cols += '0'
                cols += ')'
            cols += ' AS ' + '[' + x[1] + ']'
        if i != pd_columns.index.max():
            cols += ',\n'
    # End
    
    ######
    col_ext = []
    pd_etl = pd_columns[pd_columns.iloc[:,1] == '_LogID']
    if pd_etl.shape[0] == 0:
        col_ext.append(['@etl_logid','_LogID',np.nan,np.nan,np.nan])
    pd_etl = pd_columns[pd_columns.iloc[:,1] == '_FileLogID']
    if condition_filelog:
        if pd_etl.shape[0] == 0:
            col_ext.append(['@etl_filelogid','_FileLogID',np.nan,np.nan,np.nan])
    if len(col_ext) > 0:
        df_temp = pd.DataFrame(col_ext, columns=pd_columns.columns)
        pd_columns = pd.concat([pd_columns,df_temp], axis=0, ignore_index=True)
    ######
    
    result = '-- PROCEDURE: ' + sp_upsert_name +'\n'
    result += 'CREATE PROC [' + sp_upsert_name.replace('.','_') + ']'
    result += '\n(\n'
    result += '@tvp ['+tabletypename+ '] READONLY'
    result += ',\n@etl_logid int = -1,\n@etl_filelogid int = NULL'
    result += ',\n@new_watermark_value datetime = \'19000101\''
    result += '\n)\n'
    result += 'AS\nBEGIN\nSET NOCOUNT ON;\nINSERT ' + table_name+'\n'
    
    # Get list columns
    cols_insert = '('
    for i, x in pd_columns.iterrows():
        cols_insert += '_.' + '[' + x[1] + ']'
        if i != pd_columns.index.max():
            cols_insert += ',\n'
    cols_insert += '\n)'
    # End
    
    result += cols_insert.replace('_.','')
    
    result += '\nSELECT '
    result += cols.replace('_.','')
    result += ',\n@etl_logid AS [_LogID]' if len(col_ext) > 0 else ''
    result += ',\n@etl_filelogid AS [_FileLogID]' if condition_filelog else ''
    result += '\nFROM @tvp;'
    result += '\nEND;\nGO'
    return result


# ## 5.4 General sp_upsert

# In[16]:


def generate_sp_upsert(pd_columns, table_name = 'TABLE_NAME' ,sp_upsert_name = 'SP_UPSERT_NAME', 
                       tabletypename = 'TABLE_TYPE_NAME',scds = 1, collection_type ='FILE'):
    """
    input: pd_columns['column_name_src','column_name_des','is_key','data_type_src','data_type_des']]
    0: column_name_src
    1: column_name_des
    2: is_key
    3: data_type_src
    4: data_type_des
    """
    result = ''
    if scds == 1:
        result = generate_sp_upsert_scds_type_1(pd_columns = pd_columns, table_name = table_name,
                    sp_upsert_name = sp_upsert_name, tabletypename = tabletypename, collection_type = collection_type)
    elif scds == 2:
        result = generate_sp_upsert_scds_type_2(pd_columns = pd_columns, table_name = table_name,
                    sp_upsert_name = sp_upsert_name, tabletypename = tabletypename, collection_type = collection_type)
    elif scds == 0:
        result = generate_sp_upsert_scds_type_0(pd_columns = pd_columns, table_name = table_name,
                    sp_upsert_name = sp_upsert_name, tabletypename = tabletypename, collection_type = collection_type)
    else:
        pass
    return result


# # 6. Generate store procedure select destination

# In[17]:


def generate_sp_select_des(pd_columns, table_name = 'TABLE_NAME' , sp_select_destination = 'SP_SELECT_DESTINATION', scds=1):
    """
    input: pd_columns['column_name','is_key']]
    0: column_name
    1: is_key
    """
    # column_key_name = objectname[objectname.rfind('.')+1:]
    pd_columns = pd_columns[~pd_columns.iloc[:,0].isna()].reset_index(drop = True)
    result = '-- PROCEDURE: ' + sp_select_destination +'\n'
    result += 'CREATE PROC [' + sp_select_destination.replace('.','_') + ''']
(
@WatermarkValue DATETIME,
@NewWatermarkValue DATETIME
)
AS
BEGIN
SET NOCOUNT ON;
SELECT '''
    for i, x in pd_columns.iterrows():
        result += '[' + x[0] + ']'
        if i != pd_columns.index.max():
            result += ',\n'
    result += '''\nFROM ''' + table_name
    if scds in [0,2]:
        result +='''\nWHERE [_ID] IN (
SELECT MAX([_ID])
FROM ''' + table_name+'''
WHERE [_UpdatedAt] > @WatermarkValue AND [_UpdatedAt] <= @NewWatermarkValue
GROUP BY '''
        pd_columns_key = pd_columns[pd_columns.iloc[:,1] == 1].reset_index(drop = True)
        for i,x in pd_columns_key.iterrows():
            result += '[' + x[0] + ']'
            result += ',\n' if i != pd_columns_key.index.max() else ''
        result += '\n);'
    else:
        result += '\nWHERE [_UpdatedAt] > @WatermarkValue AND [_UpdatedAt] <= @NewWatermarkValue;'
    result += '\nEND;\nGO'
    return result


# # 7. Generate query check business key of tables

# In[18]:


def generate_query_check_business_key(pd_columns, objectname = 'TABLE_NAME'):
    """input: pd_columns['column_name','is_key']]
    0: column_name
    1: is_key"""
    # column_key_name = objectname[objectname.rfind('.')+1:]
    pd_columns = pd_columns[~pd_columns.iloc[:,0].isna()].reset_index(drop = True)
    result = ''
    pd_columns_key = pd_columns[pd_columns.iloc[:,1] == 1].reset_index(drop = True)
    cols = ''
    for i,x in pd_columns_key.iterrows():
        cols += '[' + x[0] + ']'
        cols += ',' if i != pd_columns_key.index.max() else ''
    result += '\n-- ' + objectname
    result += '\nSELECT \'' + objectname + '\' AS TableName, ' + cols
    result += '\n, COUNT(1) AS count'
    result += '\nFROM ' + objectname
    result += '\nGROUP BY ' + cols
    result += '\nHAVING COUNT(1) > 1;\n\n'
    return result


# # 8. Generate INDEX

# In[19]:


def generate_index(pd_columns, table_name = 'TABLE_NAME'):
    """input: pd_columns['column_name','index']]
    0: column_name
    1: index"""
    pd_columns = pd_columns[~pd_columns.iloc[:,0].isna()].reset_index(drop = True)
    pd_columns = pd_columns[~pd_columns.iloc[:,1].isna()].reset_index(drop = True)
    result = ''
    if pd_columns.shape[0] > 0:
        n_column_name = pd_columns.columns[0]
        n_index = pd_columns.columns[1]

        for i,x in pd_columns[~(pd_columns.iloc[:,1].astype(str).str.find(',') >=0)].iterrows():
            pd_columns[n_index][i] = str(x[1]) + ','
        cols_temp = pd_columns.Index.astype(str).str.split(',')
        df = pd.DataFrame({
            'column_name' : pd_columns.iloc[:,0].values.repeat(cols_temp.str.len()),
            'index_name' : list(chain.from_iterable(cols_temp.tolist()))
        })
        df = df[df.iloc[:,1].astype(str).str.len() > 0].reset_index(drop=True)

        result = ''
        for x in pd.unique(df['index_name']):
            pd_cols = df[df['index_name'] == x]
            result += '\n-- INDEX: IX_' +table_name.replace('.','_') +'_'+str(x)
            result += '\nDROP INDEX IF EXISTS [IX_'+table_name.replace('.','_') +'_'+str(x) +'] ON ' + table_name
            result += '\nGO'
            result += '\nCREATE NONCLUSTERED INDEX [IX_'+table_name.replace('.','_') +'_'+str(x) +'] ON ' + table_name
            result += ' ('
            for i,x in pd_cols.iterrows():
                result += '[' + x[0] + ']' + ' ASC'
                result += ', ' if i != pd_cols.index.max() else ''
            result += ')'
            result += '\nGO'
    else:
        pass
    return result


# # 9. Generate drop sp_upsert, type, sp_select_destination

# In[20]:


def generate_drop_objects(destiantion_table_type, destination_sp_upsert, destination_sp_select):
    des = 'DROP PROCEDURE IF EXISTS [' + destination_sp_select.replace('.','_') +'];\nGO'
    des += '\nDROP PROCEDURE IF EXISTS [' + destination_sp_upsert.replace('.','_') +'];\nGO'
    des += '\nDROP TYPE IF EXISTS [' + destiantion_table_type.replace('.','_') +'];\nGO'
    return des


# # 10. Distinct column

# In[21]:


def ufn_distinct_column(df,col_distinct = 0):
    df = df[~df.iloc[:,col_distinct].isna()]
    result = pd.DataFrame(df.iloc[:,col_distinct].unique(), columns=[df.columns[col_distinct]])
    
    # create meta data
    for i,x in enumerate(df.columns):
        if i != col_distinct: result[x] = np.nan
    for i,x in result.iterrows():
        i_cols = list(range(df.columns.size))
        i_cols.remove(col_distinct)
        for i_col in i_cols:
            col_name = df.columns[i_col]
            df_temp = pd.DataFrame(df[df.iloc[:,col_distinct] == x[col_distinct]].iloc[:,i_col])
            df_temp['__length'] = df_temp.iloc[:,0].apply(lambda x: len(str(x)))
            
            result.iloc[i,i_col] = df_temp.sort_values(by = ['__length', col_name], ascending = False).iloc[0,0]
    return result


# # 11. Generate ETLMaster

# ## 11.1 Connection

# In[22]:


def etlmaster_generate_connection(df_connection ,etlmaster_database_name='ETLMaster'):
    password = 'fb.com/dobuinguyenhieu'
    result = ''
    result += 'USE '+etlmaster_database_name+'\nGO\n---------------------------// CONNECTION //---------------------------'
    result += '\nDECLARE @key nvarchar(255) = \'' + password + '\''
    for i, x in df_connection.iterrows():
        ### GET VARIABLES
        connection_id = x['connection_id']
        connection_type = str(x['connection_type'])
        database_type = str(x['database_type'])
        server = str(x['server'])
        driver = str(x['driver'])
        port = x['port']
        database = str(x['database'])
        user = str(x['user'])
        password = str(x['password'])
        input_directory = str(x['input_directory'])
        archive_directory = str(x['archive_directory'])
        part_sheet_name_or_delimited = str(x['part_sheet_name_or_delimited'])
        skip_line_number = x['skip_line_number']
        ### END

        result += '''\nINSERT dbo.etl_connection ([connection_id], [connection_type], [database_type], [driver], [server], 
[database], [port], [user], [password], 
[input_directory], [archive_directory], [part_sheet_name_or_delimited], [skip_line_number])
VALUES '''
        result += '(' + str(connection_id) + ', \'' + connection_type + '\', \'' + database_type + '\', '
        result += 'NULL, ' if driver in list_na else '\'' + driver + '\','
        result += 'NULL, ' if server in list_na else 'ENCRYPTBYPASSPHRASE(@key, \'' + server + '\'), '
        result += '\n'
        result += 'NULL, ' if database in list_na else 'ENCRYPTBYPASSPHRASE(@key, \'' + database + '\'), '
        result += 'NULL, ' if str(port) in list_na else 'ENCRYPTBYPASSPHRASE(@key, \'' + str(int(port)) + '\'), '
        result += 'NULL, ' if user in list_na else 'ENCRYPTBYPASSPHRASE(@key, \'' + user + '\'), '
        result += 'NULL, ' if password in list_na else 'ENCRYPTBYPASSPHRASE(@key, \'' + password + '\'), '
        result += '\n'
        result += 'NULL, ' if input_directory in list_na else '\'' + input_directory + '\','
        result += 'NULL, ' if archive_directory in list_na else '\'' + archive_directory + '\','
        result += 'NULL, ' if part_sheet_name_or_delimited in list_na else '\'' + part_sheet_name_or_delimited + '\','
        result += 'NULL);' if str(skip_line_number) in list_na else ' ' + str(skip_line_number) + ');'
        result += '\n'
        
    return result


# ## 11.2 Watermark

# In[23]:


def etlmaster_generate_watermark(df_watermark ,etlmaster_database_name='ETLMaster'):
    result = ''
    result += '\n\nUSE '+etlmaster_database_name
    result += '\nGO\n---------------------------// WATERMARK //---------------------------\n'
    for i, x in df_watermark.iterrows():
        ### GET VARIABLES
        batch_type = str(x['batch_type'])
        collection_type = str(x['collection_type'])
        watermark_column = str(x['source_watermark_column'])

        source_connection_id = x['source_connection_id']
        source_object = str(x['source_object'])
        source_sp_select = str(x['source_sp_select'])
        source_query = str(x['source_query'])

        destination_connection_id = x['destination_connection_id']
        destination_table = str(x['destination_table'])
        destination_sp_upsert = str(x['destination_sp_upsert'])
        destination_table_type = str(x['destination_table_type'])

        ordinal = x['ordinal']
        scds = x['scds']
        ### END

        result += ('---------------// ' + 
                               collection_type + ' : ' + source_sp_select + ' => ' + destination_table 
                               + ' //---------------\n')
        result += 'DECLARE @querystr nvarchar(max) = '
        result += 'NULL' if source_query in list_na else 'N\''+ source_query + '\';'
        result += '''\nINSERT dbo.etl_watermark ([batch_type], [collection_type], [source_connection_id], [source_object],[source_query], [watermark_column],
[destination_connection_id], [destination_table], [destination_sp_upsert], [destination_table_type], [ordinal], [enable], [scds])
VALUES '''
        result += '('
        result += '\'' + batch_type + '\', '
        result += '\'' + collection_type + '\', '
        result += 'NULL, ' if str(source_connection_id) in list_na else str(source_connection_id) + ', '
        if source_query not in list_na and len(source_query)>0:
            result += 'NULL, '
        else:
            result += '\'' + source_object + '\', ' if source_sp_select in list_na else '\'' + source_sp_select + '\', '
        result += '@querystr, '
        result += 'NULL, ' if watermark_column in list_na else '\'' + watermark_column + '\', '
        result += '\n'
        result += 'NULL, ' if str(destination_connection_id) in list_na else str(destination_connection_id)+ ', '
        result += 'NULL, ' if destination_table in list_na else '\'' + destination_table + '\', '
        result += 'NULL, ' if destination_sp_upsert in list_na else '\'' + destination_sp_upsert + '\', '
        result += 'NULL, ' if destination_table_type in list_na else '\'' + destination_table_type + '\', '
        result += 'NULL, ' if str(ordinal) in list_na else str(ordinal) + ', '
        result += '1, '
        result += 'NULL' if str(scds) in list_na else str(scds)
        result += ');\nGO\n'
    
    return result


# # -- Start code --

# In[24]:


directory_config = os.getcwd()

list_files = [f for f in glob.glob('_columns-mapping*')]
list_files_mtime = [os.path.getmtime(x) for x in list_files]
fullpath_config = directory_config + '\\' + list_files[list_files_mtime.index(max(list_files_mtime))]


# In[25]:


connection = pd.read_excel(fullpath_config, sheet_name = 'Connection')
mappingtable = pd.read_excel(fullpath_config, sheet_name = 'MappingTable')
columnsmapping = pd.read_excel(fullpath_config, sheet_name = 'ColumnsMapping')
columnsmapping = columnsmapping[columnsmapping['is_used'] == 1]
mappingtable = mappingtable[mappingtable['enable_generate'] == 1]
mappingtable = mappingtable.sort_values(by=['source_connection_id', 'destination_connection_id','ordinal']).reset_index(drop = True)


# In[26]:


# mappingtable['sp_source'] = np.nan
mappingtable['source_query'] = np.nan

dic_contents = {}
list_na = ['nan','None']


# ### Generate Table

# In[27]:


for cn_id in mappingtable['destination_connection_id'].unique():
    condition = mappingtable['destination_connection_id'] == cn_id
    list_table = mappingtable[condition]['destination_table'].unique()
    for tb_name in np.sort(list_table):
        condition = (mappingtable['destination_connection_id'] == cn_id) & (mappingtable['destination_table'] == tb_name)
        info_mappingtable = mappingtable[condition]
        list_id = info_mappingtable['mapping_table_id'].unique()
        
        info_mappingtable_v2 = ufn_distinct_column(info_mappingtable[['destination_table','scds',
                                                                      'is_overwrite','collection_type']],0)
        
        is_overwrite = info_mappingtable_v2['is_overwrite'][0]
        scds = info_mappingtable_v2['scds'][0]
        collection_type = info_mappingtable_v2['collection_type'][0]
        
        condition = columnsmapping['mapping_table_id'].isin(list_id)
        
        # get the input TABLE DESTINATION
        col_table = columnsmapping[condition][['column_name_des','data_type_des','dynamic_data_mask']]
        col_table = ufn_distinct_column(col_table, 0)
        
        # get the input INDEX
        col_index = columnsmapping[condition][['column_name_des','index']]
        col_index = ufn_distinct_column(col_index, 0)
        
        db_name_des = connection[connection['connection_id'] == cn_id].reset_index(drop=True)
        key_dic_des = (str(db_name_des.loc[0,'connection_id']) + '_' + str(db_name_des.loc[0,'connection_type']) +
                      '_' + str(db_name_des.loc[0,'database_type']) + '_' + str(db_name_des.loc[0,'database']))
        if key_dic_des not in dic_contents.keys():
            dic_contents[key_dic_des] = ''
        
        dic_contents[key_dic_des] += '-- -------------------------// ' + tb_name + ' //------------------------- --\n'
        dic_contents[key_dic_des] += ('USE [' + str(db_name_des.loc[0,'database'])+ ']\nGO\n') if db_name_des.shape[0] > 0 else ''
        
        dic_contents[key_dic_des] += '' if is_overwrite == 1 else '/*\n'
        
        # generate TABLE
        dic_contents[key_dic_des] += generate_table(col_table, tb_name, scds, collection_type) +'\n'

        # generate INDEX
        dic_contents[key_dic_des] += generate_index(col_index, tb_name) +'\n'
        
        dic_contents[key_dic_des] += '' if is_overwrite == 1 else '*/\n'


# ### Generate Table Type, SP Upsert, SP Select

# In[28]:


for i, x in mappingtable.iterrows():
    ### get varibales
    mapping_table_id = x['mapping_table_id']
    batch_type = x['batch_type']
    is_overwrite = x['is_overwrite']
    
    watermark_column = str(x['source_watermark_column'])
    connection_id_source = x['source_connection_id']
    object_source = str(x['source_object'])
    object_type = str(x['object_type'])
    sp_select_source = str(x['source_sp_select'])
    enable_generate_sp_select_source = x['enable_generate_sp_select_source']
    
    connection_id_destination = x['destination_connection_id']
    tb_destination = str(x['destination_table'])
    sp_destination = str(x['destination_sp_upsert'])
    dest_table_type = str(x['destination_table_type'])
    sp_select_destination = str(x['destination_sp_select'])
    enable_generate_sp_select_destination = x['enable_generate_sp_select_destination']
    scds = x['scds']
    ### end
    
    # get the input GET_SELECT_QUERY_SOURCE / SP_SELECT_SOURCE
    col_mapping = columnsmapping[columnsmapping['mapping_table_id'] == mapping_table_id]
    col_mapping = col_mapping[['column_name_src','column_name_des','raw_data_type_src','data_type_src']]
    col_mapping = col_mapping[~col_mapping.iloc[:,0].isna()]
    if object_type.upper() in ['TABLE','VIEW']:
        col_mapping = col_mapping[~col_mapping.iloc[:,1].isna()]
    
    # get the input SP_SELECT_DESTINATION
    col_sp_select_des = columnsmapping[columnsmapping['mapping_table_id'] == mapping_table_id]
    col_sp_select_des = col_sp_select_des[['column_name_des','data_type_des','is_key']]
    col_sp_select_des = col_sp_select_des[~col_sp_select_des.iloc[:,0].isna()]
    
    
    # get the input SP_UPSERT_DESTINATION - mapping source - destination
    col_sp_upsert = columnsmapping[columnsmapping['mapping_table_id'] == mapping_table_id]
    col_sp_upsert = col_sp_upsert[['column_name_src','column_name_des','is_key','data_type_src','data_type_des']]
    col_sp_upsert = col_sp_upsert[~col_sp_upsert.iloc[:,1].isna()]
    
    # get the input TABLE TYPE
    col_type = columnsmapping[columnsmapping['mapping_table_id'] == mapping_table_id]
    col_type = col_type[['column_name_src','data_type_src','column_name_des','data_type_des']]
    col_type = col_type[~col_type.iloc[:,0].isna()].reset_index(drop = True)
    if object_type.upper() in ['TABLE','VIEW']:
        col_type = col_type[~col_type.iloc[:,2].isna()].reset_index(drop = True)
    col_type = col_type.loc[:,['column_name_src','data_type_src']]
    col_type = ufn_distinct_column(col_type)
    
    # get the input SCRIPT DROP ALL DESTINATION
    drop_all_des = generate_drop_objects(dest_table_type, sp_destination, sp_select_destination)
    
    # get information CONNECTION
    db_name_src = connection[connection['connection_id'] == connection_id_source].reset_index(drop=True)
    db_name_des = connection[connection['connection_id'] == connection_id_destination].reset_index(drop=True)
    key_dic_src = (str(db_name_src.loc[0,'connection_id']) + '_' + str(db_name_src.loc[0,'connection_type']) +
                  '_' + str(db_name_src.loc[0,'database_type']) + '_' + str(db_name_src.loc[0,'database']))
    key_dic_des = (str(db_name_des.loc[0,'connection_id']) + '_' + str(db_name_des.loc[0,'connection_type']) +
                  '_' + str(db_name_des.loc[0,'database_type']) + '_' + str(db_name_des.loc[0,'database']))
    
    if key_dic_src not in dic_contents.keys():
        dic_contents[key_dic_src] = ''
    if key_dic_des not in dic_contents.keys():
        dic_contents[key_dic_des] = ''
    
    ### SOURCE
    if object_type.upper() in ['TABLE','VIEW'] and enable_generate_sp_select_source == 1 :
        dic_contents[key_dic_src] += '' if is_overwrite == 1 else '/*\n'
        dic_contents[key_dic_src] += ('-- --// ' + 
                                      str(db_name_src.loc[0,'database_type']) + ' - ' + 
                                      str(db_name_src.loc[0,'server']) + ' - ' + 
                                      str(db_name_src.loc[0,'database'])
                                      + ' //-- --\n')
        dic_contents[key_dic_src] += '-- -------------------------// ' + object_source + ' //------------------------- --\n'
        dic_contents[key_dic_src] += generate_sp_select_src(col_mapping, db_name_src.loc[0,'database'], object_source,
                                                            sp_select_source, watermark_column, 
                                                            db_name_src.loc[0,'database_type']) + '\n'
        dic_contents[key_dic_src] += '' if is_overwrite == 1 else '*/\n'
    ### END SOURCE
    
    ### DESTINATION
    dic_contents[key_dic_des] += '-- -------------------------// ' + tb_destination + ' //------------------------- --\n'
    dic_contents[key_dic_des] += ('USE [' + str(db_name_des.loc[0,'database']) + ']\nGO\n') if db_name_des.shape[0] > 0 else ''
    
    #
    dic_contents[key_dic_des] += '' if is_overwrite == 1 else '/*\n'
    
    # generate drop type_table, sp_upsert, sp_select_destination on destination
    dic_contents[key_dic_des] += drop_all_des + '\n'
    
    # generate TYPE TABLE on destination
    dic_contents[key_dic_des] += generate_table_type(col_type, dest_table_type) +'\n'
    
    # generate SP_UPSERT on destination
    dic_contents[key_dic_des] += generate_sp_upsert(col_sp_upsert, tb_destination, 
                                      sp_destination, dest_table_type, scds, collection_type) +'\n'

    # generate SP_SELECT_DESTINATION on destination
    if enable_generate_sp_select_destination == 1:
        dic_contents[key_dic_des] += generate_sp_select_des(col_sp_select_des.iloc[:,[0,2]],
                                                            tb_destination, sp_select_destination, scds) +'\n'
    #
    dic_contents[key_dic_des] += '' if is_overwrite == 1 else '*/\n'
    ### END DESTINATION
    
    ### get QUERY SOURCE
    if object_source not in list_na:
        if object_type.upper() in ['TABLE','VIEW'] and enable_generate_sp_select_source != 1 :
            querySource = get_query_select_src(col_mapping, object_source, watermark_column, 
                                               db_name_src.loc[0,'database_type'])
            mappingtable.loc[i,'source_query'] = querySource
        elif object_type.upper() in ['COLLECTION']:
            mappingtable.loc[i,'source_sp_select'] = object_source
            querySource = get_query_select_src(col_mapping, object_source, watermark_column, 
                                               db_name_src.loc[0,'database_type'])
            mappingtable.loc[i,'source_query'] = querySource
        else:
            pass
    ### END QUERY SOURCE


# In[29]:


etl_conn = connection[connection['connection_id'] == 9999]
if etl_conn.shape[0]>0:
    etlmaster_db_name = etl_conn.loc[0,'database']
else:
    etlmaster_db_name = 'ETLMaster'
dic_contents[9999] = etlmaster_generate_connection(connection,etlmaster_db_name)
dic_contents[9999] += etlmaster_generate_watermark(mappingtable,etlmaster_db_name)


# # Export file sql

# In[32]:


print('---------------------------// DONE //---------------------------')

timestr = str(datetime.datetime.now())[:16].replace(' ','_').replace(':','-')
for k, x in dic_contents.items():
    if len(x) > 0:
        file_name = directory_config + '\\' + '_' + str(k) + '_' + timestr + '.sql'
        wfile = open(file_name,'w', encoding="utf-8")
        wfile.write(x)
        wfile.close()
        print('Path file:', file_name)
    else:
        pass

