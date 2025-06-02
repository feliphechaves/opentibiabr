function onUpdateDatabase()
	logger.info("Updating database to version 52 (fix: player_charms foreign key with ON DELETE CASCADE)")

	-- Remove registros órfãos que impediriam a criação da FK
	db.query([[
		DELETE FROM player_charms
		WHERE player_id NOT IN (SELECT id FROM players);
	]])

	-- Cria a nova constraint com ON DELETE CASCADE
	db.query([[
		ALTER TABLE `player_charms`
		ADD CONSTRAINT player_charms_players_fk
		FOREIGN KEY (player_id)
		REFERENCES players(id)
		ON DELETE CASCADE;
	]])
end
