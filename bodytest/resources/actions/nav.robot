***Settings***
Documentation       Ações do menu superior de navegação

***Keywords***
User Should Be Logged In
    [Arguments]     ${user_name}
    Get Text        css=aside strong    equal   ${user_name}

Go To Students
    Click   a[href$=alunos] 
    Wait For Elements State     css=h1 >> text=Gestão de Alunos     visible     5
