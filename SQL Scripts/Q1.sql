USE MurderInvestigation;
GO

SELECT TOP 1
    s.name AS KillerName,
    s.role AS Role,
    s.alibi AS FalseAlibi,
    al.access_time AS VaultAccessTime,
    ABS(DATEDIFF(SECOND, al.access_time, '2025-06-01 20:00:00')) AS SecondsFromMurder
FROM dbo.Suspects s
JOIN dbo.AccessLogs al ON s.suspect_id = al.suspect_id
WHERE 

    al.door_accessed = 'Vault Room' 
    AND al.success_flag = 1
    

    AND al.access_time BETWEEN '2025-06-01 19:55:00' AND '2025-06-01 20:05:00'
    AND s.alibi IN ('At home', 'At hospital', 'Hotel room', 'Left early')

ORDER BY 

    ABS(DATEDIFF(SECOND, al.access_time, '2025-06-01 20:00:00')) ASC;