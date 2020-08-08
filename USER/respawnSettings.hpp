//WAVE RESPAWN =================================================================
waveRespawnEnabled = 1;                                                         //Wave Respawn ein-/ausschalten (1/0)

bluforWaveSize = 9999;                                                            //Wellengröße Blufor (-1 == automatisch)
opforWaveSize = 9999;                                                             //Wellengröße Opfor (-1 == automatisch)
indepWaveSize = 9999;                                                             //Wellengröße Independent (-1 == automatisch)
civWaveSize = 9999;                                                               //Wellengröße Civilian (-1 == automatisch)

bluforWaveLifes = 9999;                                                         //Wie oft ein Blufor Spieler respawnen kann
opforWaveLifes = 9999;                                                          //Wie oft ein Opfor Spieler respawnen kann
indepWaveLifes = 9999;                                                          //Wie oft ein Independent Spieler respawnen kann
civWaveLifes = 9999;                                                            //Wie oft ein Civilian Spieler respawnen kann

bluforInterruptCondition = "false";                                             //Bedingung nach der der Blufor Waverespawn deaktiviert wird
opforInterruptCondition = "false";                                              //Bedingung nach der der Opfor Waverespawn deaktiviert wird
indepInterruptCondition = "false";                                              //Bedingung nach der der Independent Waverespawn deaktiviert wird
civInterruptCondition = "false";                                                //Bedingung nach der der Civilian Waverespawn deaktiviert wird

waverespawntimePlayer = 0;                                                     //Spielerrespawnzeit, bevor er der Welle hinzugefügt wird

waverespawntimeBlu = 9999;                                                        //Wellenrespawnzeit Blufor in Sekunden
waverespawntimeOpf = 9999;                                                        //Wellenrespawnzeit Opfor in Sekunden
waverespawntimeInd = 9999;                                                        //Wellenrespawnzeit Independent in Sekunden
waverespawntimeCiv = 9999;                                                        //Wellenrespawnzeit Civilian in Sekunden


//NORMALER RESPAWN =============================================================//Diese Einträge sind nur bei ausgeschaltetem Wave Respawn wichtig
respawntimeBlu = 9999;                                                          //Respawnzeit Blufor in Sekunden
respawntimeOpf = 9999;                                                          //Respawnzeit Opfor in Sekunden
respawntimeInd = 9999;                                                          //Respawnzeit Independent in Sekunden
respawntimeCiv = 9999;                                                          //Respawnzeit Civilian in Sekunden

// WAVE RESPAWN IS TRIGGERED NOT IN LOOP BUT VIA FNC
waveRespawnManual = 1;