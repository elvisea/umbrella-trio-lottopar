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
Criação do modelo de entidade **Wager** no contexto **Games** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Wager`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Wager**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Games Wager wagers player_id:string op_id:string txn_amount:decimal bonus_amount:decimal cash_amount:decimal tax_amount:decimal txn_status:string txn_date:datetime txn_mode:string process_charges:string codigo_lottopar:string ref_txn_id:string service_charges:string tp_txn_id:string sale_transaction_id:string ticket_number:string game_id:string game_type:string game_name:string game_data:map event:map retail_data:map
    ```
2.  **Configurar as rotas**: Adicione o `resource` para a entidade `Wager` no arquivo de rotas.

**Resultado Esperado**

  * A entidade `Wager` criada com os campos definidos e acessível via rotas no projeto Phoenix.
  * O projeto compila sem erros.

-----

### **TASK\_011 - Criar Entidade Winning**

**Descrição**
Criação do modelo de entidade **Winning** no contexto **Games** do `apps/core`, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `Winning`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade Winning**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Games Winning winnings player_id:string op_id:string txn_amount:decimal bonus_amount:decimal cash_amount:decimal win_amount:decimal tax_amount:decimal txn_status:string txn_date:datetime txn_mode:string process_charges:string codigo_lottopar:string ref_txn_id:string service_charges:string tp_txn_id:string sale_transaction_id:string ticket_number:string game_id:string game_type:string game_name:string game_data:map event:map winning_type:string winning_category:string retail_data:map
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
Criação do modelo de entidade **License** no contexto **Core**, usando o comando `mix phx.gen.html`, incluindo os campos definidos na especificação.

**Objetivos**

  * Gerar o contexto, schema, controller e views para a entidade `License`.
  * Adicionar as rotas geradas no arquivo `router.ex`.

**Passos da Tarefa**

1.  **Gerar a entidade License**: Execute o comando com os campos da tabela:
    ```bash
    mix phx.gen.html Core License licenses op_id:string contract_number:string contract_file:string license_type:string business_type:string start_date:date end_date:date status:string
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