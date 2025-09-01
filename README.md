# Umbrella Trio Lottopar

Projeto desenvolvido com arquitetura **umbrella** no Phoenix Framework, seguindo os princípios SOLID e boas práticas de desenvolvimento.

## 🏗️ **Arquitetura**

O projeto utiliza a arquitetura **umbrella** do Phoenix, dividindo a aplicação em várias aplicações menores (`apps`), cada uma com um propósito específico:

- **`apps/core`**: Contém todos os schemas do Ecto e a lógica de negócio principal (contextos)
- **`apps/umbrella_trio_lottopar`**: Repositório centralizado e migrações do banco de dados
- **`apps/umbrella_trio_lottopar_web`**: Aplicação web principal com controllers, views e templates
- **`apps/auth`**: Responsável pela autenticação e controle de acesso dos usuários
- **`apps/api`**: Gerencia a API JSON para integrações externas
- **`apps/backoffice`**: O frontend administrativo, construído com Phoenix LiveView
- **`apps/audit`**: Lida com o rastreamento e armazenamento de logs de auditoria

## 📋 **Estrutura do Projeto**

```
umbrella/
├── apps/
│   ├── core/                           # 🧠 Schemas Ecto e Contextos Centralizados
│   │   ├── lib/core/admin/            # 👥 Admin schemas (Operator, User)
│   │   ├── lib/core/players/          # 🎮 Player schemas
│   │   ├── lib/core/retail/           # 🏪 Retail schemas (Retail, Device)
│   │   ├── lib/core/finance/          # 💰 Finance schemas (Deposit, Withdraw, Wallet)
│   │   └── lib/core/                  # 🔧 Contextos (Admin, Players, Retail, Finance)
│   ├── umbrella_trio_lottopar/        # 🗄️ Repositório e Migrações
│   │   └── priv/repo/migrations/      # 📊 Todas as migrações do banco
│   ├── umbrella_trio_lottopar_web/    # 🌐 Aplicação Web Principal
│   │   ├── lib/umbrella_trio_lottopar_web/controllers/  # 🎮 Controllers
│   │   ├── lib/umbrella_trio_lottopar_web/views/        # 👁️ Views
│   │   ├── lib/umbrella_trio_lottopar_web/templates/    # 🎨 Templates HTML
│   │   ├── assets/                    # 🎨 CSS/JS/Tailwind
│   │   └── priv/                      # ⚙️ Configurações web
│   ├── auth/                          # 🔐 Autenticação (a ser implementado)
│   ├── api/                           # 📡 API externa (a ser implementado)
│   ├── backoffice/                    # 🖥️ Interface administrativa (a ser implementado)
│   └── audit/                         # 📋 Auditoria (a ser implementado)
├── config/                            # ⚙️ Configurações do projeto
├── mix.exs                            # 📦 Configuração principal
└── .gitignore                         # 🚫 Arquivos ignorados
```

### 🎯 **Explicação da Nova Arquitetura:**

**1. Centralização de Schemas (`apps/core`):**
- Todos os schemas Ecto estão centralizados em `apps/core`
- Organizados por domínio: `admin`, `players`, `retail`, `finance`
- Facilita reutilização entre diferentes aplicações

**2. Separação de Responsabilidades:**
- **`core`**: Schemas e lógica de negócio
- **`umbrella_trio_lottopar`**: Acesso ao banco e migrações
- **`umbrella_trio_lottopar_web`**: Interface web e controllers

**3. Benefícios da Nova Estrutura:**
- ✅ **Reutilização**: Schemas podem ser usados por qualquer app
- ✅ **Manutenibilidade**: Mudanças em schemas afetam apenas o core
- ✅ **Escalabilidade**: Novos apps podem facilmente usar schemas existentes
- ✅ **Organização**: Separação clara entre dados e apresentação

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

### ✅ **TASK_009 - Entidade Withdraw**
- Entidade Withdraw criada no contexto Finance
- Controller, views e templates implementados
- Rotas configuradas em `/finance/withdraws`
- CRUD completo funcionando

### ✅ **TASK_049 - Docker Compose**
- Arquivo `docker-compose.yml` criado
- PostgreSQL e pgAdmin configurados
- Variáveis de ambiente documentadas
- Instruções de uso adicionadas ao README

### ✅ **TASK_051 - Formatação de Código**
- `mix format` executado em todo o projeto
- Código formatado seguindo padrões Elixir
- Credo: 0 issues de qualidade

### ✅ **TASK_052 - Refatoração da Estrutura**
- Schemas movidos para `apps/core`
- Estrutura reorganizada seguindo melhores práticas
- Separação clara entre schemas e apresentação
- Arquitetura umbrella otimizada

### ✅ **TASK_053 - Correção de Rotas**
- Todas as rotas não funcionais corrigidas
- Schemas configurados corretamente
- Projeto funcionando perfeitamente
- Rotas principais testadas e funcionando

### 🚧 **TASKs em Andamento:**
- **TASK_054**: Atualização do README com estrutura atual (em execução)

### 📋 **TASKs Pendentes:**
- **TASK_020**: Implementar Endpoints de API (apps/api)
- **TASK_021**: Implementar Rastreamento de Auditoria (apps/audit)
- **TASK_017**: Criar Backoffice Base e Layout (apps/backoffice)
- **TASK_018**: Implementar Gestão de Operadores (apps/backoffice)
- **TASK_019**: Implementar Gestão de Varejistas e Dispositivos (apps/backoffice)
- **TASK_016**: Implementar Autenticação e 2FA (apps/auth)

## 🌐 **Rotas Disponíveis Atualmente**

### ✅ **Rotas Funcionais (HTTP 200):**
- **`/`** - Página inicial
- **`/players`** - Lista de jogadores
- **`/admin/users`** - Lista de usuários administradores
- **`/retails`** - Lista de varejistas
- **`/finance/deposits`** - Lista de depósitos
- **`/finance/withdraws`** - Lista de saques
- **`/dev/dashboard/home`** - Dashboard de desenvolvimento

### 🔧 **Rotas de Desenvolvimento:**
- **`/dev/dashboard`** - LiveDashboard do Phoenix
- **`/dev/dashboard/home`** - Página inicial do dashboard

### 📊 **Status das Rotas:**
Todas as rotas principais estão funcionando corretamente após as correções da TASK_053.

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
- **Página Inicial**: http://localhost:4000
- **Jogadores**: http://localhost:4000/players
- **Usuários Admin**: http://localhost:4000/admin/users
- **Varejistas**: http://localhost:4000/retails
- **Depósitos**: http://localhost:4000/finance/deposits
- **Saques**: http://localhost:4000/finance/withdraws
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
