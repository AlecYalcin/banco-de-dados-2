# Tarefa - ODBC e ORM

## Scripts

(W.I.P)

## ORM

ORM (Object-Relational Mapping) é uma técnica que permite mapear tabelas de bancos de dados relacionais para objetos em linguagens de programação orientadas a objetos, como Python. Em vez de escrever comandos SQL diretamente, o desenvolvedor manipula classes e atributos que representam as tabelas e colunas do banco, tornando o código mais legível, reutilizável e integrado ao paradigma de orientação a objetos.

### SQLAlchemy como ORM em Python

O SQLAlchemy é uma das bibliotecas ORM mais robustas e populares do Python. Ele permite mapear classes para tabelas do banco de dados e realizar operações como inserções, consultas e atualizações de forma declarativa. Além do ORM, oferece uma camada de abstração para quem deseja maior controle com SQL programático.

## OBDC

ODBC é uma interface padrão de conexão com bancos de dados que permite que diferentes aplicações (como Excel, Power BI, programas em C/C++ ou Python) se comuniquem com vários tipos de banco de dados através de drivers específicos. Ele funciona como uma ponte universal entre um software e o banco de dados, independentemente do fabricante.

### SQLAlchemy com pyodbc

Como alternativa ao uso direto de ODBC em Python, é possível combinar **SQLAlchemy com o driver `pyodbc`**, permitindo que aplicações utilizem a abstração do ORM do SQLAlchemy com a conectividade ODBC. Essa abordagem une o melhor dos dois mundos: a flexibilidade de conexão com diferentes bancos via ODBC e a facilidade de manipular dados como objetos por meio do SQLAlchemy, ideal para projetos que exigem portabilidade entre bancos ou integração com sistemas legados.
