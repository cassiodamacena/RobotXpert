***Settings***
Documentation   Suite para testar a classe ContaLibrary

Library         ContaLibrary.py

***Test Cases***
Quando abro uma nova conta deve retornar saldo zerado
    Abrir Conta

    ${saldo_final}  Obter saldo

    Log            ${saldo_final}

    ${saldo_esperado}   Convert To Number   0.0
    Should Be Equal     ${saldo_final}      ${saldo_esperado}