/* Populate database with sample data. */

-- milestone 4
INSERT INTO vets (name, age, date_of_graduation)
VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(vets_id, species_id)
VALUES
(1,1),
(3,1),
(3,2),
(4,2);

INSERT INTO visits (visit_date, vets_id, animals_id)
VALUES('2020-05-24', 
	   (SELECT id FROM vets WHERE name = 'William Tatcher'), 
	   (SELECT id FROM animals WHERE name = 'Agumon'))

INSERT INTO visits (visit_date, vets_id, animals_id)
VALUES(
  '2020-07-22',
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animals WHERE name = 'Agumon')
)

INSERT INTO visits (visit_date, vets_id, animals_id)
VALUES(
  '2021-02-02',  
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animals WHERE name = 'Gabumon')
),
(
  '2020-01-05',
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Pikachu')
)

INSERT INTO visits (visit_date, vets_id, animals_id)
VALUES
(
  '2020-03-08',  
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Pikachu')
),
(
  '2020-05-14',  
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Pikachu')
),
(
  '2021-05-04', 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animals WHERE name = 'Devimon')
),
(
  '2021-02-24',
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animals WHERE name = 'Charmander')
),
(
  '2019-12-21', 
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Plantmon')
),
(
  '2020-08-10', 
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  (SELECT id FROM animals WHERE name = 'Plantmon')
)

INSERT INTO visits (visit_date, vets_id, animals_id)
VALUES
(
  '2021-04-07', 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Plantmon')
),
(
  '2019-09-29', 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animals WHERE name = 'Squirtle')
),
(
  '2020-10-03', 
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animals WHERE name = 'Angemon')
),
(
  '2020-11-04', 
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animals WHERE name = 'Angemon')
),
(
  '2019-01-24', 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Boarmon')
),
(
  '2019-05-15', 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Boarmon')
)

INSERT INTO visits (visit_date, vets_id, animals_id)
VALUES
(
  '2020-02-27', 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Boarmon')
),
(
  '2020-08-03', 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animals WHERE name = 'Boarmon')
),
(
  '2020-05-24', 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animals WHERE name = 'Blossom')
),
(
  '2021-01-11', 
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  (SELECT id FROM animals WHERE name = 'Blossom')
)

-- milestone_3
INSERT INTO owners (
    id,
	full_name,
	age      
)
VALUES 
    (1, 'am Smith', 34),
    (2, 'Jennifer Orwell', 19),
    (3, 'Bob', 45),
    (4, 'Melody Pond', 77),
    (5, 'Dean Winchester', 14),
    (6, 'Jodie Whittaker', 38)

INSERT INTO species (
    id,
	  name
)
VALUES 
    (1, 'pokemon'),
    (2, 'digimon')

UPDATE public.animals
     SET owner_id = 1
   WHERE  name = 'Agumon'

UPDATE public.animals
     SET owner_id = 2
   WHERE  name = 'Gabumon' AND name = 'Pikachu'

UPDATE public.animals
     SET owner_id = 3
   WHERE  name = 'Plantmon'

UPDATE public.animals
     SET owner_id = 5
   WHERE  name = 'Charmander' AND name = 'Squirtle' AND name = 'Blossom'

UPDATE public.animals
     SET owner_id = 5
   WHERE  name = 'Angemon' AND name = 'Boarmon'

--milestone 2

INSERT INTO animals (
      name,
      date_of_birth,
      escape_attempts,
      neutered,  
      weight_kg
)
VALUES 
    ('Charmander', '2020-02-08', 0, false, -11.00),
    ('Plantmon', '2021-11-15', 2, true, -5.70),
    ('Squirtle', '1993-04-2', 3, false, -12.13),
    ('Angemon', '2005-06-12', 1, true, -45.00),
    ('Boarmon', '2005-06-07', 7, true, 20.40),
    ('Blossom', '1998-10-13', 3, true, 17.00),
    ('Ditto', '2022-05-14', 4, true, 22.00);


--milestone 1

INSERT INTO  animals (
  id,
  name, 
  date_of_birth, 
  neutered
  weight_kg,
  escape_attempts
)
VALUES (
    1,
    'Agumon',
    '2020-02-03',
    false,
    10.23,
    0
);

INSERT INTO  animals (
  id,
  name, 
  date_of_birth, 
  neutered
  weight_kg,
  escape_attempts
)
VALUES (
    2,
    'Gabumon',
    '2018-11-15',
    false,
    8,
    2
);

INSERT INTO  animals (
  id,
  name, 
  date_of_birth, 
  neutered
  weight_kg,
  escape_attempts
)
VALUES (
    3,
    'Pikachu',
    '2021-01-07',    
    false,
    15.04,
    1
);

INSERT INTO  animals (
  id,
  name, 
  date_of_birth, 
  neutered
  weight_kg,
  escape_attempts
)
VALUES (
    4,
    'Devimon',
    '2017-05-12',
    true,
    11,
    5
);