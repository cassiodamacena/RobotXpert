***Settings***
Documentation   Steps para automação do Cadastro de Alunos

Resource        ../resources/base.robot
Suite Setup     Start Admin Session

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
