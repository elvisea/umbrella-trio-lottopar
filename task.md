## 🤖 **TASK_000 - Guia de Execução e Padrões de Código** 

### 📖 **Descrição**

Este documento serve como um guia completo para o Agente de IA. Ele define o **fluxo de trabalho** para a execução de tarefas e estabelece os **padrões de qualidade e estilo de código** a serem seguidos (essa task nao deve ser fechada).

### 🎯 **Objetivos**

  - Processar tarefas de forma autônoma e consistente.
  - Garantir que todo o código gerado siga as convenções e melhores práticas do Elixir e Phoenix.

### 📋 **Fluxo de Trabalho com Branches**

1.  **Listar e Priorizar Tarefas:**

      - Liste todas as issues abertas no GitHub com o comando `gh issue list --state open`.
      - Identifique a próxima tarefa a ser executada (geralmente a com o número mais alto).

2.  **Preparar a Branch de Trabalho:**

      - **Ação:** Crie uma nova branch para a tarefa, seguindo a convenção `feat/task-<numero_da_tarefa>`.
      - **Comandos:**
        ```bash
        git checkout main
        git pull origin main
        git checkout -b feat/task-<numero_da_tarefa>
        ```
      - **Lógica:** Esse passo garante que você está trabalhando com a versão mais atualizada do código e isola as mudanças da tarefa em uma branch separada.

3.  **Compreender e Executar a Tarefa:**

      - Visualize o conteúdo da tarefa com `gh issue view <numero_da_tarefa>`.
      - Execute os comandos fornecidos. Revise o código gerado para garantir que ele esteja alinhado com os padrões de qualidade.

4.  **Finalizar e Versionar:**

      - Após a execução bem-sucedida, adicione as alterações, crie um commit e envie para o repositório.
      - **Comandos:**
        ```bash
        git add .
        git commit -m "feat: implementação da entidade <nome_da_entidade> (TASK_<numero_da_tarefa>)"
        git push origin feat/task-<numero_da_tarefa>
        ```

5.  **Abrir um Pull Request e Mesclar:**

      - **Ação:** Abra um Pull Request (PR) no GitHub da branch de trabalho para `main`. O PR deve ser auto-mesclado, pois o Agente de IA é o responsável pelo projeto.
      - **Comando:**
        ```bash
        gh pr create --title "feat: implementação da entidade <nome_da_entidade> (TASK_<numero_da_tarefa>)" --body "Fecha #<numero_da_tarefa>"
        gh pr merge <numero_do_pr> --squash --delete-branch
        ```
      - **Lógica:** Este passo finaliza a tarefa, mescla o código na branch principal, fecha a issue e remove a branch de trabalho, mantendo o histórico de commits limpo e organizado.

-----

## 🧠 **Padrões de Qualidade e Estilo de Código**

Siga estas diretrizes para garantir a excelência do projeto.

### **1. Estrutura e Estilo**

  - Use **functional programming** e **immutability**.
  - Siga as **convenções do Phoenix** (contexts, schemas, controllers).
  - Prefira `|> pipe operator` para encadear funções.
  - Use nomes descritivos (`snake_case`) para funções e variáveis.

### **2. Nomenclatura**

  - **Módulos:** Use `PascalCase` (ex: `MyProject.Admin.User`).
  - **Arquivos, Funções, Variáveis:** Use `snake_case` (ex: `my_module.ex`, `my_function`, `my_variable`).

### **3. Uso de Ferramentas**

  - Use **Ecto changesets** para validação de dados.
  - Utilize **LiveView** para interfaces dinâmicas.
  - Use **Tailwind CSS** para estilização.
  - Proteja-se contra ataques comuns (SQL Injection, CSRF).

### **4. Performance**

  - Utilize **database indexing**.
  - Use **`Ecto.preload`** para evitar N+1 queries.

### **5. Práticas de Desenvolvimento**

  - Implemente `GenServers` para processos com estado.
  - Utilize `Tasks` para jobs concorrentes e isolados.
  - Use **`ExUnit`** para escrever testes.
  - Mantenha-se atualizado com os guias oficiais do Phoenix.

