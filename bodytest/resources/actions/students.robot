***Settings***
Documentation   Actions para automação do Cadastro de Alunos

***Variables***
${FIELD_NAME}       css=input[name=name]
${FIELD_EMAIL}      css=input[name=email]
${FIELD_AGE}        css=input[name=age] 
${FIELD_WEIGTH}     css=input[name=weight]
${FIELD_FEET_TALL}  css=input[name=feet_tall]

***Keywords***
Go To Form Students
    Click   a[href$="alunos/new"]
    Wait For Elements State     css=h1 >> text=Novo aluno     visible     5

Submit Student Form
    Click       button[type=submit]

New Student
    # Variável Simples
    #[Arguments]     ${name}     ${email}    ${age}  ${weight}   ${feet_tall}

    [Arguments]     ${student}  #Dicionário de dados

    Fill Text   ${FIELD_NAME}        ${student.name}
    Fill Text   ${FIELD_EMAIL}       ${student.email}
    Fill Text   ${FIELD_AGE}         ${student.age}
    Fill Text   ${FIELD_WEIGTH}      ${student.weight}
    Fill Text   ${FIELD_FEET_TALL}   ${student.feet_tall}
    
    Submit Student Form

    # Click     button[form=formStudent]
    # Click     xpath=//button[contains(text(), "Salvar")]

    # Validação do Step
    #Toaster Text Should Be  Aluno cadastrado com sucesso

    #[Teardown]      Thinking And Take Screenshot    2

Request Removal By Email
    [Arguments]     ${email}
    Click           xpath=//td[contains(text(), "${email}")]/../td//button[@id="trash"]

Confirm Removal
    Click           text=SIM, pode apagar!

Student Should Not Visible
    [Arguments]     ${email}
    Wait For Elements State           xpath=//td[contains(text(), "${email}")]/../td//button[@id="trash"]   detached    5

Cancel Removal
    Click           text=NÃO

Student Should Be Visible
    [Arguments]     ${email}
    Wait For Elements State           xpath=//td[contains(text(), "${email}")]/../td//button[@id="trash"]   visible    5