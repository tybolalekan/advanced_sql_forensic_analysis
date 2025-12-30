USE MurderInvestigation;
GO

SELECT 
    al.access_time AS MovementTime,
    s.name AS SuspectName,
    al.door_accessed AS Location,
    CASE WHEN al.success_flag = 1 THEN 'Success' ELSE 'Failed' END AS Status,
    ABS(DATEDIFF(SECOND, al.access_time, '2025-06-01 20:00:00')) AS SecondsFromMurder,
    CASE 
        WHEN ABS(DATEDIFF(SECOND, al.access_time, '2025-06-01 20:00:00')) < 60 
        THEN '+/- 1 MINUTE OF MURDER'
        ELSE 'Critical Window'
    END AS Significance
FROM dbo.AccessLogs al
JOIN dbo.Suspects s ON al.suspect_id = s.suspect_id
WHERE 
    al.access_time BETWEEN '2025-06-01 19:57:00' AND '2025-06-01 20:03:00'
ORDER BY al.access_time;