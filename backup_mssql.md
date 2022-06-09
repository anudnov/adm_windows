1. BAT file: 
```
sqlcmd -i C:\backup_script\backupall.sql > C:\backup_script\backuplog.txt 
```

2. SQL file:
```
DECLARE @basePath varchar(300); 
SET @basePath = N'C:\backupsql\bak\'; 

DECLARE @db sysname; 
DECLARE user_db_cursor CURSOR FOR 
      SELECT name FROM sys.databases WHERE name NOT IN ('master', 'model', 'msdb', 'tempdb') 
OPEN user_db_cursor 
FETCH NEXT FROM user_db_cursor 
INTO @db 

WHILE @@FETCH_STATUS = 0 
BEGIN 
      DECLARE @backupPath varchar(1000); 
      SET @backupPath = @basePath + @db + '\'; 

      DECLARE @backupName varchar(1000); 
      DECLARE @time datetime2; 
      SET @time = SYSDATETIME(); 
      SET @backupName = @db + '_backup_' + REPLACE(REPLACE(REPLACE(CONVERT(varchar, @time, 20),'-','_'),':',''),' ','_') 
      + '_' +  CAST(DATEPART(NANOSECOND, @time)/100 as varchar) 

      --Create sub-directory 
      EXECUTE master.dbo.xp_create_subdir @backupPath 
      
      DECLARE @backupFileName varchar(1000); 
      SET @backupFileName = @backupPath + @backupName + '.bak'; 
      
      --Backup database 
      BACKUP DATABASE @db TO DISK=@backupFileName 
            WITH  NOFORMAT, NOINIT, NAME=@backupName , 
            SKIP, REWIND, NOUNLOAD, STATS=10 
            FETCH NEXT FROM user_db_cursor 
INTO @db 
END
CLOSE user_db_cursor 
DEALLOCATE user_db_cursor

```
