SELECT * FROM us_project.us_household_income;

SELECT * FROM us_project.us_household_income_statistics;

ALTER TABLE us_project.us_household_income_statistics
	RENAME COLUMN ï»¿id TO id;

SELECT COUNT(id)
FROM us_household_income;

SELECT COUNT(id)
FROM us_household_income_statistics;

SELECT id, COUNT(id)
FROM us_household_income
GROUP BY id
HAVING COUNT(id) > 1;

DELETE FROM us_household_income
WHERE row_id IN (
	SELECT row_id
	FROM (
		SELECT row_id, 
		id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
		FROM us_household_income ) AS dups
	WHERE row_num > 1 );

SELECT DISTINCT State_Name
FROM us_household_income
ORDER BY State_Name; 

UPDATE us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';

SELECT *
FROM us_household_income
WHERE Place = ''
ORDER BY State_Name; 

UPDATE us_household_income
SET Place = 'Autaugaville' 
WHERE County = 'Autauga County'
AND City = 'Vinemont';

SELECT Type, COUNT(Type)
FROM us_household_income
GROUP BY Type;

UPDATE us_household_income 
SET Type = 'Borough'
WHERE Type = 'Boroughs';

SELECT DISTINCT ALand 
	FROM us_household_income
WHERE (ALand = 0 OR Aland = '' OR ALand IS NULL)
;



