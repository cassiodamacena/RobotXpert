**Settings***
Documentation   Suite de testes de Login do Adinistrador

Resource        ../resources/base.robot

#Suite Setup         Log To Console     Tudo aqui acontece ANTES da Suite
#Suite Teardown      Log To Console     Tudo aqui acontece DEPOIS da Suite
#Test Setup          Log To Console     Tudo aqui acontece ANTES de cada Teste
#Test Teardown       Log To Console     Tudo aqui acontece Depois de cada Teste

Suite Setup         Start Browser Session
Test Teardown       Take Screenshot

***Test Cases***
Login do Administradors
    auth.Go To Login Page
    auth.Login With                 admin@bodytest.com  pwd123

    nav.User Should Be Logged In    Administrador

    [Teardown]      Clear Local Storage And Take Screenshot

Senha Incorreta
    auth.Go To Login Page
    auth.Login With                 admin@bodytest.com  123456
    auth.Toaster Text Should Be     Usuário e/ou senha inválidos.

    [Teardown]      Thinking And Take Screenshot    2

Email Não Cadastado
    auth.Go To Login Page
    auth.Login With                 admin@bodytest.com  123456
    auth.Toaster Text Should Be     Usuário e/ou senha inválidos.

    [Teardown]      Thinking And Take Screenshot    2

Email Incorreto
    auth.Go To Login Page
    auth.Login With             admin&bodytest.com  pwd123
    auth.Alert Text Should Be   Informe um e-mail válido

Senha Não Informada
    auth.Go To Login Page
    auth.Login With             admin@bodytest.com  ${EMPTY}
    auth.Alert Text Should Be   A senha é obrigatória

Email Não Informado
    auth.Go To Login Page
    auth.Login With             ${EMPTY}  pwd123
    auth.Alert Text Should Be   O e-mail é obrigatório

Email e Senha Não Informados
    auth.Go To Login Page

    auth.Login With  ${EMPTY}   ${EMPTY}
    auth.Alert Text Should Be   O e-mail é obrigatório 
    auth.Alert Text Should Be   A senha é obrigatória