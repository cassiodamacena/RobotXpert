****Settings***
Documentation   Ações de autorização de Login

***Keywords***
Login With
    [Arguments]     ${email}    ${senha}

    Fill Text   id=email        ${email}
    Fill Text   id=password     ${senha}
    Click       text=Entrar

