
USE MurderInvestigation;
GO

SELECT DISTINCT
    s.name AS SuspectName,
    s.alibi AS ClaimedAlibi,
    (SELECT COUNT(*) 
     FROM dbo.AccessLogs al2 
     WHERE al2.suspect_id = s.suspect_id 
       AND al2.access_time BETWEEN '2025-06-01 19:45:00' AND '2025-06-01 20:15:00'
    ) AS EventsOnPremises,
    
    (SELECT TOP 1 
        al3.door_accessed + ' (' + CONVERT(VARCHAR, al3.access_time, 108) + ')'
     FROM dbo.AccessLogs al3 
     WHERE al3.suspect_id = s.suspect_id 
       AND al3.access_time BETWEEN '2025-06-01 19:45:00' AND '2025-06-01 20:15:00'
     ORDER BY ABS(DATEDIFF(SECOND, al3.access_time, '2025-06-01 20:00:00')) 
    ) AS ClosestActivityToMurder
    
FROM dbo.Suspects s
JOIN dbo.AccessLogs al ON s.suspect_id = al.suspect_id
WHERE 

    s.alibi IN ('At home', 'At hospital', 'Hotel room', 'Left early')
    
    AND al.access_time BETWEEN '2025-06-01 19:45:00' AND '2025-06-01 20:15:00'

ORDER BY EventsOnPremises DESC;
