# Umbrella Trio Lottopar

Projeto desenvolvido com arquitetura controller → service → repository, seguindo os princípios SOLID e boas práticas de desenvolvimento.

## Arquitetura

- **Controllers**: Responsáveis por receber requisições HTTP e validar dados de entrada
- **Services**: Executam regras de negócio e orquestram operações
- **Repositories**: Acessam o banco de dados e implementam operações CRUD

## Estrutura do Projeto

```
umbrella/
├── controllers/     # Controladores HTTP
├── services/        # Serviços de negócio
├── repositories/    # Repositórios de dados
├── dtos/           # Data Transfer Objects
├── entities/       # Entidades do banco de dados
└── interfaces/     # Interfaces dos repositórios
```

## Tecnologias

- Elixir
- Phoenix Framework
- PostgreSQL
- Git

## Como Executar

1. Clone o repositório
2. Instale as dependências
3. Configure o banco de dados
4. Execute o projeto

## Contribuição

Siga os padrões de código estabelecidos e mantenha a arquitetura controller → service → repository.
