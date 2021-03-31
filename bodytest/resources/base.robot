***Settings***
Documentation   Arquivo base do projeo de automação BodyTest

Library         Browser

Resource        actions/auth.robot
Resource        actions/nav.robot
Resource        actions/students.robot

***Keywords***
Start Browser Session
    New Browser     chromium    False                                        # Abrir no Google Chrome | False é o para abrir o navegador
    New Page        about:blank

Clear Local Storage And Take Screenshot
    Take Screenshot
    LocalStorage Clear

Thinking And Take Screenshot
    [Arguments]     ${timeout}

    sleep           ${timeout}
    Take Screenshot