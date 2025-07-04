# 🏥 Health Calc - Calculadora de IMC

Uma aplicação Flutter moderna e intuitiva para cálculo de Índice de Massa Corporal (IMC) com histórico completo e funcionalidades avançadas.

## ✨ Funcionalidades

### 🧮 **Cálculo de IMC**
- Interface limpa e moderna para entrada de dados
- Cálculo automático do IMC baseado em peso e altura
- Classificação automática em categorias (Magreza, Normal, Sobrepeso, Obesidade, Obesidade Grave)
- Resultado visual com cores indicativas por categoria

### 📊 **Histórico Completo**
- Armazenamento local de todos os cálculos realizados
- Visualização cronológica dos resultados
- Estatísticas detalhadas (total, média, maior, menor)
- Exportação para CSV com todos os dados

### 🌍 **Internacionalização**
- Suporte completo para português e inglês
- Interface adaptada para ambos os idiomas
- Tradução automática de categorias e mensagens

### 🎨 **Tema Dinâmico**
- Alternância entre tema claro e escuro
- Persistência da preferência do usuário
- Interface adaptada para ambos os temas

### 📱 **Multiplataforma**
- Funciona em iOS, Android, macOS, Windows, Linux e Web
- Interface responsiva e adaptável
- Experiência consistente em todas as plataformas

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK (versão 3.0 ou superior)
- Dart SDK
- IDE (VS Code, Android Studio, etc.)

### Instalação
```bash
# Clone o repositório
git clone https://github.com/seu-usuario/health-calc.git
cd health-calc

# Instale as dependências
flutter pub get

# Execute o app
flutter run
```

### Plataformas Suportadas
```bash
# iOS
flutter run -d ios

# Android
flutter run -d android

# macOS
flutter run -d macos

# Web
flutter run -d chrome
```

## 🛠️ Tecnologias Utilizadas

- **Flutter** - Framework de desenvolvimento
- **Dart** - Linguagem de programação
- **Provider** - Gerenciamento de estado
- **Easy Localization** - Internacionalização
- **Shared Preferences** - Armazenamento local
- **CSV** - Exportação de dados
- **Path Provider** - Acesso a diretórios do sistema

## 📁 Estrutura do Projeto

```
lib/
├── core/
│   ├── constants.dart      # Constantes e configurações
│   ├── theme.dart          # Temas da aplicação
│   └── utils.dart          # Funções utilitárias
├── features/
│   ├── home/               # Tela principal
│   │   ├── home_screen.dart
│   │   ├── imc_form.dart
│   │   └── imc_result_card.dart
│   ├── history/            # Tela de histórico
│   │   ├── history_screen.dart
│   │   └── history_item.dart
│   └── settings/           # Tela de configurações
│       └── settings_screen.dart
├── models/
│   └── imc_result.dart     # Modelo de dados
├── services/
│   ├── history_service.dart # Serviço de histórico
│   └── export_service.dart  # Serviço de exportação
├── shared/
│   ├── theme_provider.dart  # Provider de tema
│   └── widgets/            # Widgets compartilhados
│       ├── custom_button.dart
│       ├── custom_input.dart
│       └── gender_selector.dart
└── main.dart               # Ponto de entrada
```

## 🎯 Funcionalidades Principais

### Cálculo de IMC
- **Entrada de dados**: Peso (kg) e altura (cm)
- **Cálculo automático**: IMC = peso / (altura/100)²
- **Classificação**: Categorias baseadas nos padrões da OMS
- **Resultado visual**: Cores e ícones indicativos

### Histórico e Estatísticas
- **Armazenamento local**: Todos os cálculos são salvos
- **Visualização**: Lista cronológica com detalhes
- **Estatísticas**: Total, média, maior e menor IMC
- **Exportação**: CSV com dados completos

### Configurações
- **Tema**: Alternância entre claro/escuro
- **Idioma**: Português e inglês
- **Persistência**: Preferências salvas automaticamente

## 📊 Categorias de IMC

| Categoria | IMC | Cor |
|-----------|-----|------|
| Magreza | < 18.5 | 🟠 Laranja |
| Normal | 18.5 - 24.9 | 🟢 Verde |
| Sobrepeso | 25.0 - 29.9 | 🟠 Laranja |
| Obesidade | 30.0 - 39.9 | 🔴 Vermelho |
| Obesidade Grave | ≥ 40.0 | 🔴 Vermelho |

## 🌟 Características Técnicas

### Arquitetura
- **Clean Architecture** com separação de responsabilidades
- **Provider Pattern** para gerenciamento de estado
- **Service Layer** para lógica de negócio
- **Repository Pattern** para acesso a dados

### Performance
- **Hot Reload** para desenvolvimento rápido
- **Lazy Loading** para otimização
- **Efficient State Management** com Provider

### Acessibilidade
- **Suporte a leitores de tela**
- **Navegação por teclado**
- **Contraste adequado**
- **Textos escaláveis**

## 🤝 Contribuindo

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 📞 Contato

- **Desenvolvedor**: [Seu Nome]
- **Email**: [seu-email@exemplo.com]
- **GitHub**: [@seu-usuario]

---

⭐ Se este projeto te ajudou, considere dar uma estrela no repositório!
