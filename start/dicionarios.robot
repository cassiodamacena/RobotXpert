***Settings***
Documentation   Conhecendo os Dicionário do Robot (Nativo do Python)

***Variables***
${SIMPLES}          Cassio                                              # Definição de variável simples
@{LISTA_CARROS}     Chevette    Opala   Camaro  Mustang                 # Definição de variável de Lista
&{CARRO}            nome=Chevette   hp=1500     portas=2    cor=Marrom  # Definição de variável de dicioário de dados Chave=Valor

**Test Cases***
Obtendo valores de um dicionário
    Log To Console  ''
    Log To Console  ${CARRO}                  #Imprimindo todo o dicionário definido na variável &{CARRO}
    Log To Console  Carro : ${CARRO.nome}     #Imprimindo somente o valor da chave NOME
    Log To Console  Potência: ${CARRO.hp}     #Imprimindo somente o valor da chave HP
    Log To Console  Cor : ${CARRO.cor}        #Imprimindo somente o valor da chave COR