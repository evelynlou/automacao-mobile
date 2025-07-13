*** Settings ***
Library    AppiumLibrary

*** Variables ***

${campo_nome}    	    test-Username
${campo_senha}    	    test-Password
${login}                test-LOGIN

*** Keywords ***

Abrir o aplicativo
    Open Application
    ...    remote_url=http://127.0.0.1:4723  
    ...    platformName=Android    
    ...    deviceName=Android Device
    ...    app=C:/Users/Evelyn/Documents/automacao_mobile/Android.SauceLabs.Mobile.Sample.app.2.7.1.apk
    ...    automationName=UiAutomator2
    ...    appWaitActivity=com.swaglabsmobileapp.MainActivity

Fechar o aplicativo
    Close All Applications

Clicar no campo "Username"
    Sleep    3s
    Element Should Be Visible    locator=//android.view.ViewGroup[@content-desc="test-LOGIN"]
    Click Element    accessibility_id=${campo_nome}

Digitar o termo "${nome}" no campo username
    Input Text    accessibility_id=${campo_nome}    text=${nome}
    
Clicar no campo "password"
    Sleep    2s
    Click Element    accessibility_id=${campo_senha}

Digitar o termo "${senha}" no campo password
    Input Text    accessibility_id=${campo_senha}    text=${senha}

Verififcar se o acesso ao app é negado
    Click Element    accessibility_id=${login}
    Sleep    3s
    Element Should Be Visible    locator=//android.widget.TextView[@text="Username and password do not match any user in this service."]
    Capture Page Screenshot      filename=armazenamento 

Verififcar se o acesso ao app é consedido
    Click Element    accessibility_id=${login}
    Sleep    3s
    Element Should Be Visible    locator=//android.view.ViewGroup[@content-desc="test-Cart drop zone"]/android.view.ViewGroup
    Capture Page Screenshot      filename=armazenamento 
