/*Queries that provide answers to the questions from all projects.*/

/*Second milestone*/

-- Animals whose species = undefined rool back null
UPDATE public.animals
 SET species = 'unespecified';
 
SELECT species from animals
 ROLLBACK;
 
SELECT species from animals


-- Animals set pokemon or digimon
UPDATE public.animals
    SET species ='Digimon'
    WHERE name LIKE '%mon';
	
UPDATE public.animals
    SET species ='Pokemon'
    WHERE species IS NULL;

-- delete and roll back table

BEGIN;
    SAVEPOINT deleted_table;
    DELETE FROM animals;
    ROLLBACK TO deleted_table;
COMMIT;

-- Delete all animals born after Jan 1st, 2022, animals' weight to be their weight multiplied by -1.
--Rollback to the savepoint 
-- Update all animals' weights that are negative to be their weight multiplied by -1

BEGIN;
    DELETE FROM animals
        WHERE date_of_birth > '2022-01-01';
        
    SAVEPOINT delete_animals;
    
    UPDATE animals SET weight_kg = weight_kg * -1;
    ROLLBACK TO delete_animals;
    
    UPDATE animals SET weight_kg = weight_kg * -1
    WHERE weight_kg < 0;
COMMIT;

--milestone 2 queries 

SELECT count(*) FROM animals;


SELECT count(*) FROM animals
    WHERE escape_attempts=0;


SELECT avg(weight_kg) FROM animals;

SELECT neutered, avg(escape_attempts) "Average of escape attempts"
FROM animals
GROUP BY neutered;


SELECT 
    species, 
    MIN(weight_KG) "Min weight", 
    MAX(weight_KG) "Max weight" 
FROM animals 
GROUP BY species;


SELECT 
    species, 
    AVG(escape_attempts) "escape attempts average"
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;



/* first milestone*/

-- Animals whose name ends in "mon".
SELECT *
    FROM animals
    WHERE name LIKE '%mon';

-- Animals born between 2016 and 2019.
SELECT name
    FROM animals
    WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- Animals that are neutered and have less than 3 escape attempts.
SELECT name
    FROM animals
    WHERE neutered = true AND escape_attempts < 3;

-- Animals named either "Agumon" or "Pikachu".
SELECT date_of_birth
    FROM animals 
    WHERE name = 'Agumon' OR name = 'Pikachu';

-- Animals that weigh more than 10.5kg
SELECT 
    name,
    escape_attempts
    FROM animals 
    WHERE weight_kg > 10.5;

-- Animals that are neutered.
SELECT *
    FROM animals
    WHERE neutered = true;

-- Animals not named Gabumon.
SELECT *
    FROM animals
    WHERE name != 'Gabumon';

-- Animals with a weight between 10.4kg and 17.3kg
SELECT *
    FROM animals
    WHERE weight_kg >= 10.4 AND weight_kg <=17.3;
