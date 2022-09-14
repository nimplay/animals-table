/*Queries that provide answers to the questions from all projects.*/

/*Fourth milestone*/
--Who was the last animal seen by William Tatcher?

SELECT vets.name, visits.visit_date, animals.name
FROM vets
JOIN visits ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'William Tatcher'
ORDER BY visit_date DESC
FETCH FIRST ROW ONLY 

--How many different animals did Stephanie Mendez see?

SELECT count(animals.name)
FROM vets
JOIN visits ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'Stephanie Mendez'

--List all vets and their specialties, including vets with no specialties.

SELECT vets.name, species.name
    FROM specializations
    FULL JOIN vets ON vets_id = vets.id
    FULL JOIN species On species_id = species.id;

--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT vets.name, visits.visit_date, animals.name
    FROM vets
    JOIN visits ON vets.id = visits.vets_id
    JOIN animals ON animals.id = visits.animals_id
    WHERE vets.name = 'Stephanie Mendez'
        AND visits.visit_date 
            BETWEEN '2020-04-01' AND '2020-08-01';

--What animal has the most visits to vets?

SELECT animals.name, count(visit_date) "visits amount"
    FROM visits
    JOIN animals ON animals.id = animals_id
    GROUP BY animals.name
    ORDER BY "visits amount" DESC;

--Who was Maisy Smith's first visit?

SELECT vets.name, visits.visit_date, animals.name
    FROM vets
    JOIN visits ON vets.id = visits.vets_id
    JOIN animals ON animals.id = visits.animals_id
    WHERE vets.name = 'Maisy Smith'
    ORDER BY visit_date ASC
    FETCH FIRST ROW ONLY 

--Details for most recent visit: animal information, vet information, and date of visit.

SELECT animals.name, vets.name, visit_date 
  FROM visits
  JOIN vets ON vets_id = vets.id
  JOIN animals ON animals_id = animals.id
  ORDER BY visit_date DESC
  FETCH FIRST ROW ONLY;

-- How many visits were with a vet that did not specialize in that animal's species?

SELECT Count(*)
    FROM specializations 
    FULL JOIN vets ON vets.id = specializations.vets_id
    FULL JOIN visits ON vets.id = visits.vets_id
    FULL JOIN animals On visits.animals_id = animals.id
    FULL JOIN species On animals.species_id = species.id
    WHERE vets.name != 'Stephanie Mendez' AND (
        specializations.species_id != species.id 
        OR specializations.species_id 
        IS NULL 
    );

--What specialty should Maisy Smith consider getting? Look for the species she gets the most. 

SELECT count(species.id),species.name
    FROM vets
    FULL JOIN visits ON vets.id = visits.vets_id
    FULL JOIN animals On visits.animals_id = animals.id
    FULL JOIN species On animals.species_id = species.id
    WHERE vets.name = 'Maisy Smith'
    GROUP BY species.name 
    ORDER BY count DESC
    FETCH FIRST ROW ONLY;

    

/* Thred milestone*/
--set animal specie
UPDATE public.animals
    SET species_id = 2
    WHERE name LIKE '%mon';
	
UPDATE public.animals
    SET species_id =1
    WHERE species_id IS NULL;
--set owner for each animal
UPDATE public.animals
    SET owner_id = 1
    WHERE name LIKE 'Agumon';

--Animals belong to Melody Pond?

SELECT name, full_name Owner 
    FROM owners
    JOIN animals ON owners.id = animals.owner_id
    WHERE owners.full_name = 'Melody Pond';

--Lists of animals that are pokemon 

SELECT animals.name, species.name 
    FROM animals 
    JOIN species 
    ON animals.species_id = species.id
    WHERE species.name = 'pokemon';

--List all owners and their animals, remember to include those that don't own any animal.

SELECT animals.name, owners.full_name
FROM animals 
FULL JOIN owners ON owners.id = animals.owner_id;

--How many animals are there per species?

SELECT count(animals.name), species.name
    FROM species 
    JOIN animals ON species.id = animals.species_id
    GROUP BY species.name;
--List all Digimon owned by Jennifer Orwell.

SELECT animals.name
  FROM animals
  JOIN owners ON animals.owner_id = owners.id
  WHERE owners.full_name = 'Jennifer Orwell';

--List all animals owned by Dean Winchester that haven't tried to escape.

SELECT animals.name 
    FROM animals
    JOIN owners ON animals.owner_id = owners.id
    WHERE owners.full_name = 'Dean Winchester' 
        AND animals.escape_attempts = 0;

--Who owns the most animals?

SELECT owners.full_name, count(animals.name) as animals
  FROM animals
    JOIN owners ON animals.owner_id = owners.id
    GROUP BY owners.full_name
    ORDER BY animals DESC;

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
