/*
Research Database for the exam of course 02170
Database created by: Christian Glissov, s146996
*/

#Create, use database and drop it if it already exists
DROP DATABASE IF EXISTS ResearchDatabase;
CREATE DATABASE ResearchDatabase;
USE ResearchDatabase;

# If the tables already exists, then they are deleted
DROP TABLE IF EXISTS institution;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS participate;
DROP TABLE IF EXISTS researcher;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS article;

# Table creation
CREATE TABLE institution
	(iname			VARCHAR(255) NOT NULL,
	 country		VARCHAR(100) NOT NULL,
	 PRIMARY KEY(iname)
	);
    
    CREATE TABLE project
	(pname			VARCHAR(255) NOT NULL,
	 iname			VARCHAR(255) NOT NULL,
	 PRIMARY KEY(pname),
     FOREIGN KEY(iname) REFERENCES institution(iname)
     ON UPDATE CASCADE
	);
    
	CREATE TABLE researcher
	(rid			INT UNSIGNED NOT NULL AUTO_INCREMENT,
	 iname			VARCHAR(255) NOT NULL,
     first_name		VARCHAR(255) NOT NULL,
     last_name		VARCHAR(255) NOT NULL,
	 PRIMARY KEY(rid),
	 FOREIGN KEY(iname) REFERENCES institution(iname)
     ON UPDATE CASCADE
	);
    
    CREATE TABLE article
	(aid			INT UNSIGNED NOT NULL AUTO_INCREMENT,
	 aname			VARCHAR(255) NOT NULL,
     time_year		YEAR NOT NULL,
	 PRIMARY KEY(aid)
	);
    
    CREATE TABLE participate
	(pname			VARCHAR(255) NOT NULL,
	 rid			INT UNSIGNED NOT NULL,
	 PRIMARY KEY(pname, rid),
     FOREIGN KEY(pname) REFERENCES project(pname) 
     ON DELETE CASCADE
     ON UPDATE CASCADE,
     FOREIGN KEY(rid) REFERENCES researcher(rid)
     ON UPDATE CASCADE
	);

    
    CREATE TABLE author
	(aid			INT UNSIGNED NOT NULL,
	 rid			INT UNSIGNED NOT NULL,
	 PRIMARY KEY(aid, rid),
     FOREIGN KEY(aid) REFERENCES article(aid) 
     ON DELETE CASCADE
     ON UPDATE CASCADE,
     FOREIGN KEY(rid) REFERENCES researcher(rid)
     ON UPDATE CASCADE
	);
    
    # Insertion of rows
    INSERT institution VALUES
    ("DTU", "Denmark"),
    ("KU", "Denmark"),
    ("CALTECH", "USA"),
    ("ITU", "Denmark"),
    ("Oxford University","England"),
    ("Århus University","Denmark"),
    ("University of Amsterdam","Netherlands");
    
	INSERT project VALUES
    ("Master Thesis", "DTU"),
    ("Confidential Project","KU"),
    ("Chinese Military Research","DTU"),
    ("Project Enigma","Oxford University"),
    ("Sustainable Development Goals", "DTU");
    
    INSERT researcher VALUES
    (1, "DTU", "Christian", "Glissov"),
    (2, "DTU", "Anna", "Lia"),
    (3, "DTU", "Anne", "Haxthausen"),
    (4, "Oxford University", "Stephen", "Hawking"),
    (5, "Oxford University", "Alan", "Turing"),
    (6, "University of Amsterdam", "Diederik", "Kingma"),
    (7, "Århus University", "Erik", "Eriksen");
    
    INSERT article VALUES
    (1,"Recurrent Flow Networks: A Recurrent Latent Variable Model for Spatio-Temporal Density Modelling", 2019),
    (2, "The RAISE Specification Language", 1992),
    (3, "Missing importance-weighted autoencoders withStudent’s t-prior", 2020),
    (4, "Auto-Encoding Variational Bayes", 2014);
    
    INSERT participate VALUES
    ("Sustainable Development Goals", 2),
    ("Sustainable Development Goals", 1),
    ("Project Enigma", 5),
    ("Confidential Project", 5),
    ("Confidential Project", 4),
    ("Sustainable Development Goals", 5);
    
    INSERT author VALUES
    (2, 3),
    (3, 1),
    (3, 5),
    (4, 6),
    (1, 1),
    (4, 7);
    
    

    