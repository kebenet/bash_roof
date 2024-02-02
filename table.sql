
-- Items table
CREATE TABLE IF NOT EXISTS snippets (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	date_create TEXT DEFAULT CURRENT_TIMESTAMP,
	date_modified TEXT DEFAULT CURRENT_TIMESTAMP,
	title TEXT NOT NULL,
	language TEXT NOT NULL,
	code TEXT NOT NULL
);

-- Tags table
CREATE TABLE IF NOT EXISTS tags (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT UNIQUE
);

-- Many-to-Many Relationship table
CREATE TABLE IF NOT EXISTS Main (
	snippets_id INTEGER,
	tag_id INTEGER,
	
	PRIMARY KEY (snippets_id, tag_id),
	
	FOREIGN KEY (snippets_id) REFERENCES snippets(id),
	FOREIGN KEY (tag_id) REFERENCES tags(id)
	
);


-- Create the trigger
CREATE TRIGGER update_date_modified
AFTER UPDATE ON snippets
FOR EACH ROW
BEGIN
   UPDATE snippets SET date_modified = CURRENT_TIMESTAMP WHERE id = OLD.id;
END;

