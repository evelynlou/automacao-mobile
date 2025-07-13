*** Settings ***
Documentation    Esse suite tem como finalidade testar o login do aplicativo Swag Labs
Resource         mobile_resource.robot
Test Setup       Abrir o aplicativo
Test Teardown    Fechar o aplicativo

*** Test Cases ***

Caso de teste 01: Teste de login invalido
    [Documentation]    Esse teste tem como finalidade validar o comportamento de login invalido no app Swag Labs
    [Tags]             login_invalido
    Clicar no campo "Username"
    Digitar o termo "Teste" no campo username
    Clicar no campo "password"
    Digitar o termo "123@" no campo password
    Verififcar se o acesso ao app é negado

Caso de teste 02: Teste de login valido
    [Documentation]    Esse teste tem como finalidade validar o comportamento de login valido no app Swag Labs
    [Tags]             login_valido
    Clicar no campo "Username"
    Digitar o termo "standard_user" no campo username
    Clicar no campo "password"
    Digitar o termo "secret_sauce" no campo password
    Verififcar se o acesso ao app é consedido
