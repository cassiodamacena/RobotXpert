**Settings***
Documentation   Suite de testes de Login do Adinistrador

Resource        ../resources/base.robot

***Test Cases***
Login do Administrador
    [Tags]  admin
    auth.Go To Login Page
    auth.Login With                 admin@bodytest.com  pwd123

    nav.User Should Be Logged In    Administrador

    Take Screenshot

Senha Incorreta
    auth.Go To Login Page
    auth.Login With             admin@bodytest.com  123456
    auth.Toaster Should Be      Usuário ou senha inválido 

    Take Screenshot

Email Incorreto
    auth.Go To Login Page
    auth.Login With             admin&bodytest.com  pwd123
    auth.Alert Text Should Be   Informe um e-mail válido

    Take Screenshot

Senha Não Informada
    auth.Go To Login Page
    auth.Login With             admin@bodytest.com  ${EMPTY}
    auth.Alert Text Should Be   A senha é obrigatória

    Take Screenshot

Email Não Informado
    auth.Go To Login Page
    auth.Login With             ${EMPTY}  pwd123
    auth.Alert Text Should Be   O e-mail é obrigatório

    Take Screenshot

Email e Senha Não Informados
    auth.Go To Login Page

    auth.Login With  ${EMPTY}   ${EMPTY}
    auth.Alert Text Should Be   O e-mail é obrigatório 
    auth.Alert Text Should Be   A senha é obrigatória

    Take Screenshot