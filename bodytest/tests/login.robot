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
Cenário: Login do Administrador
    auth.Go To Login Page
    auth.Login With                 admin@bodytest.com  pwd123

    nav.User Should Be Logged In    Administrador

    [Teardown]      Clear Local Storage And Take Screenshot

cenário: Senha Incorreta
    auth.Go To Login Page
    auth.Login With                 admin@bodytest.com  123456
    Toaster Text Should Be     Usuário e/ou senha inválidos.

    [Teardown]      Thinking And Take Screenshot    2

Cenário: Email Não Cadastado
    auth.Go To Login Page
    auth.Login With                 admin@bodytest.com  123456
    Toaster Text Should Be     Usuário e/ou senha inválidos.

    [Teardown]      Thinking And Take Screenshot    2

Cenário: Email Incorreto
    auth.Go To Login Page
    auth.Login With             admin&bodytest.com  pwd123
    Alert Text Should Be   Informe um e-mail válido

Cenário: Senha Não Informada
    auth.Go To Login Page
    auth.Login With             admin@bodytest.com  ${EMPTY}
    Alert Text Should Be   A senha é obrigatória

Cenário: Email Não Informado
    auth.Go To Login Page
    auth.Login With             ${EMPTY}  pwd123
    Alert Text Should Be   O e-mail é obrigatório

Cenário: Email e Senha Não Informados
    auth.Go To Login Page

    auth.Login With  ${EMPTY}   ${EMPTY}
    Alert Text Should Be   O e-mail é obrigatório 
    Alert Text Should Be   A senha é obrigatória