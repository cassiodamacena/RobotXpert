***Settings***
Documentation   Atualizar alunos

Resource        ${EXECDIR}/resources/base.robot
Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenário: Atualizar Um Aluno Já Cadastrado

    # Recebendo massa de dados de arquivo Json 'students-update.json
    ${fixture}      Get Json    students-update.json

    # Setando a Massa de Teste Pré-Update
    ${aluno_antes}      Set Variable    ${fixture['before']}
    # Setando a Massa de Teste Pós-Update
    ${aluno_depois}     Set Variable    ${fixture['after']}

    Remove Student By Name      ${aluno_antes['name']}
    Remove Student By Name      ${aluno_depois['name']}

    Insert Student      ${aluno_antes}

    Go To Students
    Search Student By Name      ${aluno_antes['name']}
    Go To Student Update Form   ${aluno_antes['name']}
    Update A Student            ${aluno_depois}
    Toaster Text Should Be      Aluno Atualizado com sucesso.

    [Teardown]  Thinking And Take Screenshot  2
