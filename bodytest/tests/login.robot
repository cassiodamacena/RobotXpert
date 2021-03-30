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
    [Tags]  si
    New Browser     chromium    False
    New Page        https://bodytest-web-cassio.herokuapp.com/

    Fill Text   id=email        admin@bodytest.com
    Fill Text   id=password     123456

    Click       text=Entrar

    Wait For Elements State     css=.Toastify__toast-body   visible     5   # Time-out explicito para aguardar elemento ficar visivel em tela
    Get Text                    css=.Toastify__toast-body   should be   Usuário ou senha inválido

    Take Screenshot  
        