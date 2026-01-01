# GestorStock - Controle de Estoque

> Aplicação exemplo para aprendizado e portfólio: **Controle de Estoque** desenvolvida em **Java 8**, **Spring MVC**, empacotada como WAR e implantada em **WildFly**.

---

## Sumário

* Visão geral
* Tecnologias
* Funcionalidades
* Arquitetura e organização do projeto
* Banco de dados (modelo + scripts)
* Contrato da API (endpoints, request/response, exemplos)
* Autenticação e autorização
* Validações e tratamento de erros
* Configuração e deploy no WildFly
* Como rodar localmente (build, testes)
* Observabilidade (logs, métricas)
* Boas práticas e checklist de implementação
* Próximos passos / melhorias

---

## Visão geral

Aplicação mínima viável de Controle de Estoque para gerenciar produtos, categorias, fornecedores, movimentos de estoque (entrada/saída/ajuste) e relatórios básicos. Projeto pensado para mostrar como estruturar um back-end MVC clássico com JSP/Servlets, Spring MVC e integração com banco relacional.

---

## Tecnologias

* Java 8
* Spring Framework (Spring MVC, Spring Data, Spring Security)
* JSP
* WildFly
* Maven
* Banco de dados: PostgreSQL
* Jackson (JSON)
* Swagger (OpenAPI) para documentação interativa
* JUnit + Mockito (testes)
* Logback/SLF4J (logs)

---

## Funcionalidades principais

* CRUD de Produtos
* CRUD de Categorias
* CRUD de Fornecedores
* Registro de Movimentos de Estoque (entrada, saída, ajuste)
* Relatórios: saldo atual, histórico de movimentos, produtos abaixo do estoque mínimo
* Autenticação de usuários (ROLE\_USER, ROLE\_ADMIN)
* Paginação, ordenação e filtros nas listagens

---

## Organização do projeto (sugestão)

```
controle-estoque/
├─ src/main/java/
│  ├─ br.com.suaempresa.controleestoque
│  │  ├─ controller/         # Controllers Spring MVC (REST controllers)
│  │  ├─ service/            # Regras de negócio
│  │  ├─ repository/         # DAOs ou Repositories (JDBC/JPA)
│  │  ├─ controller.dto/                # DTOs para request/response
│  │  ├─ model/              # Entidades (POJOs)
│  │  ├─ exception/          # Exceções customizadas e handlers
│  │  └─ config/             # Configurações Spring, Security, Swagger
├─ src/main/resources/
│  ├─ application.properties (ou application.yml)  # configurações locais
│  ├─ db/migration/ (scripts SQL)
├─ src/main/webapp/
│  ├─ WEB-INF/
│  │  ├─ web.xml
│  │  └─ jsp/ (views se necessário)
├─ pom.xml
```

---

## Banco de dados — modelo e scripts

### Tabelas principais

* `categoria` (id, nome, descricao)
* `fornecedor` (id, nome, cnpj\_cpf, telefone, email)
* `produto` (id, sku, nome, descricao, categoria\_id, fornecedor\_id, preco, estoque\_minimo)
* `estoque_movimento` (id, produto\_id, tipo, quantidade, data, usuario\_id, observacao)
* `usuario` (id, username, senha\_hash, nome, email)
* `usuario_role` (usuario\_id, role)

### SQL (Postgres)

```sql
CREATE TABLE categoria (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT
);

CREATE TABLE fornecedor (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(150) NOT NULL,
  cnpj_cpf VARCHAR(20),
  telefone VARCHAR(30),
  email VARCHAR(100)
);

CREATE TABLE produto (
  id SERIAL PRIMARY KEY,
  sku VARCHAR(50) UNIQUE NOT NULL,
  nome VARCHAR(200) NOT NULL,
  descricao TEXT,
  categoria_id INT REFERENCES categoria(id),
  fornecedor_id INT REFERENCES fornecedor(id),
  preco NUMERIC(10,2) DEFAULT 0,
  estoque_minimo INT DEFAULT 0
);

CREATE TABLE estoque_movimento (
  id SERIAL PRIMARY KEY,
  produto_id INT REFERENCES produto(id) NOT NULL,
  tipo VARCHAR(10) NOT NULL, -- ENTRADA | SAIDA | AJUSTE
  quantidade INT NOT NULL,
  data TIMESTAMP WITH TIME ZONE DEFAULT now(),
  usuario_id INT,
  observacao TEXT
);

CREATE TABLE usuario (
  id SERIAL PRIMARY KEY,
  username VARCHAR(80) UNIQUE NOT NULL,
  senha_hash VARCHAR(255) NOT NULL,
  nome VARCHAR(150),
  email VARCHAR(150)
);

CREATE TABLE usuario_role (
  usuario_id INT REFERENCES usuario(id),
  role VARCHAR(50),
  PRIMARY KEY (usuario_id, role)
);
```

---

## Contrato da API (REST) — Visão geral

* Base path: `/api/v1`
* Formato: `application/json`
* Pagination: `page` (0-based) e `size` (ex: `?page=0&size=20`)
* Sorting: `sort=campo,asc|desc` (ex: `?sort=nome,asc`)

### Códigos de resposta padrões

* `200 OK` — sucesso
* `201 Created` — recurso criado
* `204 No Content` — sucesso sem corpo
* `400 Bad Request` — validação/entrada inválida
* `401 Unauthorized` — sem autenticação
* `403 Forbidden` — sem permissão
* `404 Not Found` — recurso não encontrado
* `409 Conflict` — conflito (ex: SKU duplicado)
* `500 Internal Server Error` — erro do servidor

---

## Endpoints

### Produtos

#### `GET /api/v1/produtos`

Listar produtos com paginação, filtro e ordenação.

