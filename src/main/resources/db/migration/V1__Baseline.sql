CREATE TABLE IF NOT EXISTS pessoa (
    id BIGINT PRIMARY KEY,
    version BIGINT NOT NULL DEFAULT 0,
    nome_civil VARCHAR(255) NOT NULL,
    nome_social VARCHAR(255),
    genero VARCHAR(9) NOT NULL,
    data_nascimento DATE,
    data_obito DATE
);

