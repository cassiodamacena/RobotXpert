***Settings***
Documentation   Exemplos de variáveis

***Variables***
${NOME_COMPLETO}    Cassio Damacena         # VAriável globol, porém, não pode ser utilizada para receber valores por métodos

***Test Cases***
Exemplo 01
    ${nome}     Set Variable    Cassio      # Declaração de uma variável local 
                                            # Neste só pode ser utiliza no escopo deste caso de teste "Exemplo 01"
    ${sobrenome}    Set Variable    Damacena
    Set Suite Variable   ${sobrenome}       # Declara uma variável local do case teste como global para toda a Suite de testes

    Log To Console  ${nome}
    Log To Console  ${NOME_COMPLETO}        # Variável global chamanda nos dois testes Case

Exemplo 02
   # Log To Console  ${nome}            # Impressão de Log da veriável em escopo diferente vai gerar erro "Variable not found."
    Log To Console  ${sobrenome}        # Variável de escopo global (vai passar os dois testes)
    Log To Console  ${NOME_COMPLETO}    # Variável global chamanda nos dois testes Case