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