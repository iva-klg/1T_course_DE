CREATE TABLE IF NOT EXISTS public.books
(
	ID_book serial,
	ID_publishing integer,
	Code_book varchar(30) NOT NULL,
	Name_book varchar(255) NOT NULL,
	Publication_year smallint NOT NULL,
	Price NUMERIC (7,2) NOT NULL,
	PRIMARY KEY (ID_book),
    FOREIGN KEY (ID_publishing)
		REFERENCES publishing (ID_publishing)
);

CREATE TABLE IF NOT EXISTS public.publishing
(
	ID_publishing serial,
	Name_publishing varchar(255) NOT NULL,
	City varchar(30) NOT NULL
	PRIMARY KEY (ID_publishing)
);

CREATE TABLE IF NOT EXISTS public.readers 
(
	ID_reader serial,
	Reader_ticket varchar(10),
	Reader_name varchar(255),
	Reader_Address varchar(255),
	Phone_number varchar(15),
	PRIMARY KEY (ID_reader)
);

CREATE TABLE IF NOT EXISTS public.issue
(
	ID_issue serial,
	ID_reader integer,
	ID_book integer,
	Date_issue date NOT NULL,
	Return_date date,
	Actual_return_date date
	PRIMARY KEY (ID_issue)
	FOREIGN KEY ID_reader
		REFERENCES readers (ID_reader)
		ON DELETE CASCADE
		ON UPDATE CASCADE
	FOREIGN KEY ID_book
		REFERENCES books (ID_book)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS public.authors
(
	ID_author serial,
	Name_author varchar(200) NOT NULL,
	PRIMARY KEY (ID_author)	
);

CREATE TABLE IF NOT EXISTS public.authorship
(
	ID_ authorship serial,
	ID_author integer,
	ID_book integer,
	PRIMARY KEY (ID_ authorship)
	FOREIGN KEY ID_author
		REFERENCES authors (ID_author)
	FOREIGN KEY ID_book
		REFERENCES books (ID_book)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

