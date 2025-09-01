# Umbrella Trio Lottopar

Projeto desenvolvido com arquitetura **umbrella** no Phoenix Framework, seguindo os princípios SOLID e boas práticas de desenvolvimento.

## 🏗️ **Arquitetura**

O projeto utiliza a arquitetura **umbrella** do Phoenix, dividindo a aplicação em várias aplicações menores (`apps`), cada uma com um propósito específico:

- **`apps/core`**: Contém todos os schemas do Ecto e a lógica de negócio principal (contextos)
- **`apps/auth`**: Responsável pela autenticação e controle de acesso dos usuários
- **`apps/api`**: Gerencia a API JSON para integrações externas
- **`apps/backoffice`**: O frontend administrativo, construído com Phoenix LiveView
- **`apps/audit`**: Lida com o rastreamento e armazenamento de logs de auditoria

## 📋 **Estrutura do Projeto**

```
umbrella/
├── apps/
│   ├── core/           # Schemas e lógica de negócio
│   ├── auth/           # Autenticação
│   ├── api/            # API externa
│   ├── backoffice/     # Interface administrativa
│   └── audit/          # Auditoria e logs
├── config/             # Configurações
├── mix.exs             # Configuração principal
└── .gitignore          # Arquivos ignorados
```

## 🎯 **Funcionalidades Implementadas**

### ✅ **TASK_001 - Estrutura de Aplicação Umbrella**
- Projeto Phoenix configurado como aplicação umbrella
- 5 aplicações criadas com propósitos específicos
- Configurações organizadas e funcionais
- Projeto compila sem erros

### ✅ **TASK_002 - Entidade Operator**
- Entidade Operator criada no contexto Admin
- Controller, views e templates implementados
- Rotas configuradas em `/admin/operators`
- CRUD completo funcionando

## 🚀 **Como Executar**

### **Pré-requisitos**
- Elixir 1.15+
- Phoenix 1.8+
- PostgreSQL (ou Docker)
- Node.js (para assets)

### **🐳 Opção 1: Com Docker (Recomendado)**

```bash
# Clone o repositório
git clone https://github.com/elvisea/umbrella-trio-lottopar.git
cd umbrella-trio-lottopar

# Copie o arquivo de exemplo de variáveis de ambiente
cp .env.example .env

# Inicie o PostgreSQL com Docker Compose
docker-compose up -d

# Instale as dependências
mix deps.get

# Execute as migrações
mix ecto.migrate

# Inicie o servidor Phoenix
mix phx.server
```

### **📦 Opção 2: Instalação Manual**

```bash
# Clone o repositório
git clone https://github.com/elvisea/umbrella-trio-lottopar.git
cd umbrella-trio-lottopar

# Instale as dependências
mix deps.get

# Configure o banco de dados
mix ecto.setup

# Inicie o servidor
mix phx.server
```

### **Acessos**
- **Backoffice**: http://localhost:4000
- **Admin Operators**: http://localhost:4000/admin/operators
- **LiveDashboard**: http://localhost:4000/dev/dashboard
- **pgAdmin**: http://localhost:5050 (quando usando Docker)

## 🐳 **Docker Compose**

### **Serviços Disponíveis**
- **PostgreSQL**: Banco de dados principal na porta 5432
- **pgAdmin**: Interface web para administração do PostgreSQL na porta 5050

### **Comandos Úteis**
```bash
# Iniciar todos os serviços
docker-compose up -d

# Ver logs dos serviços
docker-compose logs -f

# Parar todos os serviços
docker-compose down

# Parar e remover volumes (CUIDADO: apaga dados)
docker-compose down -v

# Reiniciar um serviço específico
docker-compose restart postgres
```

### **Configuração de Variáveis de Ambiente**
Edite o arquivo `.env` para personalizar as configurações:
```bash
# PostgreSQL
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=umbrella_trio_lottopar_dev
POSTGRES_PORT=5432

# pgAdmin
PGADMIN_EMAIL=admin@lottopar.com
PGADMIN_PASSWORD=admin
PGADMIN_PORT=5050
```

## 🧠 **Padrões de Qualidade e Estilo de Código**

