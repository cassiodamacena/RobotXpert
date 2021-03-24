***Settings***
Documentation   Trabalhando com Condicionais


***Test Cases***
Carteira de Motorista
    ${idade}=       Set Variable        18              # Variável local recebendo um valor fixo de 18

    IF      ${idade} >= 18                              # Estrutura condicional ELSE nativa do Robot
        Log To Console      Você pode tirar sua CNH     # Log para escrever na tela
    ELSE                                                # Estrutura condicional ELSE nativa do Robot
        Log To Console      Você pode andar de bicicleta
    END                                                 # Finalizando a estrutura condicional

Navegador
    [tags]      browser                                 # Keyword para definir uma tag para executar somente o teste definido na tag
                                                        # robot -d ./logs -i browser condicionais.robot (vai rodar somene esta tag)
    ${browser}  Set Variable    Firefox

    IF      '${browser}' == 'Firefox'                   # Comparação de Strings deve passar por aspas simples
        Log To Console      Chamando o ${browser}
    ELSE IF      '${browser}' == 'Chrome'               # Estrutura condicional ELSE IF nativa do Robot
        Log To Console      Chamando o ${browser}
    ELSE IF      '${browser}' == 'Webkit'
        Log To Console      Chamando o ${browser}
    ELSE
        #Log To Console      Navegador não homologado!!!
        Fail      Navegador não homologado : ${browser}   # "Fail" força um teste a falhar
    END