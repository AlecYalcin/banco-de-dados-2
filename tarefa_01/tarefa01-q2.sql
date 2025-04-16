-- Faça uma consulta que selecione o nome de todos os funcionários, exceto o mais idoso.

CREATE VIEW funcionarios_mais_novos AS
    WITH mais_velho AS(
        SELECT MIN(dt_nasc) as max_nasc
        FROM funcionario
    )
    SELECT nome
    FROM funcionario
    WHERE dt_nasc > (SELECT max_nasc FROM mais_velho);