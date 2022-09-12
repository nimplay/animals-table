/*Queries that provide answers to the questions from all projects.*/

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
