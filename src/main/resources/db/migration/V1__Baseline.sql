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
    nome VARCHAR(255) NOT NULL,
    CONSTRAINT campus_nome_uk UNIQUE (nome)
);

CREATE TABLE IF NOT EXISTS unidade_organizacional (
    id BIGINT PRIMARY KEY,
    version BIGINT NOT NULL DEFAULT 0,
    nome VARCHAR(255) NOT NULL,
    sigla CHAR(20) NOT NULL,
    campus_id BIGINT NOT NULL,
    CONSTRAINT campus_id_fk FOREIGN KEY (campus_id)
    REFERENCES campus(id),
    CONSTRAINT unidade_organizacional_sigla_uk UNIQUE (sigla)
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
    REFERENCES unidade_organizacional(id),
    CONSTRAINT curso_sigla_uk UNIQUE (sigla)
);

CREATE TABLE IF NOT EXISTS matriz_curricular (
    id BIGINT PRIMARY KEY,
    version BIGINT NOT NULL DEFAULT 0,
    nome VARCHAR(255) NOT NULL,
    decreto VARCHAR(255),
    turno CHAR(28) NOT NULL,
    grau_academico CHAR(12) NOT NULL,
    emissao VARCHAR(255),
    titulo_feminino VARCHAR(255),
    titulo_masculino VARCHAR(255),
    curso_id BIGINT NOT NULL,
    CONSTRAINT curso_id_fk FOREIGN KEY (curso_id)
    REFERENCES curso(id),
    CONSTRAINT matriz_curricular_nome_curso_uk UNIQUE (nome, curso_id)
);
