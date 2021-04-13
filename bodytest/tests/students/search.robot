***Settings***
Documentation   Buscar alunos por nome

Resource        ${EXECDIR}/resources/base.robot
Suite Setup     Start Admin Session
Test Teardown   Take Screenshot

***Test Cases***
Cenário: Busca Exata
# "Supervariável" =d Dicionários do Python
    &{student}  Create Dictionary   name=Steve Jobs   email=jobs@apple.com  age=45    weight=80     feet_tall=1.8

    Remove Student By Name          ${student.name}
    Insert Student                  ${student}
    Go To Students
    Search Student By Name          ${student.name}
    Student Name Should Be Visible  ${student.name}
    Total Items Should Be           1

Cenário: Registro Não Encontrado
    Remove Student By Name          Barão Zemo
    Go To Students
    Search Student By Name          Barão Zemo
    Register Should Not Be Found