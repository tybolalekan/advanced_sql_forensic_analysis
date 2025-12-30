-- Q7 Which suspect’s movement pattern overlaps with critical time windows?
-- 7.1. VICTIM WAS LAST SEEN AT 19:57 WITH WHO?
SELECT SP.Suspect_Id, SP.Name, SP.Relation_To_Victim, SP.Alibi, AL.Door_Accessed, AL.Access_Time, AL.Success_Flag
FROM suspects SP  JOIN  `access logs` AL  
ON SP.Suspect_Id = AL.Suspect_Id 
WHERE AL.Access_Time BETWEEN '6/1/2025 19:55' AND '6/1/2025 19:58' AND AL.Success_Flag = 'TRUE' AND Door_Accessed = 'VAULT ROOM'
ORDER BY  AL.Access_Time; 

-- 7.2. WHO ENTERED THE VAULTROOM AT TIME OF DEATH? 
SELECT SP.Suspect_Id, SP.Name, SP.Relation_To_Victim, SP.Alibi, AL.Door_Accessed, AL.Access_Time, AL.Success_Flag
FROM suspects SP  JOIN  `access logs` AL  
ON SP.Suspect_Id = AL.Suspect_Id 
WHERE AL.Access_Time = '6/1/2025 20:00' AND AL.Success_Flag = 'TRUE' AND Door_Accessed = 'VAULT ROOM'
ORDER BY  AL.Access_Time;

-- 7.3. WHO WAS MOVING AROUND THE VAULT DURING THE TIME MOVEMENT WAS SEEN IN THE VAULT HALLWAY AND SECURITY FEED WAS CUT 
SELECT SP.Suspect_Id, SP.Name, SP.Relation_To_Victim, SP.Alibi, AL.Door_Accessed, AL.Access_Time, AL.Success_Flag
FROM suspects SP LEFT OUTER JOIN `access logs` AL  
ON SP.Suspect_Id = AL.Suspect_Id 
WHERE AL.Access_Time BETWEEN '6/1/2025 20:00' AND '6/1/2025 20:05' AND AL.Success_Flag = 'TRUE'
AND Door_Accessed = 'OFFICE'
ORDER BY  AL.Access_Time; 

-- 7.4. WHO ENTERED THE VAULT SHORTLY AFTER THE DEATH OF THE VICTIM AND CUTTING OF THE SECURITY FEED
SELECT SP.Suspect_Id, SP.Name, SP.Relation_To_Victim, SP.Alibi, AL.Door_Accessed, AL.Access_Time, AL.Success_Flag
FROM suspects SP LEFT OUTER JOIN `access logs` AL  
ON SP.Suspect_Id = AL.Suspect_Id 
WHERE AL.Access_Time BETWEEN '6/1/2025 20:01' AND '6/1/2025 20:05' AND AL.Success_Flag = 'TRUE' AND Door_Accessed LIKE 'VAULT%'
ORDER BY  AL.Access_Time; 
