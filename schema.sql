/* Database schema to keep the structure of entire database. */

CREATE TABLE IF NOT EXISTS public.animals
(
    id bigint NOT NULL,
    name name COLLATE pg_catalog."C" NOT NULL,
    date_of_birth date NOT NULL,
    neutered boolean NOT NULL,
    weight_kg numeric NOT NULL,
    escape_attempts bigint,
    CONSTRAINT animals_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;
