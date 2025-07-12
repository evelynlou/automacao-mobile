## 📱 Automação Mobile: Robot Framework + Appium

Conteúdo

- [Introdução ao Appium](#introdução-ao-appium)
- [Introdução ao Robot Framework](#introdução-ao-robot-framework)

---

## 🤖 Introdução ao Robot Framework

O **Robot Framework** é uma ferramenta de automação de testes utilizada para validar o funcionamento de sites, aplicações web, aplicativos desktop, mobile, bancos de dados, entre outros tipos de sistemas.

Ele suporta a automação de praticamente qualquer tecnologia e é baseado no conceito de **keyword-driven** (dirigido por palavras-chave), o que abstrai a complexidade da programação de baixo nível e torna o processo mais acessível.

Sua sintaxe é baseada em dados tabulares, o que facilita a leitura e manutenção. Além disso, permite a criação de bibliotecas personalizadas em Python, embora já ofereça diversas keywords prontas para uso.

> 💡 Já tenho uma documentação mais completa sobre o Robot Framework, incluindo escrita de testes, instalação e muitos outros tópicos. Você pode conferir aqui:  
> 👉 [https://github.com/evelynlou/Automa-o-de-Testes](https://github.com/evelynlou/Automa-o-de-Testes)

---

## 🔧 Introdução ao Appium

O **Appium** é um **servidor de código aberto**, baseado no protocolo **WebDriver**, que gerencia a comunicação com dispositivos móveis **Android** e **iOS**.

Ele funciona da seguinte forma:

1. A automação é escrita utilizando algum framework (como o Robot Framework);
2. O script envia comandos para o **Appium Server**;
3. O Appium repassa esses comandos para o dispositivo móvel;
4. As respostas do dispositivo retornam pelo mesmo caminho, até o script.

Essa estrutura permite realizar testes automatizados em dispositivos reais ou emuladores/simuladores, com grande flexibilidade.

> ⚠️ Quando falamos de automação mobile com **Robot Framework**, é importante destacar que o Robot **depende do Appium para executar testes em dispositivos móveis**.  
> O Robot sozinho **não consegue interagir diretamente com apps mobile**, pois ele precisa de uma "ponte" — e essa ponte é o Appium.  
> Portanto, configurar corretamente o Appium é uma etapa essencial para que a automação funcione.

---

## ⚙️ Processo de Instalação do Appium

Para conseguir rodar uma automação mobile com **Appium + Robot Framework**, é necessário instalar os seguintes componentes:

Pré-requisitos

- [Node.js](https://nodejs.org/en/download) – necessário para instalar o Appium via NPM.
- [Visual Studio Code](https://code.visualstudio.com/) – editor de código recomendado.
- [Android Studio](https://developer.android.com/studio) – necessário para automação em Android.
- [Xcode](https://developer.apple.com/xcode/) – necessário para automação em iOS (somente em macOS).
- **Drivers Appium 2.0**:
  - [`uiautomator2`](https://github.com/appium/appium-uiautomator2-driver) (Android)
  - [`xcuitest`](https://github.com/appium/appium-xcuitest-driver) (iOS)

---

## Instalação via Terminal

```bash
# Instalar Appium (globalmente)
npm install -g appium

# Instalar Appium Doctor (verifica se o ambiente está correto)
npm install -g appium-doctor


---

