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

    ${name}     Set Variable        Barão Zemo

    Remove Student By Name          ${name}
    Go To Students
    Search Student By Name          ${name}
    Register Should Not Be Found

Cenário: Busca Alunos com Múltiplos Resultados
    [Tags]  json
    # Recebendo arquivos de json e atribuindo a uma variável de texto
    #${file_students_json}       Get File    ${EXECDIR}/resources/fixtures/students-search.json
    
    # Convertendo o texto de file para um Objeto Json
    #${json_object_students}     Evaluate    json.loads($file_students_json)     json

    # Imprindo texto 
    #Log To Console  ${file_students_json}
    
    # Imprindo Json
    #Log To Console  ${json_object_students}

    # Imprimindo Lista do json
    #Log To Console  ${json_object_students['students']}

    ${fixture}                  GET JSON        students-search.json

    ${json_object_students}     Set Variable    ${fixture['students']}

    ${word}      Set Variable    ${fixture['word']}
    ${total}     Set Variable    ${fixture['total']}

    Remove Student By Name      ${word}

    FOR     ${aluno}    IN      @{json_object_students}
        #Log To Console  ${aluno['name']}
        Insert Student  ${aluno}
    END

    Go To Students
    Search Student By Name  ${word}

    FOR     ${aluno}    IN      @{json_object_students}
        Student Name Should Be Visible      ${aluno['name']}
    END

    Total Items Should Be  ${total} 
