***Settings***
Documentation   Arquivo base do projeo de automação BodyTest

Library         Browser

Resource        actions/auth.robot
Resource        actions/nav.robot

***Keywords***
Start Browser Session
    New Browser     chromium    False                                        # Abrir no Google Chrome | False é o para abrir o navegador
    New Page        about:blank