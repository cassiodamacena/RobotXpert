***Settings***
Documentation       Ações de componentes genéricos

***Keywords***
Toaster Text Should Be
    [Arguments]                 ${expected_text}
    Wait For Elements State     css=.Toastify__toast-body >> text=${expected_text}    visible     15 

Alert Text Should Be
    [Arguments]                 ${expected_text}
    Wait For Elements State     css=form span >> text=${expected_text}     visible     15 

Get Required Alerts
    [Arguments]     ${index}
    ${alert}        Get Text        xpath=(//form//span)[${index}]
    [Return]        ${alert}

Field Should Be Type
    [Arguments]         ${element}          ${type}

    ${attr}             Get Attribute       ${element}     type
    Should Be Equal     ${attr}             ${type}

Register Should Not Be Found
    Wait For Elements State     css=div >> text=Nenhum registro encontrado.
    Wait For Elements State     css=table           detached    5

Total Items Should Be
    [Arguments]     ${quantidade}

    ${element}      Set Variable    css=#pagination .total

    Wait For Elements State     ${element}  Visible     5
    Get Text                    ${element}  ==          Total: ${quantidade}