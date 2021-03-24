***Settings***                                           
Documentation   Suite para testar a classe ContaLibrary     # Seção de documentação do cenário

Library         app/ContaLibrary.py                         # Importanto um app para Teste

***Test Cases***
Quando abro uma nova conta deve retornar saldo zerado       # Teste case
    Abrir Conta     
    # Neste contexto "Abrir Conta" é uma Keyword reservada/herdada do programa "ContaLibrary.py"

    ${saldo_final}  Obter saldo     # ${saldo_final} é uma variável recebendo o valor da keyword "Obter Saldo"

    Log            ${saldo_final}   # Keyword Log nativa do Robot para imprimir um valor na tela

    ${saldo_esperado}   Convert To Number   0.0                 # Keyword "Convert To Number" para converter um valor para float
    Should Be Equal     ${saldo_final}      ${saldo_esperado}   # "Should Be Equal" para comparar dois valores


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
    # "Evaluate" permite realizar operaçẽs entre variáveis 

    ${saldo_final}      Obter Saldo

    Should Be Equal     ${saldo_final}      ${saldo_esperado}