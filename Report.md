## Solving the Murder of Roland Greene

## 

## Overview

This is a data-driven investigation into the murder of Roland Greene, a well-known art collector, who was found dead in the Vault Room of his private estate at 8:00 PM, shortly after receiving a call at 7:55 PM. Though all 30 guests claim to have alibis, only one is lying.

### Case Facts

- **Victim**: Roland Greene (Art Collector)
- **Location**: Vault Room, Private Estate
- **Time of Death**: 8:00 PM (20:00:00)
- **Last Contact**: Phone call received at 7:55 PM
- **Suspects**: 30 guests, all claiming alibis
- **Challenge**: Only one suspect is lying

**DATA SOURCE**

<div class="joplin-table-wrapper"><table><thead><tr><th><p>Datasets</p></th><th><ol><li><strong>suspects_large.csv</strong> (30 records)<ul><li>Suspect profiles with roles, relationships, and alibis</li></ul></li><li><strong>call_records_large.csv</strong> (90 records)<ul><li>Phone call history including calls to the victim</li></ul></li><li><strong>access_logs_large.csv</strong> (100 records)<ul><li>Door access records from the estate security system</li></ul></li><li><strong>forensic_events_large.csv</strong> (5 records)<ul><li>Timeline of critical forensic events</li></ul></li></ol></th></tr><tr><th><p>tools used</p></th><th><p>Microsoft SQL Server</p><p>SQL Server Management Studio</p><p>MySQL</p><p>Excel</p><p>Paint</p></th></tr></thead></table></div>

## 

## 

## Guided Investigation QuestionsWho killed Roland Greene?Jamie BennettRole: CleanerRelation to Victim: StaffMotive: Opportunity (Access to restricted areas)

The Evidence

- The Critical Window

Murder Time: 20:00:00 (Gunshot heard)

Location: Vault Room (implied by forensic timeline and security feed cut)

- The Gunshot (Access Logs)

The killer had to be in or near the Vault Room at the time of the murder.

Jamie Bennett accessed the Vault Room at 20:00:55.

This is just 55 seconds after the gunshot was heard.

She is the only suspect to access the room so close to the time of death who also has a provably false alibi.

- The False Alibi

Claimed Alibi: "At home"

Fact: She was undeniably ON PREMISES at the time of the murder.

20:00:09 - Accessed Office (9 seconds after gunshot)

20:00:55 - Accessed Vault Room (Crime Scene)

- Suspicious Behavior Pattern

19:54:40 - Attempted to enter the Vault Room but FAILED (Access Denied).

20:00:09 - Entered Office (Successfully). Did she find the key or code here?

20:00:55 - Entered Vault Room (Successfully).

**Secondary Suspect is Robin Ahmed but cleared**

- Robin Ahmed (Family Doctor) was also considered but ruled out as the primary suspect because he accessed the Vault Room at 19:56:35 (3.5 minutes before the murder).

While his alibi ("Left early") was false, Jamie Bennett's presence immediately after the entrance of Robin Ahmed and time of death and her pattern of "Failed Entry -> Office -> Successful Entry" movement strongly suggests premeditation or immediate involvement in the crime scene tampering/cleanup.

1.  Who are the top 3 suspects and why?

| suspicion_rank | suspect_id | name | role | relation_to_victim | alibi | vault_access_score | victim_call_score | alibi_contradiction_score | relationship_score | activity_score | total_suspicion_score | investigation_priority |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1   | 27  | Victor Shaw | PR Manager | Rival | At hospital | 50  | 0   | 40  | 15  | 10  | 115 | TOP SUSPECT |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 2   | 17  | Robin Ahmed | Family Doctor | Former Partner | Left early | 50  | 0   | 40  | 12  | 6   | 108 | TOP SUSPECT |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 3   | 28  | Jamie Bennett | Cleaner | Staff | At home | 50  | 0   | 40  | 0   | 8   | 98  | TOP SUSPECT |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |

## Victor Shaw - PR Manager (Rival)

Victor Shaw stands as the most compelling suspect based on the convergence of opportunity, motive, and contradictory testimony. Digital door logs indicate that Victor accessed the Vault Room within the critical window surrounding Roland Greene’s time of death. This direct proximity to the crime scene is reinforced by his maximum vault access score of **50**, signaling clear opportunity.

Despite claiming to have been “at the hospital,” Victor's alibi cannot be substantiated. Cross-referencing his statement with movement logs and event timestamps reveals significant conflicts, reflected in a high alibi contradiction score of **40**. This suggests deliberate misdirection rather than an honest discrepancy.

Victor’s relationship with the victim further adds to the suspicion. As a known rival of Roland Greene, he possessed a strong personal or professional motive, represented by a relationship score of **15**, one of the highest among all suspects. His activity score of **10** indicates anomalous behavior around the timeline of the murder.

Collectively, these findings-strong motive, confirmed access, and a falsified alibi-place Victor as the primary suspect with a total suspicion score of **115**, the highest in the dataset.

## Robin Ahmed - Family Doctor (Former Partner)

