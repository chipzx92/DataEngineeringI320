CREATE ROLE festival_read_write WITH login encrypted password 'writer';
GRANT pg_read_server_files TO festival_read_write;
GRANT ALL PRIVILEGES ON DATABASE music_festival TO festival_read_write;
GRANT ALL PRIVILEGES ON SCHEMA festival TO festival_read_write;
GRANT ALL PRIVILEGES ON SCHEMA analytics TO festival_read_write;
GRANT SELECT ON TABLE festival.bands TO festival_read_write;
GRANT SELECT ON TABLE festival.venues TO festival_read_write;
GRANT SELECT ON TABLE festival.performances TO festival_read_write;
GRANT SELECT ON TABLE festival.people TO festival_read_write;
GRANT SELECT ON TABLE festival.tickets TO festival_read_write;
GRANT SELECT ON TABLE festival.purchases TO festival_read_write;
