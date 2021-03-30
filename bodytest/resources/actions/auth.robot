****Settings***
Documentation   Ações de autorização de Login

***Keywords***
Go To Login Page
    New Browser     chromium    False                                        # Abrir no Google Chrome | False é o para abrir o navegador
    New Page        https://bodytest-web-cassio.herokuapp.com/

Login With
    [Arguments]     ${email}    ${senha}

    Fill Text   id=email        ${email}
    Fill Text   id=password     ${senha}
    Click       text=Entrar

Toaster Should Be
    [Arguments]                 ${expected_text}
    Wait For Elements State     css=.Toastify__toast-body >> text=${expected_text}    visible     5 

Alert Text Should Be
    [Arguments]                 ${expected_text}
    Wait For Elements State     css=form span >> text=${expected_text}     visible     5 