Robin Ahmed emerges as the second-highest-risk suspect, showing a near-identical pattern of opportunity and alibi failure as Victor, though with a slightly lower risk profile in motive and movement.

Door logs confirm that Robin also accessed the Vault around the time of the murder, earning a full vault access score of **50**. Their claim of having “left early” contradicts forensic timing and digital movement data, resulting in an alibi contradiction score of **40**.

As Roland's former partner, Robin possessed a personal and emotionally charged connection to the victim. Their relationship score of **12** reflects possible motives tied to past conflict or unresolved issues. An activity score of **6** suggests some irregular movement, though less intense than Victor’s.

With a total suspicion score of **108**, Robin remains a highly credible suspect whose actions, relationships, and inconsistencies demand significant investigative attention.

## Jamie Bennett - Cleaner (Staff)

Jamie Bennett represents a suspect with strong positional opportunity but comparatively weaker motive. Door records confirm Jamie’s presence near the Vault during the murder window, reflected in their vault access score of **50**.

Jamie’s alibi - claiming they were “at home”- fails validation when matched against entry and movement logs, earning another high alibi contradiction score of **40**. This indicates deception regarding their whereabouts.

However, Jamie’s lack of a personal or adversarial relationship with the victim results in a relationship score of **0**, suggesting no inherent motive based on interpersonal context. Their activity score of **8** does show notable movement during the event window, but without accompanying motive, the suspicion is attenuated.

Jamie’s total suspicion score of **98** places them as a high-priority investigative subject, though lacking the motive strength displayed by the top two suspects.

1.  Whose alibi does not match the forensic timeline?

Analysis of access logs reveals 11 suspects whose claimed alibis contradict the forensic timeline. These individuals claimed to be off-site ("At home", "Hospital", etc.) but were detected on the premises between 19:45 and 20:15

| Suspect Name | Claimed Alibi | Actual location | Time |
| --- | --- | --- | --- |
| Jamie Bennett | At home | Vault Room | 20:00:55 |
| --- | --- | --- | --- |
| Victor Shaw | At hospital | Vault Room | 20:04:53 |
| --- | --- | --- | --- |
| Robin Ahmed | Left early | Vault Room | 19:56:35 |
| --- | --- | --- | --- |
| Mason Shaw | Hotel room | Kitchen | 19:58:05 |
| --- | --- | --- | --- |
| Alex Shaw | Hotel room | Garden Exit | 19:59:45 |
| --- | --- | --- | --- |
| Morgan Bennett | At hospital | Office/Garden |     |
| --- | --- | --- | --- |
| Emerson Smith | At home | Master Bedroom |     |
| --- | --- | --- | --- |
| Peter Nguyen | Left early | Kitchen/Vault Room |     |
| --- | --- | --- | --- |
| Skylar Knight | At hospital | Kitchen/Library |     |
| --- | --- | --- | --- |
| Morgan Nguyen | At home | Kitchen/Bedroom |     |
| --- | --- | --- | --- |
| Avery Rivers | At hospital | Office/Library |     |
| --- | --- | --- | --- |

1.  Was anyone in the Vault Room shortly before or after the murder time (8 PM)?

YES

| Time | Suspect | Status | Significance |
| --- | --- | --- | --- |
| 19:56:35 | Robin Ahmed | Success | 3.5 mins before murder |
| --- | --- | --- | --- |
| 20:00:55 | Jamie Bennett | Success | Gunshot (55s after murder) |
| --- | --- | --- | --- |
| 20:04:53 | Victor Shaw | Success | 5 mins after murder |
| --- | --- | --- | --- |

1.  What does the call log reveal about the final phone call?

- Final caller: Susan Knight
- Role: Chef
- Call Time: 19:56:39
- Duration: 6 minutes
- Relation: Staff
- Timeline Significance
    - Call Start: 19:56:39
    - Murder Time: 20:00:00 (Gunshot heard)
    - Call End: 20:02:40
- The victim was on the phone with Susan Knight at the exact moment he was killed. She likely heard the gunshot or the killer's entry. This makes Susan Knight a critical witness.
- Also the last call was at 20:02:40pm, however the forensic report claimed otherwise because an emergency call was made at 8:05pm from the mansion. Assuming a general phone call, the last phone call made to the victim was at 7:56pm and it lasted for 6 minutes by Susan Knight, suspect ID 5.

1.  Are there any inconsistencies between door access logs and alibi claims?

YES

An analysis of the Access Logs compared to the Suspect Alibis reveals significant contradictions. 11 suspects claimed to be completely off-site (e.g., "At home", "Hospital") but were recorded entering or exiting rooms within the mansion during the investigation window (19:45 - 20:15).

1.  What does the forensic timeline say about the time and manner of death?

**Estimated time of death:** Precisely 20:00 on June 1, 2025

The rapid sequence of events , gunshot, motion, security feed disruption , strongly supports a scenario where the killer acted quickly, moved away from the Vault immediately, and intentionally disabled surveillance to conceal their identity.

From the forensic sheet, the victim was lastly seen alive at 7:57pm and gunshot was heard at 8:00pm. 20 seconds after the gunshot Jamie Bennet accessed the vault. Motion was detected at 8:01:15, a minute after the event, that raises concern as to the possibility of being a suspect.

