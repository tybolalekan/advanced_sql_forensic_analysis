WITH SuspectScoring AS (
    SELECT 
        s.suspect_id,
        s.name,
        s.role,
        s.relation_to_victim,
        s.alibi,
        
        -- SCORE 1: Vault Room access during critical window (7:55-8:05 PM)
        CASE 
            WHEN EXISTS (
                SELECT 1 FROM dbo.AccessLogs al 
                WHERE al.suspect_id = s.suspect_id 
                  AND al.door_accessed = 'Vault Room'
                  AND al.success_flag = 1
                  AND al.access_time BETWEEN '2025-06-01 19:55:00' AND '2025-06-01 20:05:00'
            ) THEN 50
            WHEN EXISTS (
                SELECT 1 FROM dbo.AccessLogs al 
                WHERE al.suspect_id = s.suspect_id 
                  AND al.door_accessed = 'Vault Room'
                  AND al.success_flag = 1
            ) THEN 25
            ELSE 0
        END AS vault_access_score,
        
        -- SCORE 2: Called victim before murder
        CASE 
            WHEN EXISTS (
                SELECT 1 FROM dbo.CallRecords cr 
                WHERE cr.suspect_id = s.suspect_id 
                  AND cr.recipient_relation = 'Victim'
                  AND cr.call_time BETWEEN '2025-06-01 19:50:00' AND '2025-06-01 20:00:00'
            ) THEN 30
            WHEN EXISTS (
                SELECT 1 FROM dbo.CallRecords cr 
                WHERE cr.suspect_id = s.suspect_id 
                  AND cr.recipient_relation = 'Victim'
            ) THEN 10
            ELSE 0
        END AS victim_call_score,
        
        -- SCORE 3: Alibi contradiction
        CASE 
            WHEN s.alibi IN ('At home', 'At hospital', 'Hotel room', 'Left early')
                AND EXISTS (
                    SELECT 1 FROM dbo.AccessLogs al 
                    WHERE al.suspect_id = s.suspect_id 
                      AND al.access_time BETWEEN '2025-06-01 19:45:00' AND '2025-06-01 20:15:00'
                ) THEN 40
            ELSE 0
        END AS alibi_contradiction_score,
        
        -- SCORE 4: Relationship to victim (motive)
        CASE 
            WHEN s.relation_to_victim = 'Rival' THEN 15
            WHEN s.relation_to_victim = 'Former Partner' THEN 12
            WHEN s.relation_to_victim IN ('Business Partner', 'Investor') THEN 8
            WHEN s.relation_to_victim = 'Employee' THEN 5
            ELSE 0
        END AS relationship_score,
        
        -- SCORE 5: Activity level during critical period
        (SELECT COUNT(*) FROM dbo.AccessLogs al 
         WHERE al.suspect_id = s.suspect_id 
           AND al.access_time BETWEEN '2025-06-01 19:45:00' AND '2025-06-01 20:15:00'
        ) * 2 AS activity_score
        
    FROM dbo.Suspects s
),
RankedSuspects AS (
    SELECT 
        *,
        (vault_access_score + victim_call_score + alibi_contradiction_score + 
         relationship_score + activity_score) AS total_suspicion_score,
        ROW_NUMBER() OVER (ORDER BY 
            (vault_access_score + victim_call_score + alibi_contradiction_score + 
             relationship_score + activity_score) DESC
        ) AS suspicion_rank
    FROM SuspectScoring
)
SELECT 
    suspicion_rank,
    suspect_id,
    name,
    role,
    relation_to_victim,
    alibi,
    vault_access_score,
    victim_call_score,
    alibi_contradiction_score,
    relationship_score,
    activity_score,
    total_suspicion_score,
    CASE 
        WHEN suspicion_rank <= 3 THEN 'TOP SUSPECT'
        WHEN suspicion_rank <= 10 THEN 'Person of Interest'
        ELSE 'Low Priority'
    END AS investigation_priority
FROM RankedSuspects
WHERE total_suspicion_score > 0
ORDER BY total_suspicion_score DESC;
GO