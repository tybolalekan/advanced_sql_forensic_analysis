-- Q4 What does the call log reveal about the final phone call? WHO CALLED VICTIM LAST?
SELECT * FROM `call records` CR
WHERE CR.call_time >= '6/1/2025 19:56' AND Recipient_Relation = 'VICTIM';

-- WHAT WAS THEIR ALIBI
SELECT SP.Name, SP.suspect_id, SP.Alibi, CR.*
FROM suspects SP JOIN `call records` CR ON SP.suspect_id = CR.suspect_id
WHERE CR.call_time = '6/1/2025 19:56' AND Recipient_Relation = 'VICTIM';

-- DID CALLER ACCESS VAULT ROOM DURING OR AFTER CALL?
SELECT SP.Name, SP.Alibi, CR.call_time, AL.door_accessed, AL.access_time
FROM suspects SP 
JOIN `call records` CR ON SP.suspect_id = CR.suspect_id
JOIN `access logs` AL ON SP.suspect_id = AL.suspect_id
WHERE CR.call_time = '6/1/2025 19:56'
AND AL.door_accessed LIKE 'Vault%'
AND AL.access_time >= '6/1/2025 19:56' AND AL.access_time <= '6/1/2025 20:05'
AND AL.success_flag = 'True';

-- WHAT DOES GENERAL LAST PHONECALL SAY?
SELECT * FROM `call records` ORDER BY Call_Time DESC LIMIT 1;