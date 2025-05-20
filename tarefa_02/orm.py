from models import *
from datetime import date, timedelta
from sqlalchemy import create_engine
from sqlalchemy.orm import Session
from collections import defaultdict

engine = create_engine("postgresql://postgres:admin123@localhost:5051/atividade_db")

def testar_conexao():
    """ Função para testar conexão da ORM com obanco de dados. """

    print("Testando conexão com o banco de dados...\n")
    try:
        with engine.connect() as connection:
            print("Conexão estabelecida com sucesso.")
    except Exception as e:
        print(f"Aconteceu um erro durante a conexão com o banco de dados: {e}")
testar_conexao()


def inserir_atividade_em_projeto(atividade: Atividade, projeto: int) -> Atividade:
    """
    Insere uma atividade em algum projeto no banco de dados.
    
    Args:
        atividade (Atividade): atividade a ser adicionada.
        projeto (int): código do projeto.
    Returns:
        Atividade: atividade com o projeto atualizado.
    """ 

    # Assimilando valores
    atividade.projeto = projeto

    with Session(engine) as session:
        session.add(atividade)
        session.commit()
        session.refresh(atividade)

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

    projeto.responsavel = novo_lider

    with Session(engine) as session:
        session.add(projeto)
        session.commit()
        session.refresh(projeto)

    return projeto

def listar_projetos_e_atividades() -> dict[Projeto, list[Atividade]]:
    """
    Lista todos os projetos e suas respectivas atividades.

    Returns:
        dict: Um dicionário onde as chaves são objetos do tipo Projeto e os valores são listas de objetos do tipo Atividade.
    """

    @dataclass
    class AtividadesDoProjeto:
        projeto: Projeto
        atividades: list[Atividade]

    with Session(engine) as session:
        resultado = session.query(Projeto, Atividade).outerjoin(Atividade, Atividade.projeto == Projeto.codigo).all()
    
    # Tranformando em dicionário
    projetos_atividades = defaultdict(list)
    for projeto, atividade in resultado:
        if atividade is not None:
            projetos_atividades[projeto].append(atividade)
        else:
            projetos_atividades[projeto] = projetos_atividades[projeto]


    return projetos_atividades

# Executando o arquivo
if __name__ == "__main__":
    from pprint import pprint

    # c. Listar todos os projetos e suas atividades;
    print("\n==== Listando todos os Projetos e Atividades ====\n")

    projetos_e_atividades = listar_projetos_e_atividades()
    pprint(projetos_e_atividades, indent=4, sort_dicts=False)

    input("\nAperte Enter para testar o próximo comando.")

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

    input("\nAperte Enter para testar o próximo comando.")

    # b. Atualizar o líder de algum projeto;
    print("\n==== Atualizando o líder de algum projeto ====\n")
    projeto_2 = list(projetos_e_atividades.keys())[3]
    pprint(projeto_1, indent=4, sort_dicts=False)
    projeto_atualizado = atualizar_lider_de_projeto(projeto_1, projeto_2.responsavel)
    pprint(projeto_atualizado, indent=4, sort_dicts=False)