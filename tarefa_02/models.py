from sqlalchemy import MetaData, Table, Column, Integer, String, Date, ForeignKey
from sqlalchemy.orm import registry
from dataclasses import dataclass
from datetime import date

@dataclass(unsafe_hash=True)
class Atividade:
    """ Classe que representa a atividade no banco de dados. """
    descricao: str
    data_inicio: date
    data_fim: date 
    codigo: int | None = None
    projeto: int | None = None

@dataclass(unsafe_hash=True)
class Projeto:
    """ Classe que representa o projeto no banco de dados. """
    descricao: str
    depto: int
    data_inicio: date
    data_fim: date
    responsavel: int | None
    codigo: int | None = None

"""
Observação: a maneira como foi escolhida para interagir com a ORM foi a conhecida como 'Mapeamento Imperativo'. 
Normalmente você não precisa desse modelo, se seu projeto iniciar com SQLAlchemy e termianr com ele, tudo está certo.

Contudo, em projetos onde se altera ORMs ou Bancos de Dados, essa aproximação pode ser falha. Então, preferi fazer de modo mapeado:
- Classes no Python > Modeos do ORM
"""

# Configurações de Mapeamento
metadata = MetaData()
mapper_registry = registry(metadata=metadata)

projeto_table = Table(
    "projeto",
    metadata,
    Column("codigo", Integer, primary_key=True, autoincrement=True),
    Column("descricao", String, nullable=False),
    Column("responsavel", Integer),
    Column("depto", Integer, nullable=False),
    Column("data_inicio", Date, nullable=False),
    Column("data_fim", Date, nullable=False),
)

atividade_table= Table(
    "atividade",
    metadata,
    Column("codigo", Integer, primary_key=True, autoincrement=True),
    Column("descricao", String, nullable=False),
    Column("projeto", Integer, ForeignKey("projeto.codigo")),
    Column("data_inicio", Date, nullable=False),
    Column("data_fim", Date, nullable=False),
)

mapper_registry.map_imperatively(Projeto, projeto_table)
mapper_registry.map_imperatively(Atividade, atividade_table)