ALTER TABLE db_version CHANGE COLUMN required_9763_01_mangos_battleground_template required_9766_01_mangos_spell_proc_event bit;

DELETE FROM spell_proc_event WHERE entry = 54936;