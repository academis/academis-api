CREATE TABLE IF NOT EXISTS pessoa (
    id BIGINT PRIMARY KEY,
    version BIGINT NOT NULL DEFAULT 0,
    nome_civil VARCHAR(255) NOT NULL,
    nome_social VARCHAR(255),
    genero VARCHAR(9) NOT NULL,
    data_nascimento DATE,
    data_obito DATE
);

CREATE INDEX IF NOT EXISTS pessoa_nome_civil_idx
ON pessoa (nome_civil);

CREATE TABLE IF NOT EXISTS campus (
    id BIGINT PRIMARY KEY,
    version BIGINT NOT NULL DEFAULT 0,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS unidade_organizacional (
    id BIGINT PRIMARY KEY,
    version BIGINT NOT NULL DEFAULT 0,
    nome VARCHAR(255) NOT NULL,
    sigla CHAR(20) NOT NULL,
    campus_id BIGINT NOT NULL,
    CONSTRAINT campus_id_fk FOREIGN KEY (campus_id)
    REFERENCES campus(id)
);

CREATE TABLE IF NOT EXISTS curso (
    id BIGINT PRIMARY KEY,
    version BIGINT NOT NULL DEFAULT 0,
    nome VARCHAR(255) NOT NULL,
    sigla CHAR(20) NOT NULL,
    codigo_emec CHAR(10) NOT NULL,
    codigo_enade CHAR(8) NOT NULL,
    unidade_organizacional_id BIGINT NOT NULL,
    CONSTRAINT unidade_organizacional_id_fk FOREIGN KEY (unidade_organizacional_id)
    REFERENCES unidade_organizacional(id)
);
