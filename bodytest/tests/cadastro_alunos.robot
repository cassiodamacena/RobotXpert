***Settings***
Documentation   Steps para automação do Cadastro de Alunos

Resource        ../resources/base.robot
Suite Setup     Start Browser Session

***Test Cases***
Novo Aluno
    # Pré-Condição: estar logado com usuário com permissão
    Go To Login Page
    Login With                 admin@bodytest.com  pwd123

    User Should Be Logged In    Administrador

    Go To Students
    Go To Form Students    

    # Ações do Step
    New Student  Suelym Viana  suelym@hotmail.com  30  70  1.65