### **1. Estrutura e Estilo**
- Use **functional programming** e **immutability**
- Siga as **convenções do Phoenix** (contexts, schemas, controllers)
- Prefira `|> pipe operator` para encadear funções
- Use nomes descritivos (`snake_case`) para funções e variáveis

### **2. Nomenclatura**
- **Módulos:** Use `PascalCase` (ex: `MyProject.Admin.User`)
- **Arquivos, Funções, Variáveis:** Use `snake_case` (ex: `my_module.ex`, `my_function`, `my_variable`)

### **3. Uso de Ferramentas**
- Use **Ecto changesets** para validação de dados
- Utilize **LiveView** para interfaces dinâmicas
- Use **Tailwind CSS** para estilização
- Proteja-se contra ataques comuns (SQL Injection, CSRF)

### **4. Performance**
- Utilize **database indexing**
- Use **`Ecto.preload`** para evitar N+1 queries

### **5. Práticas de Desenvolvimento**
- Implemente `GenServers` para processos com estado
- Utilize `Tasks` para jobs concorrentes e isolados
- Use **`ExUnit`** para escrever testes
- Mantenha-se atualizado com os guias oficiais do Phoenix

## 📚 **Diretrizes do Phoenix v1.8**

### **Layouts e Componentes**
- **Sempre** comece seus templates LiveView com `<Layouts.app flash={@flash} ...>`
- Use o componente `<.icon>` para ícones Heroicons
- Use o componente `<.input>` para campos de formulário
- **Nunca** use `<.flash_group>` fora do módulo `Layouts`

### **JavaScript e CSS**
- Use **Tailwind CSS** para criar interfaces polidas e responsivas
- **Sempre** mantenha a sintaxe de importação do Tailwind v4
- **Nunca** use `@apply` ao escrever CSS bruto
- **Sempre** crie seus próprios componentes baseados em Tailwind

### **UI/UX e Design**
- Produza designs de **classe mundial** com foco em usabilidade e estética
- Implemente **micro-interações sutis** (efeitos hover, transições suaves)
- Garanta **tipografia limpa, espaçamento e layout balanceado**
- Foque em **detalhes deliciosos** como estados de carregamento

## 🔧 **Diretrizes do Elixir**

### **Listas e Acesso por Índice**
- **Nunca** use acesso baseado em índice via sintaxe de acesso
- **Sempre** use `Enum.at`, pattern matching ou `List` para acesso baseado em índice

### **Imutabilidade e Rebinding**
- Variáveis Elixir são imutáveis, mas podem ser reatribuídas
- Para expressões de bloco como `if`, `case`, `cond`, etc., você **deve** vincular o resultado a uma variável

### **Structs e Changesets**
- **Nunca** use sintaxe de acesso de mapa (`changeset[:field]`) em structs
- **Sempre** acesse os campos diretamente: `my_struct.field`
- Use `Ecto.Changeset.get_field/2` para changesets

## 🧪 **Testes**

### **Diretrizes de Testes**
- Use `ExUnit` para escrever testes
- Execute testes específicos: `mix test test/my_test.exs`
- Execute testes que falharam: `mix test --failed`
- Para debug, execute testes em arquivos específicos

### **Testes LiveView**
- Use `Phoenix.LiveViewTest` para fazer asserções
- **Sempre** referencie os IDs dos elementos chave nos testes
- **Nunca** teste HTML bruto, use `element/2`, `has_element/2`
- Foque em testar resultados em vez de detalhes de implementação

## 📖 **Recursos e Documentação**

- [Guia de Estilo do Elixir](https://github.com/christopheradams/elixir_style_guide)
- [Documentação do Phoenix](https://hexdocs.pm/phoenix/)
- [Tailwind CSS](https://tailwindcss.com)
- [Heroicons](https://heroicons.com)

## 🤝 **Contribuição**

Este projeto segue um fluxo de trabalho específico definido na TASK_000. Para contribuir:

1. Siga as diretrizes de estilo definidas neste documento
2. Use o fluxo de trabalho com branches conforme TASK_000
3. Mantenha a qualidade do código seguindo os padrões estabelecidos
4. Escreva testes para novas funcionalidades

## 📄 **Licença**

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---

**Desenvolvido com ❤️ usando Elixir e Phoenix Framework**
