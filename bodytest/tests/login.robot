**Settings***
Documentation   Suite de testes de Login do Adinistrador

Resource        ../resources/base.robot

#Suite Setup         Log To Console     Tudo aqui acontece ANTES da Suite
#Suite Teardown      Log To Console     Tudo aqui acontece DEPOIS da Suite
#Test Setup          Log To Console     Tudo aqui acontece ANTES de cada Teste
#Test Teardown       Log To Console     Tudo aqui acontece Depois de cada Teste

Suite Setup         Start Browser Session

***Test Cases***
Login do Administrador
    [Tags]  admin
    auth.Go To Login Page
    auth.Login With                 admin@bodytest.com  pwd123

    nav.User Should Be Logged In    Administrador

    Take Screenshot

Senha Incorreta
    [Tags]  temp
    auth.Go To Login Page
    auth.Login With             admin@bodytest.com  123456
    auth.Toaster Should Be      Usuário ou senha inválido 

    Take Screenshot

Email Incorreto
    [Tags]  temp
    auth.Go To Login Page
    auth.Login With             admin&bodytest.com  pwd123
    auth.Alert Text Should Be   Informe um e-mail válido

    Take Screenshot

Senha Não Informada
    [Tags]  temp
    auth.Go To Login Page
    auth.Login With             admin@bodytest.com  ${EMPTY}
    auth.Alert Text Should Be   A senha é obrigatória

    Take Screenshot

Email Não Informado
    [Tags]  temp
    auth.Go To Login Page
    auth.Login With             ${EMPTY}  pwd123
    auth.Alert Text Should Be   O e-mail é obrigatório

    Take Screenshot

Email e Senha Não Informados
    [Tags]  temp
    auth.Go To Login Page

    auth.Login With  ${EMPTY}   ${EMPTY}
    auth.Alert Text Should Be   O e-mail é obrigatório 
    auth.Alert Text Should Be   A senha é obrigatória

    Take Screenshot