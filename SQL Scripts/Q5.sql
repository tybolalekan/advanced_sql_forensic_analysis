-- Q5 Are there any inconsistencies between door access logs and alibi claims?
SELECT SP.Name, SP.suspect_id, SP.Alibi, AL.door_accessed, AL.access_time, AL.success_flag
FROM suspects SP JOIN `access logs` AL ON SP.suspect_id = AL.suspect_id
WHERE AL.access_time >= '6/1/2025 19:55' AND AL.access_time <= '6/1/2025 20:05'
AND AL.success_flag = 'True'
ORDER BY AL.access_time, SP.Name;

-- WHO LIED ABOUT ALIBI BUT ACCESSED VAULT ROOM DURING CRITICAL TIMES
SELECT SP.Name, SP.Alibi, AL.door_accessed, AL.access_time
FROM suspects SP JOIN `access logs` AL ON SP.suspect_id = AL.suspect_id
WHERE AL.door_accessed LIKE 'Vault%' 
AND AL.access_time >= '6/1/2025 19:55' AND AL.access_time <= '6/1/2025 20:05'
AND AL.success_flag = 'True'
AND SP.Alibi NOT LIKE 'Vault%'
ORDER BY access_time;