
-- Desabilitar o suporte a foreign keys
PRAGMA foreign_keys = OFF;

-- Iniciando Commit
BEGIN TRANSACTION;

-- Retirando tabelas

DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS departamento;
DROP TABLE IF EXISTS projeto;
DROP TABLE IF EXISTS atividade;

-- Criando Tabelas

CREATE TABLE funcionario(
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50),
    sexo CHAR(1),
    dt_nasc DATE,
    salario DECIMAL(10,2),
    cod_depto INTEGER,
    cod_supervisor INTEGER,
    FOREIGN KEY (cod_depto) REFERENCES departamento(codigo) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (cod_supervisor) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE departamento(
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    sigla VARCHAR(5),
    descricao VARCHAR(50),
    cod_gerente INTEGER,
    FOREIGN KEY (cod_gerente) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE projeto(
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50),
    descricao VARCHAR(50),
    cod_depto INTEGER,
    cod_responsavel INTEGER,
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (cod_depto) REFERENCES departamento(codigo) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (cod_responsavel) REFERENCES funcionari(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE atividade(
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50),
    descricao VARCHAR(50),
    cod_responsavel INTEGER,
    cod_projeto INTEGER,
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (cod_projeto) REFERENCES projeto(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Fazendo o commit
COMMIT;

-- Habilitar o suporte a foreign keys
PRAGMA foreign_keys = ON;