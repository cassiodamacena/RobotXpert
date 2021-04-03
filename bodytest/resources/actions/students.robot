***Settings***
Documentation   Actions para automação do Cadastro de Alunos

***Keywords***
Go To Form Students
    Click   a[href$="alunos/new"]
    Wait For Elements State     css=h1 >> text=Novo aluno     visible     5

New Student
    # Variável Simples
    #[Arguments]     ${name}     ${email}    ${age}  ${weight}   ${feet_tall}

    [Arguments]     ${student}  #Dicionário de dados

    Fill Text   input[name=name]        ${student.name}
    Fill Text   input[name=email]       ${student.email}
    Fill Text   input[name=age]         ${student.age}
    Fill Text   input[name=weight]      ${student.weight}
    Fill Text   input[name=feet_tall]   ${student.feet_tall}
    
    Click       button[type=submit]
    # Click     button[form=formStudent]
    # Click     xpath=//button[contains(text(), "Salvar")]

    # Validação do Step
    Toaster Text Should Be  Aluno cadastrado com sucesso

    [Teardown]      Thinking And Take Screenshot    2
