**Settings***
Documentation   Suite de testes de Login do Adinistrador

Resource        ../resources/base.robot

***Test Cases***
Login do Administrador
    New Browser     chromium    False                                        # Abrir no Google Chrome | False é o para abrir o navegador
    New Page        https://bodytest-web-cassio.herokuapp.com/

    auth.Login With  admin@bodytest.com  pwd123

    Get Text    css=aside strong    equal   Administrador

    Take Screenshot

Senha Incorreta
    New Browser     chromium    False
    New Page        https://bodytest-web-cassio.herokuapp.com/

    auth.Login With  admin@bodytest.com  123456

    Wait For Elements State     css=.Toastify__toast-body >> text=Usuário ou senha inválido     visible     5 

    Take Screenshot

Email Incorreto
    New Browser     chromium    False
    New Page        https://bodytest-web-cassio.herokuapp.com/

    auth.Login With  admin&bodytest.com  pwd123

    Wait For Elements State     css=form span >> text=Informe um e-mail válido     visible     5 

    Take Screenshot

Senha Não Informada
    New Browser     chromium    False
    New Page        https://bodytest-web-cassio.herokuapp.com/

    auth.Login With  admin@bodytest.com  ${EMPTY}

    Wait For Elements State     css=form span >> text=A senha é obrigatória     visible     5 

    Take Screenshot

Email Não Informado
    New Browser     chromium    False
    New Page        https://bodytest-web-cassio.herokuapp.com/

    auth.Login With  ${EMPTY}  pwd123

    Wait For Elements State     css=form span >> text=O e-mail é obrigatório    visible     5 

    Take Screenshot

Email e Senha Não Informados
    [Tags]  temp
    New Browser     chromium    False
    New Page        https://bodytest-web-cassio.herokuapp.com/

    auth.Login With  ${EMPTY}  ${EMPTY}

    Wait For Elements State     css=form span >> text=O e-mail é obrigatório    visible     5 
    Wait For Elements State     css=form span >> text=A senha é obrigatória     visible     5 

    Take Screenshot