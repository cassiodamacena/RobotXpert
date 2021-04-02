***Settings***
Documentation   Steps para automação do Cadastro de Alunos

Resource        ../resources/base.robot
Suite Setup     Start Admin Session

***Test Cases***
Novo Aluno
    # Pré-Condição:
    # 1) Estar logado com usuário com permissão
    # 2) Garantir que email não existe cadastrado
    Remove Student      suelym@bodytest.com
    Go To Students
    Go To Form Students    

    # Ações do Step
    New Student  Suelym Viana  suelym@bodytest.com  30  70  1.65
