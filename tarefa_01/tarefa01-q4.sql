-- Faça uma consulta que selecione o nome, o salário e o departamento dos funcionários que não são gerentes, ordenando pelo Código do Departamento.

CREATE VIEW funcionarios_que_nao_sao_gerentes AS
    WITH funcionarios_que_sao_gerentes AS(
        SELECT f.nome, f.salario, d.codigo as cod_depart
        FROM funcionario f 
        LEFT JOIN departamento d ON d.codigo = f.cod_depto
        WHERE f.codigo IS NOT d.cod_gerente
    )
    SELECT nome, salario, cod_depart
    FROM funcionarios_que_sao_gerentes
    ORDER BY cod_depart ASC;