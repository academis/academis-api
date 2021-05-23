CREATE TABLE IF NOT EXISTS pessoa (
    id BIGINT PRIMARY KEY,
    version BIGINT NOT NULL DEFAULT 0,
    nome_civil VARCHAR(255) NOT NULL,
    nome_social VARCHAR(255),
    genero VARCHAR(9) NOT NULL,
    data_nascimento DATE,
    data_obito DATE
);

COMMENT ON TABLE pessoa IS 'Dados da pessoa.';
COMMENT ON COLUMN pessoa.id IS 'Identificador único da pessoa.';
COMMENT ON COLUMN pessoa.version IS 'Mecanismo de versionamento do registro.';
COMMENT ON COLUMN pessoa.nome_civil IS 'Nome civil da pessoa.';
COMMENT ON COLUMN pessoa.nome_social IS 'Nome social da pessoa.';
COMMENT ON COLUMN pessoa.genero IS 'Gênero da pessoa.';
COMMENT ON COLUMN pessoa.data_nascimento IS 'Data de nascimento da pessoa.';
COMMENT ON COLUMN pessoa.data_obito IS 'Data de óbito da pessoa.';

CREATE INDEX IF NOT EXISTS pessoa_nome_civil_idx
ON pessoa (nome_civil);

CREATE TABLE IF NOT EXISTS campus (
    id BIGINT PRIMARY KEY,
    version BIGINT NOT NULL DEFAULT 0,
    nome VARCHAR(255) NOT NULL,
    CONSTRAINT campus_nome_uk UNIQUE (nome)
);

COMMENT ON TABLE campus IS 'Dados da pessoa.';
COMMENT ON COLUMN campus.id IS 'Identificador único do campus.';
COMMENT ON COLUMN campus.version IS 'Mecanismo de versionamento do registro.';
COMMENT ON COLUMN campus.nome IS 'Nome do campus.';

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

COMMENT ON TABLE unidade_organizacional IS 'Dados da unidade organizacional.';
COMMENT ON COLUMN unidade_organizacional.id IS 'Identificador único da unidade organizacional.';
COMMENT ON COLUMN unidade_organizacional.version IS 'Mecanismo de versionamento do registro.';
COMMENT ON COLUMN unidade_organizacional.nome IS 'Nome da unidade organizacional.';
COMMENT ON COLUMN unidade_organizacional.sigla IS 'Sigla da unidade organizacional.';
COMMENT ON COLUMN unidade_organizacional.campus_id IS 'Identificador único do campus da unidade organizacional.';

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

COMMENT ON TABLE curso IS 'Dados do curso.';
COMMENT ON COLUMN curso.id IS 'Identificador único do curso.';
COMMENT ON COLUMN curso.version IS 'Mecanismo de versionamento do registro.';
COMMENT ON COLUMN curso.nome IS 'Nome do curso.';
COMMENT ON COLUMN curso.sigla IS 'Sigla do curso.';
COMMENT ON COLUMN curso.codigo_emec IS 'Código EMEC do curso.';
COMMENT ON COLUMN curso.codigo_enade IS 'Código ENADE do curso.';
COMMENT ON COLUMN curso.unidade_organizacional_id IS 'Identificador único da unidade organizacional do curso.';

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

COMMENT ON TABLE matriz_curricular IS 'Dados da matriz curricular.';
COMMENT ON COLUMN matriz_curricular.id IS 'Identificador único da matriz curricular.';
COMMENT ON COLUMN matriz_curricular.version IS 'Mecanismo de versionamento do registro.';
COMMENT ON COLUMN matriz_curricular.nome IS 'Nome da matriz curricular.';
COMMENT ON COLUMN matriz_curricular.decreto IS 'Decreto que instituiu a matriz curricular do curso.';
COMMENT ON COLUMN matriz_curricular.turno IS 'Turno de funcionamento matriz curricular do curso.';
COMMENT ON COLUMN matriz_curricular.grau_academico IS 'Grau acadêmico da matriz curricular.';
COMMENT ON COLUMN matriz_curricular.emissao IS 'Título da matriz curricular para ser emitida em documentos.';
COMMENT ON COLUMN matriz_curricular.titulo_feminino IS 'Título feminino outurgado.';
COMMENT ON COLUMN matriz_curricular.titulo_masculino IS 'Título masculino outurgado.';
COMMENT ON COLUMN matriz_curricular.curso_id IS 'Identificador único do curso da matriz curricular.';