1.  Which suspect’s movement pattern overlaps with critical time windows?

- **Jamie Bennett's sequence is the most suspicious**

@ 20:00:09 - She broke into the Office (9s after murder).

@ 20:00:55 - She entered the Vault Room (Crime Scene). She is the only person moving towards the crime scene immediately after the gunshot.

- Access logs indicate **Susan Knight (Suspect ID 7)** gained entry to the Office at 6/1/2025 20:02: Security surveillance systems experienced a disruption at 20:03, one minute following Knight's entry, raising suspicion of intentional sabotage to eliminate video evidence.

- Victor Shaw (Suspect ID 27) accessed the Vault Room at 20:04, four minutes after the victim's death at 20:00. This entry occurred after surveillance systems were disabled at 20:03, preventing visual confirmation of Shaw's activities at the crime scene. Shaw's presence in the Vault Room post-mortem raises questions about potential evidence tampering, body discovery, or accomplice involvement.

1.  How do the data sources contradict or confirm one another?

- Access does not seem to be restricted as we can see the suspects are able to traverse different parts of the building. Also all attempts to enter into the vault-room during critical times were successful suggesting a likely security breach.
- Call records show the last call was made at 8:00 PM (murder time), but forensic evidence indicates an emergency call was placed at 8:05 PM - 5 minutes after death. This suggests either: (a) the killer made the emergency call with a burner phone, or (b) someone discovered the body at 8:05 PM.
- Suspect 17 making multiple calls to different persons at the same time: Suspect 17's call records show multiple calls made to different recipients at the exact same timestamp, which is physically impossible. This indicates either: (a) data corruption, (b) call spoofing/fraud, or (c) Suspect 17 is using the system to create a false call record.
- Victim’s call records are incoherent : The victim's call records reveal temporal anomalies: Roland Greene appears to have received multiple overlapping calls, with new incoming calls starting before previous calls ended. This is physically impossible and suggests either: (a) call log tampering by the killer to obscure evidence, (b) the killer used the victim's phone after death to create false records, or (c) system manipulation to alter the timeline.
- Access logs confirm that Suspect 17 entered the Vault Room at 19:56 on 6/1/2025, approximately one minute before the victim (Roland Greene) was last seen alive at 19:57. Forensic evidence places the time of death at 20:00 (8:00 PM). This three-minute window (19:57-20:00) establishes that Suspect 17 was likely alone with the victim in the Vault Room at the time of death. Combined with Suspect 17's fabricated alibi , overlapping phone calls and contradictory location claims, this establishes conclusive evidence of guilt.

**Conclusion**

The investigation has successfully identified the killer and reconstructed the events of June 1, 2025.

1.  The Killer - Jamie Bennett (Cleaner), is positively identified as the murderer based on the following irrefutable evidence. She entered the Vault Room (the crime scene) at 20:00:55, exactly 55 seconds after the fatal gunshot was heard.

She broke into the Office at 20:00:09 (9 seconds after the gunshot), likely to retrieve the Vault access code/key, before proceeding immediately to the Vault.

She claimed to be "At home" but was proven to be active on the premises during the critical window. Therefore she cannot be trusted

1.  Key Witness - The victim was on the phone with Susan Knight (Chef) from 19:56:39 to 20:02:40. Since the murder occurred at 20:00:00, Susan Knight heard the crime take place and is the most critical witness for the prosecution.

1.  Top Suspects & Accomplices

While Jamie Bennett pulled the trigger, the investigation uncovered suspicious behavior from others.

Victor Shaw (Rival): Was in the Vault Room 5 minutes after the murder (20:04:53) and lied about being at the hospital. He likely discovered the body or was involved in the aftermath.

Robin Ahmed (Former Partner): Was in the Vault Room 3.5 minutes before the murder (19:56:35) and lied about leaving early.

1.  Systemic Deception

A disturbing 36% of the suspects (11 out of 30) provided false alibis, indicating a widespread conspiracy or a culture of deep mistrust within the mansion's circle.

1.  Verdict

**Jamie Bennett** _should be arrested immediately for the murder of Roland Greene_. **Susan Knight** _should be brought in for questioning as a primary witness_. **Victor Shaw and Robin Ahmed** _should be investigated for obstruction of justice or conspiracy._

## Appendices

Raw SQL queries.

| QUESTION S/N | SQL **\-** _on google drive_ |
| --- | --- |
| 1   | Q1.sql |
| --- | --- |
| 2   | Q2.sql |
| --- | --- |
| 3   | Q3.sql |
| --- | --- |
| 4   | Q4.sql |
| --- | --- |
| 5   | Q5.sql |
| --- | --- |
| 6   | Q6.sql |
| --- | --- |
| 7   | Q7.sql |
| --- | --- |
| 8   | Q8.sql |
| --- | --- |

Cleaned datasets : **Clean Dataset.xlxs -** _on google drive_

**Additional charts.**

Logic used for Ranking Suspects

Cross reference call record chart: Susan Knight was on the call with the victim as at the time of murder
