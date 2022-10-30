CREATE DATABASE music_festival;

CREATE ROLE festival_read_write WITH login encrypted password 'writer';

GRANT ALL PRIVILEGES ON DATABASE music_festival TO festival_read_write;
