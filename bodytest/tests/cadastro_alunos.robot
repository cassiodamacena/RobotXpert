***Settings***
Documentation   Steps para automação do Cadastro de Alunos

Resource        ../resources/base.robot
Suite Setup     Start Admin Session

Library         Collections

***Test Cases***
Novo Aluno

    # Variável simples  ${email}    Set Variable    suelym@bodytest.com

    # "Supervariável" =d Dicionários do Python
    &{student}  Create Dictionary   name=Suelym Viana   email=suelym@bodytest.com  age=30    weight=70     feet_tall=1.65

    # Pré-Condição:
    # 1) Estar logado com usuário com permissão
    # 2) Garantir que email não existe cadastrado
    Remove Student      ${student.email}
    Go To Students
    Go To Form Students    

    # Ações do Step
    New Student  ${student}

    # Validação do Step
    Toaster Text Should Be  Aluno cadastrado com sucesso.

    [Teardown]      Thinking And Take Screenshot    2


Não Deve Permitir Email Duplicado
    [Tags]      dup
    
    &{student}  Create Dictionary   name=NIcolas Damacena   email=nicolas@bodytest.com  age=18    weight=62     feet_tall=1.70

    Insert Student          ${student}
    
    Go To Students
    Go To Form Students
    New Student             ${student}
    Toaster Text Should Be  Email já existe no sistema.
    [Teardown]      Thinking And Take Screenshot    2


Todos os Campos Devem Ser Obrigatórios
    [Tags]      temp

    @{expected_alerts}      Set Variable        Nome é obrigatório   O e-mail é obrigatório     idade é obrigatória     o peso é obrigatório    a Altura é obrigatória

    Go To Students
    Go To Form Students
    Submit Student Form

    # Validando mensagens de campo obrigatório 1 a 1
    #Alert Text Should Be    Nome é obrigatório
    #Alert Text Should Be    O e-mail é obrigatório
    #Alert Text Should Be    idade é obrigatória
    #Alert Text Should Be    o peso é obrigatório
    #Alert Text Should Be    a Altura é obrigatória

    # Validando mensages por Listas e FOR
    #FOR     ${aler}     IN      @{expected_alerts}
    #    Alert Text Should Be    ${aler} 
    #END

    # Armazenando resultado de cada validação em uma lista vazia
    @{got_alerts}           Create List     # Criando lista vazia para adicionar
    
    FOR     ${index}    IN RANGE    1   6
       ${alert}         Get Required Alerts     ${index}
       Append To List   ${got_alerts}           ${alert}
    END

    Log      ${expected_alerts}
    Log      ${got_alerts}

    Lists Should Be Equal  ${expected_alerts}  ${got_alerts}

    Take Screenshot