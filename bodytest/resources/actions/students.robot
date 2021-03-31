***Settings***
Documentation   Actions para automação do Cadastro de Alunos

***Keywords***
Go To Students
    Click   a[href$=alunos] 
    Wait For Elements State     css=h1 >> text=Gestão de Alunos     visible     5

Go To Form Students
    Click   a[href$="alunos/new"]
    Wait For Elements State     css=h1 >> text=Novo aluno     visible     5

New Student
    [Arguments]     ${name}     ${email}    ${age}  ${weight}   ${feet_tall}
    Fill Text   input[name=name]        ${name}
    Fill Text   input[name=email]       ${email}
    Fill Text   input[name=age]         ${age}
    Fill Text   input[name=weight]      ${weight}
    Fill Text   input[name=feet_tall]   ${feet_tall}
    
    Click       button[type=submit]
    # Click     button[form=formStudent]
    # Click     xpath=//button[contains(text(), "Salvar")]

    # Validação do Step
    Toaster Text Should Be  Aluno cadastrado com sucesso

    [Teardown]      Thinking And Take Screenshot    2