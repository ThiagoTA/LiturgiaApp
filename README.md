# Liturgia App

O **Liturgia App** é um aplicativo Flutter desenvolvido para fornecer acesso fácil e offline à liturgia católica diária. Ele permite aos usuários visualizar orações, leituras, antifonas e outras partes da liturgia, com suporte a notificações diárias e armazenamento local para acesso offline.

## Funcionalidades Principais

- **Visualização da Liturgia Diária**: Exibe a liturgia completa do dia, incluindo orações, leituras bíblicas, antifonas e cores litúrgicas.
- **Navegação por Abas**: Interface organizada em abas para Orações, Leituras, Antífonas, Extras e Configurações.
- **Notificações Diárias**: Lembretes automáticos para a liturgia do dia.
- **Modo Offline**: Armazenamento local das liturgias para acesso sem conexão à internet.
- **Tema Escuro**: Interface otimizada para uso noturno.
- **Suporte a Conectividade**: Verificação automática de conexão para sincronização de dados.

## Arquitetura do Aplicativo

O aplicativo segue uma arquitetura limpa (Clean Architecture) dividida em camadas:

- **Presentation Layer**: Contém as páginas, widgets e viewmodels. Responsável pela interface do usuário e lógica de apresentação.
- **Data Layer**: Inclui modelos de dados, repositórios, DAOs (Data Access Objects) e serviços remotos. Gerencia o acesso aos dados locais e remotos.
- **Core Layer**: Contém utilitários, constantes, temas, roteamento, banco de dados e outras funcionalidades compartilhadas.

### Estrutura de Pastas

```
lib/
├── main.dart                 # Ponto de entrada do app
├── core/                     # Utilitários e configurações compartilhadas
│   ├── constants/            # Constantes do app
│   ├── database/             # Configuração do banco de dados
│   ├── exceptions/           # Exceções customizadas
│   ├── extensions/           # Extensões Dart
│   ├── network/              # Cliente HTTP e configurações de rede
│   ├── router/               # Configuração de rotas (Go Router)
│   ├── theme/                # Cores e temas do app
│   ├── utils/                # Utilitários diversos
│   └── widgets/              # Widgets compartilhados
├── data/                     # Camada de dados
│   ├── daos/                 # Data Access Objects para banco local
│   ├── models/               # Modelos de dados
│   ├── repositories/         # Repositórios (abstração de dados)
│   ├── service/              # Serviços remotos
│   └── tables/               # Definições das tabelas do banco
└── presentation/             # Camada de apresentação
    ├── pages/                # Páginas principais
    ├── tabs/                 # Abas da interface
    ├── viewmodels/           # ViewModels (Provider)
    └── widgets/              # Widgets específicos da UI
```

## Bibliotecas Utilizadas

### Dependências Principais

- **flutter**: Framework principal para desenvolvimento do app.
- **cupertino_icons**: Ícones no estilo iOS para compatibilidade.
- **go_router**: Gerenciamento de rotas declarativo e moderno. Usado para navegação entre páginas (Splash e Home).
- **font_awesome_flutter**: Biblioteca de ícones Font Awesome. Utilizada para ícones ricos e variados na interface.
- **http**: Cliente HTTP para requisições web. Essencial para buscar dados da liturgia de APIs remotas.
- **provider**: Gerenciamento de estado simples e eficiente. Usado para injeção de dependências e gerenciamento de estado dos ViewModels.
- **intl**: Internacionalização e formatação de datas. Crucial para formatação de datas em português brasileiro e suporte a localização.
- **drift**: ORM para SQLite em Dart. Usado para armazenamento local das liturgias, permitindo acesso offline.
- **path**: Manipulação de caminhos de arquivos. Necessário para o Drift e path_provider.
- **path_provider**: Acesso a diretórios do dispositivo. Usado para armazenar o banco de dados localmente.
- **flutter_local_notifications**: Notificações locais. Implementa lembretes diários da liturgia.
- **timezone**: Gerenciamento de fusos horários. Essencial para agendar notificações corretamente.
- **flutter_svg**: Renderização de SVGs. Usado para ícones vetoriais escaláveis.
- **package_info_plus**: Informações do pacote/app. Utilizado para exibir versão e outras informações do app.
- **connectivity_plus**: Verificação de conectividade. Permite detectar conexão à internet para sincronização automática.

### Dependências de Desenvolvimento

- **drift_dev**: Geração de código para o Drift. Automatiza a criação de DAOs e tabelas.
- **build_runner**: Executor de builders. Necessário para gerar código com drift_dev.
- **flutter_test**: Framework de testes do Flutter.
- **flutter_lints**: Regras de lint recomendadas para código Flutter de qualidade.
- **flutter_launcher_icons**: Geração automática de ícones do app para diferentes plataformas.

### Configurações Adicionais

- **flutter_launcher_icons**: Configurado para gerar ícones automaticamente a partir de `assets/icons/liturgia_icon.png` para Android e iOS.
- **Fonte Customizada**: Cormorant Garamond para uma aparência mais elegante e apropriada para conteúdo litúrgico.
- **Assets**: Ícones em `assets/icons/`.

## Como Executar

1. Certifique-se de ter o Flutter instalado: [Instalação do Flutter](https://flutter.dev/docs/get-started/install)
2. Clone o repositório e navegue para a pasta do projeto
3. Execute `flutter pub get` para instalar as dependências
4. Execute `flutter run` para iniciar o app

## Funcionamento do App

1. **Inicialização**: O app inicia com uma tela de splash enquanto carrega dados iniciais.
2. **Carregamento de Dados**: Verifica conectividade e carrega a liturgia do dia atual e períodos próximos.
3. **Interface Principal**: Navegação por abas com conteúdo litúrgico organizado.
4. **Notificações**: Agendadas automaticamente para lembrar o usuário da liturgia diária.
5. **Armazenamento**: Dados são armazenados localmente para acesso offline.

## Motivos para as Escolhas Técnicas

- **Flutter**: Plataforma cross-platform para desenvolvimento rápido e nativo em Android e iOS.
- **Clean Architecture**: Separação clara de responsabilidades, facilitando manutenção e testes.
- **Drift**: ORM moderno e type-safe para SQLite, melhor que sqflite para projetos complexos.
- **Provider**: Simples e integrado ao Flutter, evita complexidade desnecessária.
- **Go Router**: Roteamento declarativo moderno, superior ao Navigator 1.0.
- **Notificações Locais**: Permite lembretes sem depender de servidores externos.
- **Conectividade**: Garante experiência offline-first, importante para apps religiosos.

Este aplicativo foi desenvolvido com foco em usabilidade, performance e acesso offline aos conteúdos litúrgicos, atendendo às necessidades de fiéis católicos que desejam acompanhar a liturgia diária.
