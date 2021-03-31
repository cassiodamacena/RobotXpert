****Settings***
Documentation   Ações de autorização de Login

***Keywords***
Go To Login Page
    Go To           https://bodytest-web-cassio.herokuapp.com/

Login With
    [Arguments]     ${email}    ${senha}

    Wait For Elements State     id=email   visible     15

    Fill Text   id=email        ${email}
    Fill Text   id=password     ${senha}
    Click       text=Entrar

Toaster Text Should Be
    [Arguments]                 ${expected_text}
    Wait For Elements State     css=.Toastify__toast-body >> text=${expected_text}    visible     15 

Alert Text Should Be
    [Arguments]                 ${expected_text}
    Wait For Elements State     css=form span >> text=${expected_text}     visible     15 