-----

### **Instruções de Estilo**

  - **Guia de Estilo do Elixir:** Siga o guia de estilo oficial em [https://github.com/christopheradams/elixir\_style\_guide](https://github.com/christopheradams/elixir_style_guide). Este guia é a sua principal referência para formatação de código.
  - Use o operador pipe `|>` para encadear chamadas de função, melhorando a legibilidade.
  - Prefira aspas simples (`'`) para `charlists` e aspas duplas (`"`) para strings.

-----

### **TASK\_001 - Criar Estrutura de Aplicação Umbrella**

**Descrição**
O objetivo desta tarefa é configurar a arquitetura de projeto **"umbrella"** no Phoenix. Em vez de um único projeto monolítico, a aplicação será dividida em várias aplicações menores (`apps`), cada uma com um propósito específico.

A arquitetura final será composta pelos seguintes `apps`:

  * **`apps/core`**: Contém todos os schemas do Ecto e a lógica de negócio principal (contextos).
  * **`apps/auth`**: Responsável pela autenticação e controle de acesso dos usuários.
  * **`apps/api`**: Gerencia a API JSON para integrações externas.
  * **`apps/backoffice`**: O frontend administrativo, construído com Phoenix LiveView.
  * **`apps/audit`**: Lida com o rastreamento e armazenamento de logs de auditoria.

**Objetivos**

  * Configurar a estrutura de pastas da aplicação `umbrella`.
  * Criar os cinco `apps` conforme a especificação.
  * Estabelecer a comunicação entre os `apps` para futuras implementações.

**Passos da Tarefa**

1.  **Crie a aplicação `umbrella`**: No diretório raiz do projeto, execute o comando para criar um projeto Phoenix `umbrella`. Substitua `<project_name>` pelo nome do seu projeto.
    ```bash
    mix phx.new <project_name> --umbrella
    ```
2.  **Crie as aplicações internas**: Navegue até o diretório `apps/` do seu projeto e crie as aplicações internas uma a uma.
      - Crie a aplicação `core`:
        ```bash
        cd <project_name>/apps
        mix new core
        ```
      - Crie a aplicação `auth`:
        ```bash
        mix phx.new auth --no-html --no-json --no-live --no-ecto
        ```
      - Crie a aplicação `api`:
        ```bash
        mix phx.new api --no-html --no-live --no-ecto
        ```
      - Crie a aplicação `backoffice`:
        ```bash
        mix phx.new backoffice --no-json --no-ecto
        ```
      - Crie a aplicação `audit`:
        ```bash
        mix new audit
        ```
3.  **Configure as dependências e a comunicação**:
      - Adicione as novas aplicações como dependências no arquivo `mix.exs` da aplicação principal.
      - Garanta que as dependências do projeto estejam configuradas corretamente no `mix.exs` de cada aplicação interna.

**Resultado Esperado**

  * A estrutura de diretórios do projeto `umbrella` criada e organizada.
  * Os cinco `apps` (core, auth, api, backoffice, audit) criados e prontos para receber as próximas implementações.
  * O projeto compila sem erros.

-----

### **TASK\_002 - Criar Entidade Operator**

**Descrição**
Criação do modelo de entidade **Operator** no contexto **Admin** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Operator`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Operator**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Admin Operator operators name:string company_name:string tax_id:string status:string country:string timezone:string
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `Operator` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `Operator` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_003 - Criar Entidade Player**

**Descrição**
Criação do modelo de entidade **Player** no contexto **Players** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Player`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Player**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Players Player players op_id:string username:string password:string status:string first_name:string last_name:string document:string birth_date:date phone:string email:string gender:string address:string city:string state:string country:string zip_code:string registration_date:date last_login:datetime
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `Player` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `Player` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_004 - Criar Entidade Retail**

**Descrição**
Criação do modelo de entidade **Retail** no contexto **Retail** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Retail`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Retail**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Retail Retail retails op_id:string name:string tax_id:string status:string address:string city:string state:string country:string zip_code:string phone:string email:string manager_name:string
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `Retail` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `Retail` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_005 - Criar Entidade Wallet**

**Descrição**
Criação do modelo de entidade **Wallet** no contexto **Finance** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Wallet`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Wallet**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Finance Wallet wallets player_id:string retail_id:string wallet_type:string currency_code:string total_cash:decimal total_bonus:decimal
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `Wallet` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `Wallet` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_006 - Criar Entidade Device**

**Descrição**
Criação do modelo de entidade **Device** no contexto **Retail** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Device`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Device**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Retail Device devices retail_id:string device_type:string status:string activation_date:date last_activity:datetime serial_number:string model:string firmware_version:string ip_address:string mac_address:string location:string coordinates:map
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `Device` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `Device` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_007 - Criar Entidade User**

**Descrição**
Criação do modelo de entidade **User** no contexto **Admin** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `User`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade User**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Admin User users op_id:string user_type:string status:string username:string password:string otp:string
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `User` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `User` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_008 - Criar Entidade Deposit**

**Descrição**
Criação do modelo de entidade **Deposit** no contexto **Finance** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Deposit`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Deposit**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Finance Deposit deposits player_id:string op_id:string txn_amount:decimal tax_amount:decimal wallet_affected_amount:decimal txn_status:string txn_date:datetime txn_mode:string process_charges:string codigo_lottopar:string ref_txn_id:string payment_type:string sub_payment_type:string service_charges:string tp_txn_id:string retail_data:map
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `Deposit` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `Deposit` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_009 - Criar Entidade Withdraw**

**Descrição**
Criação do modelo de entidade **Withdraw** no contexto **Finance** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Withdraw`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Withdraw**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Finance Withdraw withdraws player_id:string op_id:string txn_amount:decimal tax_amount:decimal wallet_affected_amount:decimal txn_status:string txn_date:datetime txn_mode:string process_charges:string codigo_lottopar:string ref_txn_id:string service_charges:string tp_txn_id:string account:string confirmation_date:datetime currency_code:string retail_data:map
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `Withdraw` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `Withdraw` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_010 - Criar Entidade Wager**

**Descrição**
Criação do modelo de entidade **Wager** no contexto **Finance** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Wager`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Wager**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Finance Wager wagers player_id:string op_id:string op_id:string txn_amount:decimal bonus_amount:decimal cash_amount:decimal tax_amount:decimal txn_status:string txn_date:datetime txn_mode:string process_charges:string codigo_lottopar:string ref_txn_id:string service_charges:string tp_txn_id:string sale_transaction_id:string ticket_number:string game_id:string game_type:string game_name:string game_data:map event:map retail_data:map
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `Wager` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `Wager` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_011 - Criar Entidade Winning**

**Descrição**
Criação do modelo de entidade **Winning** no contexto **Finance** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Winning`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Winning**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Finance Winning winnings player_id:string op_id:string txn_amount:decimal bonus_amount:decimal cash_amount:decimal win_amount:decimal tax_amount:decimal txn_status:string txn_date:datetime txn_mode:string process_charges:string codigo_lottopar:string ref_txn_id:string service_charges:string tp_txn_id:string sale_transaction_id:string ticket_number:string game_id:string game_type:string game_name:string game_data:map event:map winning_type:string winning_category:string retail_data:map
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `Winning` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `Winning` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_012 - Criar Entidade Cashout**

**Descrição**
Criação do modelo de entidade **Cashout** no contexto **Finance** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Cashout`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Cashout**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Finance Cashout cashouts player_id:string op_id:string txn_amount:decimal cashout_type:string txn_status:string txn_date:datetime txn_mode:string process_charges:string codigo_lottopar:string ref_txn_id:string service_charges:string tp_txn_id:string sale_transaction_id:string ticket_number:string game_id:string game_type:string game_name:string game_data:map event:map retail_data:map
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `Cashout` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `Cashout` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_013 - Criar Entidade Session**

**Descrição**
Criação do modelo de entidade **Session** no contexto **Players** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Session`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Session**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Players Session sessions player_id:string session_id:string ip_address:string device:string user_agent:string event_type:string event_date:datetime
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `Session` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `Session` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_014 - Criar Entidade License**

**Descrição**
Criação do modelo de entidade **License** no contexto **Admin**, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `License`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade License**: Execute o comando com os campos definidos na tabela:
    ```bash
    mix phx.gen.html Admin License licenses op_id:string contract_number:string contract_file:string license_type:string business_type:string start_date:date end_date:date status:string
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `License` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `License` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_015 - Criar Entidade Exclusion**

**Descrição**
Criação do modelo de entidade **Exclusion** no contexto **Players** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Exclusion`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Exclusion**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Players Exclusion exclusions txn_id:string cpf:string from_date:datetime to_date:datetime exclusion_type:string device:string excluded_by:string updated_by:string
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `Exclusion` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `Exclusion` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK_016 - Implementar Autenticação e 2FA (apps/auth)**

**Descrição**
Esta tarefa foca na implementação do núcleo de autenticação e segurança. No `apps/auth`, configure o fluxo de login com senha e o sistema de 2FA.

**Objetivos**
* Implementar o login de usuário com validação de nome de usuário e senha.
* Configurar a integração com um sistema de OTP (One-Time Password) para 2FA.
* Garantir o armazenamento seguro de senhas e OTPs.

**Passos da Tarefa**
1.  **Configurar o sistema de autenticação**: Use uma biblioteca como Guardian ou Pow para gerenciar a autenticação e as sessões.
2.  **Implementar 2FA**: Crie o fluxo para que o usuário configure o 2FA via QR Code no primeiro login.
3.  **Adicionar validações**: Implemente a lógica de expiração do OTP e o bloqueio após tentativas falhas.

**Resultado Esperado**
* Um sistema de login funcional e seguro.
* 2FA por OTP implementado e pronto para ser usado pelas telas do backoffice.

-----

### **TASK_017 - Criar Backoffice Base e Layout (apps/backoffice)**

**Descrição**
Crie a estrutura básica do frontend administrativo com Phoenix LiveView. Esta tarefa estabelecerá o layout principal, navegação e a proteção de rotas.

**Objetivos**
* Configurar a aplicação `backoffice` com um layout padrão.
* Implementar a navegação principal (menu lateral ou superior).
* Proteger todas as telas com autenticação, garantindo que apenas usuários logados possam acessá-las.

**Passos da Tarefa**
1.  **Configurar LiveView**: Adicione a dependência LiveView no `mix.exs` e configure o `endpoint`.
2.  **Criar o layout**: Crie o arquivo de layout principal, incluindo os elementos de UI com Tailwind CSS.
3.  **Implementar o `router.ex`**: Use `scopes` e `pipelines` para proteger as rotas, exigindo autenticação antes do acesso às páginas.

**Resultado Esperado**
* Uma interface administrativa básica, com navegação e um layout consistente.
* Todas as telas do backoffice protegidas, redirecionando usuários não autenticados para a página de login.

-----

### **TASK_018 - Implementar Gestão de Operadores (apps/backoffice)**

**Descrição**
Crie a interface de usuário completa para o gerenciamento de operadores no backoffice. Esta tarefa inclui a criação, listagem, edição e ações lógicas.

**Objetivos**
* Desenvolver a tela de listagem de operadores com paginação, filtragem e ordenação.
* Criar o formulário de criação/edição de operadores, incluindo o sub-formulário para licenças.
* Implementar as ações de desativar e reativar operadores.

**Passos da Tarefa**
1.  **Criar a LiveView**: Crie a LiveView responsável pela listagem e formulários de operadores.
2.  **Desenvolver o formulário**: Crie um formulário dinâmico que, ao ser enviado, chama as funções de contexto no `apps/core`.
3.  **Implementar as ações**: Adicione botões na tabela de listagem para desativar/reativar, com modais de confirmação.

**Resultado Esperado**
* Uma interface completa para gerenciar operadores, com um fluxo de trabalho intuitivo para o usuário.

-----

### **TASK_019 - Implementar Gestão de Varejistas e Dispositivos (apps/backoffice)**

**Descrição**
Desenvolver as telas de gerenciamento de varejistas e dispositivos no backoffice. Inclui a criação, listagem, edição e ações lógicas de bloqueio.

**Objetivos**
* Criar a tela de listagem de varejistas com filtros e paginação.
* Implementar o formulário de criação de varejistas, que deve criar automaticamente uma carteira para o varejista.
* Desenvolver a tela de gerenciamento de dispositivos.
* Implementar a funcionalidade de bloquear e desbloquear varejistas.

**Passos da Tarefa**
1.  **LiveViews**: Crie LiveViews separadas para varejistas e dispositivos, mantendo a responsabilidade de cada tela.
2.  **Formulário de criação**: No formulário de varejista, adicione a lógica de negócio para criar a carteira automaticamente no contexto `Finance` do `apps/core`.
3.  **Ações**: Adicione os botões para bloquear e desbloquear varejistas, com modais de confirmação.

**Resultado Esperado**
* Um fluxo de trabalho completo para o gerenciamento de varejistas e seus dispositivos no backoffice.

-----

### **TASK_020 - Implementar Endpoints de API (apps/api)**

**Descrição**
Implemente todos os endpoints da API para as entidades principais. Esta tarefa é focada no `apps/api` e no roteamento, autenticação e validação das requisições.

**Objetivos**
* Criar rotas para todas as entidades (CRUD e operações específicas).
* Garantir que todas as requisições sejam autenticadas com JWT.
* Proteger os endpoints com autorização baseada em papéis.

**Passos da Tarefa**
1.  **Configurar Autenticação**: Use a biblioteca de JWT do Elixir (como Guardian) para validar os tokens em cada requisição.
2.  **Criar Controladores e Endpoints**: Para cada entidade (Operador, Varejista, Jogador, Transações, Exclusões), crie um controlador e os endpoints correspondentes.
3.  **Documentar a API**: Configure o `OpenApiSpex` para gerar automaticamente a documentação da API.

**Resultado Esperado**
* Uma API funcional e segura, com endpoints para todas as entidades principais, pronta para ser consumida por clientes externos.

-----

A sua pergunta é muito pertinente e a resposta é: **a tarefa continua sendo essencial**.

O objetivo da **TASK\_021** não é usar o ClickHouse, mas sim **implementar a funcionalidade de auditoria**. A troca do ClickHouse por PostgreSQL é uma simplificação inteligente do setup, mas a necessidade de rastrear as ações dos usuários e armazenar os logs para relatórios continua sendo um requisito fundamental do projeto.

O sistema de auditoria é crucial para a segurança e conformidade, e a sua implementação é um passo que não pode ser ignorado.

Abaixo está a versão revisada da tarefa, atualizada para usar o PostgreSQL, refletindo a sua decisão.

---

### **TASK\_021 - Implementar Rastreamento de Auditoria (apps/audit)**

**Descrição**
Crie o núcleo do sistema de auditoria, responsável por rastrear todas as ações do usuário e armazenar os logs no PostgreSQL. Esta tarefa se concentra em desenvolver a lógica de registro de eventos para o sistema.

**Objetivos**
* Configurar a aplicação `apps/audit` para usar a mesma conexão com o banco de dados PostgreSQL do `apps/core`.
* Desenvolver um sistema de logging que capture eventos de autenticação, transações e gerenciamento de usuários.
* Prover funções que permitam que outros `apps` enviem logs para o `audit`.

**Passos da Tarefa**
1.  **Configurar a conexão**: No `apps/audit`, configure o `repo` para usar a mesma base de dados do `apps/core`. Isso evita a necessidade de um segundo banco de dados e simplifica a manutenção.
2.  **Criar o módulo de logging**: Crie um módulo para receber os dados de auditoria e inseri-los no banco de dados.
3.  **Integrar com eventos**: Use um sistema de eventos do Elixir para que as ações (ex: login, criação de usuário) disparem automaticamente um log para o `apps/audit`.

**Resultado Esperado**
* Um sistema de auditoria funcional, registrando eventos em tempo real no PostgreSQL.
* O `apps/audit` estará pronto para ser consultado para relatórios.