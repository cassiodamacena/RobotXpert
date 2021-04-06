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

Field Should Be Number
    [Arguments]         ${element}
    ${attr}             Get Attribute       ${element}     type
    Should Be Equal     ${attr}             number