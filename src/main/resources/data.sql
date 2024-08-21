use cdapp;

INSERT INTO artist (name) VALUES
('Pink Floyd'),
('The Beatles'),
('Harry Chapin'),
('Jimmy Buffet');


INSERT INTO cd (title, artist_id) VALUES
('Brilliant Choices', (SELECT artist_id FROM artist where name = 'Pink Floyd')),
('Dark Side of the Moon', (SELECT artist_id FROM artist where name = 'Pink Floyd')),
('Abby road', (SELECT artist_id FROM artist where name = 'The Beatles')),
('Heads and Tails', (SELECT artist_id FROM artist where name = 'Harry Chapin')),
('Bars, Boats & Ballads', (SELECT artist_id FROM artist where name = 'Jimmy Buffet'));
