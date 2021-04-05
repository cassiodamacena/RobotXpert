****Settings***
Documentation   Ações de autorização de Login

***Keywords***
Go To Login Page
    Go To           https://bodytest-web-cassio.herokuapp.com/
    Wait For Elements State     id=email   visible     30

Login With
    [Arguments]     ${email}    ${senha}

    Wait For Elements State     id=email   visible     30

    Fill Text   id=email        ${email}
    Fill Text   id=password     ${senha}
    Click       text=Entrar