/* Database schema to keep the structure of entire database. */
--milestone_4

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(60),
    age INT,
    date_of_graduation DATE
)

CREATE TABLE visits (
    visit_date DATE,
    animals_id INT REFERENCES animals(id),
    vets_id    INT REFERENCES vets(id)
);


-- milestone_3

-- animals
CREATE TABLE IF NOT EXISTS public.animals
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(100) COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts integer DEFAULT 0,
    neutered boolean DEFAULT true,
    weight_kg numeric,
    species_id integer,
    owner_id integer,
    CONSTRAINT animals_pkey PRIMARY KEY (id),
    CONSTRAINT animals_owner_id_fkey FOREIGN KEY (owner_id)
        REFERENCES public.owners (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT animals_species_id_fkey FOREIGN KEY (species_id)
        REFERENCES public.species (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;

-- owners

CREATE TABLE IF NOT EXISTS public.owners
(
    id bigint NOT NULL,
    full_name text COLLATE pg_catalog."default" NOT NULL,
    age bigint NOT NULL,
    CONSTRAINT owners_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.owners
    OWNER to postgres;

-- species

CREATE TABLE IF NOT EXISTS public.species
(
    id bigint NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT species_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.species
    OWNER to postgres;



/*milestone_1*/


CREATE TABLE IF NOT EXISTS public.animals
(
    id bigint NOT NULL,
    name name COLLATE pg_catalog."C" NOT NULL,
    date_of_birth date NOT NULL,
    neutered boolean NOT NULL,
    weight_kg numeric NOT NULL,
    escape_attempts bigint,
    species text COLLATE pg_catalog."default",
    CONSTRAINT animals_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;
