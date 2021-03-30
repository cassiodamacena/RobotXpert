**Settings***
Documentation   Suite de testes de Login do Adinistrador

Library         Browser

***Test Cases***
Login do Administrador
    New Browser     chromium    False                                        # Abrir no Google Chrome | False é o para abrir o navegador
    New Page        https://bodytest-web-cassio.herokuapp.com/

    #email - seletor css id
    #input[name=email]  seletor css elmento_html[propridade=valor]
    
    Fill Text   id=email        admin@bodytest.com
    Fill Text   id=password     pwd123

    Click       text=Entrar

    Get Text    css=aside strong    equal   Administrador

    Take Screenshot

Senha Incorreta
    New Browser     chromium    False
    New Page        https://bodytest-web-cassio.herokuapp.com/

    Fill Text   id=email        admin@bodytest.com
    Fill Text   id=password     123456

    Click       text=Entrar

    #Wait For Elements State     css=.Toastify__toast-body   visible     5   # Time-out explicito para aguardar elemento ficar visivel em tela
    #Get Text                    css=.Toastify__toast-body   should be   Usuário ou senha inválido

    Wait For Elements State     css=.Toastify__toast-body >> text=Usuário ou senha inválido     visible     5 

    Take Screenshot

Email Incorreto
    New Browser     chromium    False
    New Page        https://bodytest-web-cassio.herokuapp.com/

    Fill Text   id=email        admin&bodytest.com
    Fill Text   id=password     123456

    Click       text=Entrar

    Wait For Elements State     css=form span >> text=Informe um e-mail válido     visible     5 

    Take Screenshot

Senha Não Informada
    New Browser     chromium    False
    New Page        https://bodytest-web-cassio.herokuapp.com/

    Fill Text   id=email        admin@bodytest.com
    Fill Text   id=password     ${EMPTY}

    Click       text=Entrar

    Wait For Elements State     css=form span >> text=A senha é obrigatória     visible     5 

    Take Screenshot

Email Não Informado
    New Browser     chromium    False
    New Page        https://bodytest-web-cassio.herokuapp.com/

    Fill Text   id=email        ${EMPTY}
    Fill Text   id=password     admin@bodytest.com
    Click       text=Entrar

    Wait For Elements State     css=form span >> text=O e-mail é obrigatório    visible     5 

    Take Screenshot

Email e Senha Não Informados
    [Tags]  temp
    New Browser     chromium    False
    New Page        https://bodytest-web-cassio.herokuapp.com/

    Fill Text   id=email        ${EMPTY}
    Fill Text   id=password     ${EMPTY}
    Click       text=Entrar

    Wait For Elements State     css=form span >> text=O e-mail é obrigatório    visible     5 
    Wait For Elements State     css=form span >> text=A senha é obrigatória     visible     5 

    Take Screenshot