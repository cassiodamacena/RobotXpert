***Settings***
Documentation   Suite para testar a classe ContaLibrary

Library         app/ContaLibrary.py

***Test Cases***
Quando abro uma nova conta deve retornar saldo zerado
    Abrir Conta

    ${saldo_final}  Obter saldo

    Log            ${saldo_final}

    ${saldo_esperado}   Convert To Number   0.0
    Should Be Equal     ${saldo_final}      ${saldo_esperado}


Quando faco um deposito deve somar no meu saldo
    Abrir Conta

    ${valor_deposito}   Convert To Number   100
    Depositar           ${valor_deposito}

    ${saldo_final}      Obter Saldo

    Should Be Equal     ${saldo_final}      ${valor_deposito}


Quando faco um saque deve subtrair no meu saldo e tambem a taxa
    Abrir Conta

    ${valor_deposito}   Convert To Number   1000
    Depositar           ${valor_deposito}

    ${valor_saque}       Convert To Number  100
    Sacar               ${valor_saque}

    ${saldo_esperado}   Evaluate             ${valor_deposito} - ${valor_saque} -2.00

    ${saldo_final}      Obter Saldo

    Should Be Equal     ${saldo_final}      ${saldo_esperado}