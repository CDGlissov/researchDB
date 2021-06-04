# Task 5
SHOW INDEX FROM institution;
SHOW INDEX FROM project;
SHOW INDEX FROM participate;
SHOW INDEX FROM researcher;
SHOW INDEX FROM author;
SHOW INDEX FROM article;

# Task 6
SELECT * FROM institution;
SELECT * FROM project;
SELECT * FROM participate;
SELECT * FROM researcher;
SELECT * FROM author;
SELECT * FROM article;

#Task 7
SELECT pname, COUNT(DISTINCT aid) as NDistinctArticles
	FROM project 
    NATURAL LEFT OUTER JOIN participate
	NATURAL LEFT OUTER JOIN author
	GROUP BY pname;

# Task 8
DROP FUNCTION IF EXISTS getOutput;
DELIMITER //
CREATE FUNCTION getOutput(institute VARCHAR(255)) RETURNS INT
BEGIN
    DECLARE iOutput INT;
    
	SELECT COALESCE(SUM(counts), 0) INTO iOutput 
    FROM (
		SELECT rid, iname, COUNT(pname) as counts 
		FROM (
			(SELECT * FROM researcher NATURAL JOIN participate)
			UNION
			(SELECT * FROM researcher NATURAL JOIN author)) AS t1 
		WHERE iname=institute GROUP BY rid
    ) AS t2;
    
	RETURN iOutput;
END; //
DELIMITER ;

SELECT iname AS institute, getOutput(iname) AS productivity_Output 
FROM institution 
ORDER BY productivity_Output DESC;

# Task 9
UPDATE institution SET iname="New DTU" WHERE iname = "DTU";
SELECT * FROM project;
SELECT * FROM institution;
SELECT * FROM researcher;

UPDATE institution SET iname="DTU" WHERE iname = "New DTU";
DELETE FROM project WHERE pname = "Project Enigma";
SELECT * FROM project;
SELECT * FROM participate;