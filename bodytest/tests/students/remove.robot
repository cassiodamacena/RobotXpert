***Settings***
Documentation   Remover alunos

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenário: Remover Aluno Cadastrado
    [Tags]  Remover
    &{student}  Create Dictionary   name=Jefferson   email=jefferson@bodytest.com  age=14    weight=55     feet_tall=1.45
    Insert Student                  ${student}
    
    Go To Students
    Search Student By Name      ${student.name}
    Request Removal By Email    ${student.email}
    Confirm Removal

    Toaster Text Should Be      Aluno removido com sucesso.
    
    [Teardown]  Thinking And Take Screenshot  2

    Student Should Not Visible  ${student.email}


Cenário: Desistir da Exclusão
   
    &{student}  Create Dictionary   name=Ivina Damacena   email=ivina@bodytest.com  age=14    weight=55     feet_tall=1.45
    Insert Student                  ${student}
    
    Go To Students
    #Reload      #KW para recarregar a página, porém é melhor alterar "Test Setup" no lugar de Suit Setup

    Search Student By Name      ${student.name}
    Request Removal By Email    ${student.email}
    Cancel Removal
    Student Should Be Visible   ${student.email}