* Query params: `page`, `size`, `sort`, `q` (busca por nome ou sku), `categoriaId`, `fornecedorId`, `minEstoque` (filtra estoque <= valor)
* Response: `200` JSON paginado

**Exemplo response (200)**

```json
{
  "content": [
    {
      "id": 1,
      "sku": "SKU-001",
      "nome": "Parafuso 5mm",
      "descricao": "Parafuso aço",
      "categoriaId": 2,
      "fornecedorId": 3,
      "preco": 0.50,
      "estoqueAtual": 150,
      "estoqueMinimo": 10
    }
  ],
  "pageable": { "pageNumber": 0, "pageSize": 20 },
  "totalElements": 1
}
```

#### `GET /api/v1/produtos/{id}`

* Response: `200` produto completo ou `404` se não existir.

#### `POST /api/v1/produtos`

Criar produto.

* Body (201):

```json
{
  "sku": "SKU-002",
  "nome": "Porca M8",
  "descricao": "Porca galvanizada",
  "categoriaId": 1,
  "fornecedorId": 2,
  "preco": 0.30,
  "estoqueMinimo": 5
}
```

* Response `201 Created` com Location header `/api/v1/produtos/{id}` e corpo com o recurso criado.
* Erros: `400` se faltar campos, `409` se `sku` duplicado.

#### `PUT /api/v1/produtos/{id}`

Atualiza dados do produto (full update). Retorna `200` com recurso atualizado.

#### `PATCH /api/v1/produtos/{id}`

Atualização parcial (opcional)

#### `DELETE /api/v1/produtos/{id}`

Apaga produto (ou marcar inativo). Resposta `204 No Content`.

---

### Categorias

* `GET /api/v1/categorias` (listar)
* `GET /api/v1/categorias/{id}`
* `POST /api/v1/categorias`
* `PUT /api/v1/categorias/{id}`
* `DELETE /api/v1/categorias/{id}`

Payloads simples com `id, nome, descricao`.

---

### Fornecedores

* `GET /api/v1/fornecedores`
* `POST /api/v1/fornecedores`
* etc.

Exemplo `POST` body:

```json
{
  "nome": "Fornecedor X",
  "cnpjCpf": "12.345.678/0001-99",
  "telefone": "(11) 99999-9999",
  "email": "contato@fornecedor.com"
}
```

---

### Movimentos de estoque

#### `POST /api/v1/movimentos`

Registra um movimento — entrada/saída/ajuste.

* Body:

```json
{
  "produtoId": 1,
  "tipo": "ENTRADA", // ENTRADA | SAIDA | AJUSTE
  "quantidade": 50,
  "observacao": "Compra fornecedor X"
}
```

* Regras:

  * Em `SAIDA`, valida se há estoque suficiente (ou permitir negativo conforme regra de negócio).
  * Ao gravar, atualiza o estoque atual do produto (pode ser calculado somando movimentos ou armazenado em coluna separada).
* Response: `201 Created` com movimento criado.

#### `GET /api/v1/movimentos?produtoId=1&page=0&size=20`

Retorna histórico de movimentos filtrado.

## DTOs / Modelos (exemplo resumido)

```java
class ProdutoDTO {
  Long id;
  String sku;
  String nome;
  String descricao;
  Integer estoqueAtual;
  Integer estoqueMinimo;
  BigDecimal preco;
  Long categoriaId;
  Long fornecedorId;
}

class MovimentoDTO {
  Long id;
  Long produtoId;
  String tipo; // ENTRADA, SAIDA, AJUSTE
  Integer quantidade;
  OffsetDateTime data;
  String observacao;
}
```

## Validações e mensagens de erro

* Validar campos obrigatórios (ex: `sku`, `nome`, `quantidade > 0`)
* Retornar mensagens claras no corpo do erro com o seguinte formato:

```json
{
  "timestamp": "2025-09-16T12:00:00Z",
  "status": 400,
  "error": "Bad Request",
  "message": "Campo 'nome' é obrigatório",
  "path": "/api/v1/produtos"
}
```

* Usar `@ControllerAdvice` para centralizar tratamento de exceções.

---

## Autenticação e autorização

* Opções:

  * **Spring Security + JWT** (recomendado para APIs REST).
  * **Spring Security com sessão** (form login) se preferir integrar com JSP.
* Roles: `ROLE_USER`, `ROLE_ADMIN`.
* Endpoints de autenticação: `POST /api/v1/auth/login` (retorna token)
* Proteger endpoints sensíveis (ex: movimentos, CRUD) com roles apropriadas.

## Como rodar localmente (passo-a-passo)

1. Instalar JDK 8 e Maven
2. Configurar banco local (Postgres) e criar o schema usando os scripts em `src/main/resources/db/migration`
3. Ajustar `src/main/resources/application.properties` (URL do DB, usuário, senha)
4. Build: `mvn clean package`
5. Rodar com WildFly (deploy do WAR) ou — para desenvolvimento rápido — usar um plugin/embebed server (opcional)
6. Testes: `mvn test`

---

## Testes

* Unitários: JUnit + Mockito para serviços e validações
* Integração: testes com banco em memória (H2) ou profile de integração apontando para DB de teste
* Testes end-to-end: Postman/Newman

---

## Boas práticas / checklist

* DTOs para entrada/saída (não expor entidades diretamente)
* Centralizar tratamento de exceções (`@ControllerAdvice`)
* Versionar API (`/api/v1`)
* Documentar com OpenAPI/Swagger e manter atualizada
* Validar entrada com `javax.validation` (`@NotNull`, `@Size`, `@Min`)
* Testes automatizados
* CI: pipeline que roda `mvn clean test`, build e deploy automático para ambiente de staging
