-- Habilitar o suporte a foreign keys
PRAGMA foreign_keys = ON;

-- Criando Tabelas

CREATE TABLE IF NOT EXISTS funcionario(
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50),
    sexo CHAR(1),
    dt_nasc DATE,
    salario DECIMAL(10,2),
    cod_depto INTEGER,
    FOREIGN KEY (cod_depto) REFERENCES departamento(codigo)
);

CREATE TABLE IF NOT EXISTS departamento(
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao VARCHAR(50),
    cod_gerente INTEGER,
    FOREIGN KEY (cod_gerente) REFERENCES funcionario(codigo)
);

CREATE TABLE IF NOT EXISTS projeto(
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50),
    descricao VARCHAR(50),
    cod_depto INTEGER,
    cod_responsavel INTEGER,
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (cod_depto) REFERENCES departamento(codigo),
    FOREIGN KEY (cod_responsavel) REFERENCES funcionari(codigo)
);

CREATE TABLE IF NOT EXISTS atividade(
    codigo INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50),
    descricao VARCHAR(50),
    cod_responsavel INTEGER,
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo)
);