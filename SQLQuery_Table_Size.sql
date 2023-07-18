SELECT 
 s.name + '.' + t.Name AS [Table Name],
 part.rows AS [Total Rows In Table - Modified],
 CAST((SUM( DISTINCT au.Total_pages) * 8 ) / 1024.000 / 1024.000 AS NUMERIC(18, 3)) 
 AS [Table's Total Space In GB]
FROM 
 SYS.Tables t INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
 INNER JOIN SYS.Indexes idx ON t.Object_id = idx.Object_id
 INNER JOIN SYS.Partitions part ON idx.Object_id = part.Object_id 
                    AND idx.Index_id = part.Index_id
 INNER JOIN SYS.Allocation_units au ON part.Partition_id = au.Container_id
 INNER JOIN SYS.Filegroups fGrp ON idx.Data_space_id = fGrp.Data_space_id
 INNER JOIN SYS.Database_files Df ON Df.Data_space_id = fGrp.Data_space_id
WHERE t.Is_ms_shipped = 0 AND idx.Object_id > 255 
GROUP BY t.Name, s.name, part.rows
ORDER BY [Table's Total Space In GB] DESC
##############################################################################################################
SELECT 
    t.name AS TableName,
    s.name AS SchemaName,
    p.rows,
    SUM(a.total_pages) * 8 AS TotalSpaceKB, 
    CAST(ROUND(((SUM(a.total_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS TotalSpaceMB,
    SUM(a.used_pages) * 8 AS UsedSpaceKB, 
    CAST(ROUND(((SUM(a.used_pages) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS UsedSpaceMB, 
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8 AS UnusedSpaceKB,
    CAST(ROUND(((SUM(a.total_pages) - SUM(a.used_pages)) * 8) / 1024.00, 2) AS NUMERIC(36, 2)) AS UnusedSpaceMB
FROM 
    sys.tables t
INNER JOIN      
    sys.indexes i ON t.object_id = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.object_id AND i.index_id = p.index_id
INNER JOIN 
    sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN 
    sys.schemas s ON t.schema_id = s.schema_id
WHERE 
    t.name NOT LIKE 'dt%' 
    AND t.is_ms_shipped = 0
    AND i.object_id > 255 
GROUP BY 
    t.name, s.name, p.rows
ORDER BY 
    TotalSpaceMB DESC, t.name
