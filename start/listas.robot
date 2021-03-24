***Settings***
Documentation   Conhecendo as Listas

Library         Collections

***Variables***
@{AVENGERS}     Ironman     Hulk            Thor        Cap    # Variável do tipo lista
@{JUSTICE}      Superman    Wonder Woman    Batman      Arrow

***Test Cases***
Minha Lista Por Indice
    Log To Console  ''
    Log To Console  ${AVENGERS}     # Imprimindo a lista completa
    Log To Console  ${AVENGERS[0]}  # Imprimindo o valor da posição por índice 0
    Log To Console  ${AVENGERS[1]}
    Log To Console  ${AVENGERS[2]}
    Log To Console  ${AVENGERS[3]}

Minha Lista por Collections
    Log To Console  ''

    Set List Value  ${AVENGERS}         0       Home de Ferro       # Alterar um valor da lista através da biblioteca "Collections"
    Log To Console  ${AVENGERS}

    ${index}    Get Index From List     ${AVENGERS}     Thor            # Descobrindo o índice através de um valor da lista
    Log To Console  ${index}

Remover Hulk da Lista Com Collections
    ${index_hulk}       Get Index From List     ${AVENGERS}     Hulk            # Descobrindo o índice através de um valor da lista
    Remove From List    ${AVENGERS}             ${index_hulk}
    Log To Console  ''
    Log To Console  ${AVENGERS}

Concatenando Listas
    [Tags]  combinar    
    Log To Console  ''     
    Log To Console  Marvel: ${AVENGERS} 
    Log To Console  DC: ${JUSTICE} 
    
    ${crossover}    Combine Lists      ${AVENGERS}     ${JUSTICE}     # Concatenando listas com "Combine Lists" da library Collections
    Log To Console  Marvel x DC: ${crossover} 
