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

    Click   a[href$=alunos]

    Wait For Elements State     css=h1 >> text=Gestão de Alunos     visible     5

    Click   a[href$="alunos/new"]

    Wait For Elements State     css=h1 >> text=Novo aluno     visible     5

    # Ações do Step
    Fill Text   input[name=name]        Suelym Viana
    Fill Text   input[name=email]       suelym@hotmail.com
    Fill Text   input[name=age]         30
    Fill Text   input[name=weight]      70
    Fill Text   input[name=feet_tall]   1.65
    
    Click       button[type=submit]
    # Click     button[form=formStudent]
    # Click     xpath=//button[contains(text(), "Salvar")]

    # Validação do Step
    Toaster Text Should Be  Aluno cadastrado com sucesso

    [Teardown]      Thinking And Take Screenshot    2