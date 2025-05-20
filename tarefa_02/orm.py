from dataclasses import dataclass
from datetime import date, timedelta

@dataclass
class Atividade:
    """ Classe que representa a atividade no banco de dados. """
    codigo: int | None
    descricao: str
    projeto: int | None
    data_inicio: date
    data_fim: date 

@dataclass
class Projeto:
    """ Classe que representa o projeto no banco de dados. """
    codigo: int | None
    descricao: str
    responsavel: int | None
    depto: int
    data_inicio: date
    data_fim: date

def inserir_atividade_em_projeto(atividade: Atividade, projeto: int) -> Atividade:
    """
    Insere uma atividade em algum projeto no banco de dados.
    
    Args:
        atividade (Atividade): atividade a ser adicionada.
        projeto (int): código do projeto.
    Returns:
        Atividade: atividade com o projeto atualizado.
    """ 

    return atividade

def atualizar_lider_de_projeto(projeto: Projeto, novo_lider: int) -> Projeto:
    """
    Altera o líder de um projeto.

    Args:
        projeto (Projeto): projeto a ser atualizado.
        novo_lider (int): Código do novo líder.
    Returns:
        Projeto: projeto com o líder atualizado.
    """

    return projeto

def listar_projetos_e_atividades() -> dict[Projeto, list[Atividade]]:
    """
    Lista todos os projetos e suas respectivas atividades.

    Returns:
        dict: Um dicionário onde as chaves são objetos do tipo Projeto e os valores são listas de objetos do tipo Atividade.
    """

    return {}

# Executando o arquivo
if __name__ == "__main__":
    from pprint import pprint

    # c. Listar todos os projetos e suas atividades;
    print("\n==== Listando todos os Projetos e Atividades ====\n")

    projetos_e_atividades = listar_projetos_e_atividades()
    pprint(projetos_e_atividades, indent=4, sort_dicts=False)

    # a. Inserir uma atividade em algum projeto;
    print("\n==== Inserindo uma atividade em algum projeto ====\n")
    projeto_1 = list(projetos_e_atividades.keys())[0]

    nova_atividade = Atividade(
        descricao="Atividade de Banco de Dados II",
        data_inicio=date.today(),
        data_fim=date.today() + timedelta(days=7),
    )

    atividade_atualizada = inserir_atividade_em_projeto(nova_atividade, projeto_1.codigo)
    pprint(atividade_atualizada, indent=4, sort_dicts=False)

    # b. Atualizar o líder de algum projeto;
    print("\n==== Atualizando o líder de algum projeto ====\n")
    projeto_2 = list(projetos_e_atividades.keys())[1]
    projeto_atualizado = atualizar_lider_de_projeto(projeto_1, projeto_2.responsavel)
    pprint(projeto_atualizado, indent=4, sort_dicts=False)