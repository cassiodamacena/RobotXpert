***Settings***
Documentation   Laços de Repetições (Loops)

***Variables***
@{AVENGERS}     Ironman     Hulk            Thor        Cap    # Variável do tipo lista
@{JUSTICE}      Superman    Wonder Woman    Batman      Arrow

***Test Cases***
Loop For 1
    Log To Console  ''
    FOR     ${item}     IN      @{AVENGERS}                 # Keyword FOR nativa do Robot
        Log To Console  Imprimindo o vingador: ${item}      # ${item} cada índice da lista
    END                                                     # fim do For

Loop For 2 Com Condicional
    Log To Console  ''
    FOR     ${item}     IN      @{AVENGERS}   
        IF      $item == 'Thor'
            Log To Console  Imprimindo o vingador: ${item}
        END
    END  

Loop For 3 Com Condicional e Exit
    [Tags]      exit
    Log To Console  ''
    FOR     ${item}     IN      @{JUSTICE}   
        Exit For Loop If      $item == 'Batman'             # Condicional "Exit For Loop If" para finalizar o loop
        Log To Console  Imprimindo o Justiceiro: ${item}
    END