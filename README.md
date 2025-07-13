## 📱 Automação Mobile: Robot Framework + Appium

Conteúdo

- [Introdução ao Appium](#introdução-ao-appium)
- [Introdução ao Robot Framework](#introdução-ao-robot-framework)

---

## Introdução ao Robot Framework

O **Robot Framework** é uma ferramenta de automação de testes utilizada para validar o funcionamento de sites, aplicações web, aplicativos desktop, mobile, bancos de dados, entre outros tipos de sistemas.

Ele suporta a automação de praticamente qualquer tecnologia e é baseado no conceito de **keyword-driven** (dirigido por palavras-chave), o que abstrai a complexidade da programação de baixo nível e torna o processo mais acessível.

Sua sintaxe é baseada em dados tabulares, o que facilita a leitura e manutenção. Além disso, permite a criação de bibliotecas personalizadas em Python, embora já ofereça diversas keywords prontas para uso.

> 💡 Já tenho uma documentação mais completa sobre o Robot Framework, incluindo escrita de testes, instalação e muitos outros tópicos. Você pode conferir aqui:  
> 👉 [https://github.com/evelynlou/Automa-o-de-Testes](https://github.com/evelynlou/Automa-o-de-Testes)

---

## Introdução ao Appium

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

## Processo de Instalação do Appium

Para conseguir rodar uma automação mobile com **Appium + Robot Framework**, é necessário instalar os seguintes componentes:

1) Pré-requisitos

- [Node.js](https://nodejs.org/en/download) – necessário para instalar o Appium via NPM.
- [Visual Studio Code](https://code.visualstudio.com/) – editor de código.
- [Android Studio](https://developer.android.com/studio) – necessário para automação em Android.
- [Xcode](https://developer.apple.com/xcode/) – necessário para automação em iOS (somente em macOS).
- **Drivers Appium 2.0**:
  - [`uiautomator2`](https://github.com/appium/appium-uiautomator2-driver) (Android)
  - [`xcuitest`](https://github.com/appium/appium-xcuitest-driver) (iOS)


2) Instalações via Terminal


• Instalar Appium (globalmente)

  ```npm install -g appium```


• Instalar Appium Doctor

  ```npm install -g appium-doctor```


## Configuração do Appium Doctor

Ao rodar o comando `appium-doctor`, o esperado é que todas as verificações apareçam em **verde**.

Caso alguma verificação apareça em vermelho, como `JAVA_HOME` ou `ANDROID_HOME`, será necessário configurar essas variáveis manualmente.


• JAVA_HOME

O `JAVA_HOME` é necessário para que o Appium consiga localizar o Java no sistema.

**Passos:**

1. Instale o Java: [https://www.oracle.com/java/technologies/javase-downloads.html](https://www.oracle.com/java/technologies/javase-downloads.html)
2. Localize o caminho de instalação do Java (exemplo: `C:\Program Files\Java\jdk-XX`)
3. Vá até as **Variáveis de Ambiente** no sistema:
   - Crie uma variável de sistema chamada `JAVA_HOME`
   - Defina o valor como o caminho da instalação do Java
4. Edite a variável `Path` e adicione a seguinte entrada:
   
   ```%JAVA_HOME%\bin```

5. Verificação no Terminal(opcional):

   ```echo %JAVA_HOME%```


• ANDROID_HOME

O `ANDROID_HOME` aponta para a pasta onde o **Android SDK** está instalado. Ele é essencial para que o Appium se comunique com dispositivos Android — seja para executar testes em emuladores ou dispositivos reais, por meio de ferramentas como o ADB (*Android Debug Bridge*).

**Passos:**

1. O Android Studio: Já deve estar instalado.
  
2. Após a instalação, localize a pasta do SDK. O caminho padrão geralmente é:  
   
 ``` C\Users\SeuUsuario\AppData\Local\Android\Sdk```

3. Vá até as Variáveis de Ambiente do sistema:

Clique em "Novo" e crie uma variável de sistema chamada:
 
```ANDROID_HOME```

• No campo de valor, insira o caminho completo da pasta do SDK (conforme o exemplo acima).


4. Edite a variável `Path` e adicione a seguinte entrada:

  ```
   %ANDROID_HOME%\plataform-tools
   %ANDROID_HOME%\emulator
 ```

5. Verificação no Terminal(opcional):

   ```echo %ANDROID_HOME```

Depois que finalizar rode o Appium Doctor e verifique se está tudo ok.

> ⚠️ Atenção:
> Em versões mais recentes do SDK, o arquivo android.bat foi descontinuado.
Algumas versões antigas do Appium Doctor ainda tentam localizar esse arquivo e podem marcar como erro.
> No entanto, se ANDROID_HOME e JAVA_HOME estiverem configurados corretamente, o ambiente estará funcional e o Appium funcionará normalmente.

---

## Instalação da AppiumLibrary no Robot Framework

Após configurar o ambiente e instalar o Appium, é necessário instalar a AppiumLibrary para o Robot Framework:

```pip install RobotFramework -appiumlibrary```

Essa biblioteca contém as keywords necessárias para criar testes de automação mobile com Appium e Robot Framework.

---

## Appium Inspector

Appium Inspector se conecta ao Appium Server, que por sua vez se comunica com o dispositivo móvel (real ou emulador). Uma vez conectado, é possível inspecionar os elementos da tela e visualizar seus locators, facilitando a automação dos testes.

Para utilizar o Appium Inspector, é necessário fornecer as capabilities, que são configurações essenciais para que o Appium saiba como e onde se conectar.

Exemplo de capabilities:

```
{
  "appium:app": "caminho/do/app.apk",
  "appium:platformName": "Android", // ou "iOS"
  "appium:automationName": "UiAutomator2", // ou outro driver, como "XCUITest" para iOS
  "appium:deviceName": "Android Device" // nome do 
emulador ou "Android Device" para dispositivo real

}
```