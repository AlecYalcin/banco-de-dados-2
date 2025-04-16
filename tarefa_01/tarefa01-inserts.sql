
-- Desabilitar o suporte a foreign keys
PRAGMA foreign_keys = OFF;


-- Povoamento Inicial

INSERT INTO departamento
(sigla, descricao, cod_gerente)
VALUES ('DHC', 'Dep História', NULL);

INSERT INTO departamento
(sigla, descricao, cod_gerente)
VALUES ('DCT', 'Dep Computação', NULL);

INSERT INTO departamento
(sigla, descricao, cod_gerente)
VALUES ('DGC', 'Dep Geografia', NULL);

INSERT INTO departamento
(sigla, descricao, cod_gerente)
VALUES ('DXT', NULL, NULL);

-- Adicionando Gerentes

INSERT INTO funcionario
(nome, sexo, dt_nasc, salario, cod_supervisor, cod_depto)
VALUES ('Ana', 'F', '1988-05-07', 2500.00, NULL, 1);

INSERT INTO funcionario
(nome, sexo, dt_nasc, salario, cod_supervisor, cod_depto)
VALUES ('Taciano', 'M', '1980-01-25', 2500.00, NULL, 2);

update departamento set cod_gerente = 1 where sigla = 'DHC';
update departamento set cod_gerente = 2 where sigla = 'DCT';

-- Adicionando Funcionários

INSERT INTO funcionario
(nome, sexo, dt_nasc, salario, cod_supervisor, cod_depto)
VALUES ('Maria', 'F', '1981-07-01', 2500.00, 1, 1);

INSERT INTO funcionario
(nome, sexo, dt_nasc, salario, cod_supervisor, cod_depto)
VALUES ('Josefa', 'F', '1986-09-17', 2500.00, 1, 1);

INSERT INTO funcionario
(nome, sexo, dt_nasc, salario, cod_supervisor, cod_depto)
VALUES ('Carlos', 'M', '1985-11-21', 2500.00, 1, 1);

INSERT INTO funcionario
(nome, sexo, dt_nasc, salario, cod_supervisor, cod_depto)
VALUES ('Humberto', 'M', '1970-05-07', 1500.00, 2, 2);

INSERT INTO funcionario
(nome, sexo, dt_nasc, salario, cod_supervisor, cod_depto)
VALUES ('José', 'M', '1979-07-12', 3500.00, 2, 2);

INSERT INTO funcionario
(nome, sexo, dt_nasc, salario, cod_supervisor, cod_depto)
VALUES ('Xuxa', 'F', '1970-03-28', 13500.00, NULL, NULL);

INSERT INTO funcionario
(nome, sexo, dt_nasc, salario, cod_supervisor, cod_depto)
VALUES ('Sasha', 'F', '1970-03-28', 1500.00, 3, 1);

INSERT INTO funcionario
(nome, sexo, dt_nasc, salario, cod_supervisor, cod_depto)
VALUES ('Victor', 'M', '1970-03-28', 500.00, 4, 1);

INSERT INTO funcionario
(nome, sexo, dt_nasc, salario, cod_supervisor, cod_depto)
VALUES ('Doisberto', 'M', '1980-07-14', 2500.00, 3, 3);

INSERT INTO funcionario
(nome, sexo, dt_nasc, salario, cod_supervisor, cod_depto)
VALUES ('Tresberta', 'F', '1992-09-01', 3000.00, 4, 3);

-- Adicionando Projetos

INSERT INTO projeto(nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim)
VALUES ('APF', 'Analisador de Ponto de Função', 2, 2, '2018-02-26', '2019-06-30');

INSERT INTO projeto(nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim)
VALUES ('Monitoria', 'Projeto de Monitoria 2019.1', 1, 6, '2019-02-26', '2019-12-30');

INSERT INTO projeto(nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim)
VALUES ('BD', 'Projeto de Banco de Dados', 3, 5, '2018-02-26', '2018-06-30');

INSERT INTO projeto(nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim)
VALUES ('ES', 'Projeto de Engenharia de Software', 1, 1, '2018-02-26', '2018-06-30');

-- Adicionando Atividades

INSERT INTO atividade(descricao, cod_projeto, data_inicio, data_fim)
VALUES ('APF - Atividade 1', 1, '2018-02-26', '2018-06-30');
INSERT INTO atividade(descricao, cod_projeto, data_inicio, data_fim)
VALUES ('APF - Atividade 2', 1, '2018-06-26', '2018-07-30');
INSERT INTO atividade(descricao, cod_projeto, data_inicio, data_fim)
VALUES ('APF - Atividade 3', 1, '2018-08-26', '2018-09-30');
INSERT INTO atividade(descricao, cod_projeto, data_inicio, data_fim)
VALUES ('APF - Atividade 4', 1, '2018-08-26', '2018-09-30');
INSERT INTO atividade(descricao, cod_projeto, data_inicio, data_fim)
VALUES ('APF - Atividade 5', 1, '2018-09-30', '2018-10-30');

INSERT INTO atividade(descricao, cod_projeto, data_inicio, data_fim)
VALUES ('Monitoria - Atividade 1', 2, '2018-06-26', '2018-07-30');

INSERT INTO atividade(descricao, cod_projeto, data_inicio, data_fim)
VALUES ('BD - Atividade 1', 3, '2018-06-26', '2018-07-30');
INSERT INTO atividade(descricao, cod_projeto, data_inicio, data_fim)
VALUES ('BD - Atividade 2', 3, '2018-08-26', '2018-09-30');
INSERT INTO atividade(descricao, cod_projeto, data_inicio, data_fim)
VALUES ('BD - Atividade 3', 3, '2018-08-26', '2018-09-30');

INSERT INTO atividade(descricao, cod_projeto, data_inicio, data_fim)
VALUES ('ES - Atividade 1', 4, '2018-09-30', '2018-10-30');
INSERT INTO atividade(descricao, cod_projeto, data_inicio, data_fim)
VALUES ('ES - Atividade 2', 4, '2018-06-26', '2018-07-30');

-- Habilitar o suporte a foreign keys
PRAGMA foreign_keys = ON;