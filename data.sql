/* Populate database with sample data. */

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