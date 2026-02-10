# 🐑 SISOV Backend - API de Rastreabilidade de Ovinos

> Cérebro central do Sistema de Rastreabilidade de Ovinos (SISOV). Uma API RESTful construída para servir tanto a plataforma Web (gestão e auditoria) quanto o aplicativo Mobile (focado no produtor rural com funcionamento offline-first).

## 🎯 Sobre o Projeto
O SISOV busca resolver a falta de rastreabilidade padronizada na ovinocultura. Este backend centraliza as regras de negócio, garantindo segurança sanitária, imutabilidade de histórico e controle zootécnico através da geração de QR Codes únicos para cada animal.

## 🚀 Tecnologias Utilizadas
* **Linguagem:** Dart
* **Framework Web:** Dart Frog (Roteamento simples e de alta performance)
* **Arquitetura:** API-First / Arquitetura Limpa (Clean Architecture)
* **Banco de Dados (Futuro):** PostgreSQL

## 🧠 Regras de Negócio (Core)
O backend garante as seguintes premissas operacionais do sistema:
* **RN01:** Identificação única (ID SISOV) sem duplicidade.
* **RN02:** Vínculo obrigatório: Nenhum animal existe sem um produtor.
* **RN03:** Histórico imutável: Eventos (vacinas, pesagem) são apenas inseridos, nunca deletados (auditoria real).
* **RN04:** Controle de privacidade: Consultas públicas via QR Code expõem apenas dados sanitários/básicos, ocultando dados financeiros e pessoais do produtor.
* **RN05:** Rastreabilidade de autoria: Todo evento exige data e usuário responsável.

## 📂 Estrutura do Projeto (inicial)
A estrutura de pastas segue o roteamento baseado em arquivos do Dart Frog, isolando as funcionalidades:

```text
sisov-backend/
├── routes/
│   ├── auth/
│   │   ├── login.dart       # Autenticação de usuários/produtores
│   │   └── register.dart    # Cadastro de novos produtores
│   └── animal/
│       └── index.dart       # Cadastro e listagem de animais
├── lib/                     # (Futuro) Entidades, Casos de Uso e Conexão BD
├── pubspec.yaml             # (Futuro)Dependências do projeto
└── README.md

# 🛠️ Como Rodar Localmente (Desenvolvimento)

## ✅ Pré-requisitos

Antes de iniciar, certifique-se de ter instalado:

- **Dart SDK** na máquina  
- **CLI do Dart Frog**

Para instalar o Dart Frog CLI, execute:

```bash
dart pub global activate dart_frog_cli
```

---

## ▶️ Passos para Execução

### 1. Clone este repositório

```bash
git clone https://github.com/SAUL-ALVES/sisov-backend.git
```

### 2. Entre na pasta do projeto

```bash
cd sisov-backend
```

### 3. Inicie o servidor de desenvolvimento

```bash
dart_frog dev
```

O servidor estará rodando em:

👉 http://localhost:8080

---

# 📡 Endpoints (MVP Atual)

| Método | Rota            | Descrição                                           |
|--------|-----------------|-----------------------------------------------------|
| POST   | `/auth/register`| Cria uma conta de produtor                          |
| POST   | `/auth/login`   | Autentica e gera token de acesso                    |
| POST   | `/animal`       | Registra um novo ovino associado a um produtor      |
