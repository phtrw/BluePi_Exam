*** Settings ***
Documentation    BluePi QA Challenge
Library    Selenium2Library
Library    BuiltIn
Library    String
Library    Dialogs

#Test Setup    Open Browser    https://abhigyank.github.io/To-Do-List/    chrome
Test Setup    Open Browser and Maximize
Test Teardown    Close browser
Suite Teardown    End All Test Process

*** Variables ***
${1st_todo}    1st Cooking
${2nd_todo}    2nd Eating
${3rd_todo}    3rd Sleeping

*** Keywords ***
Open Browser and Maximize
    Open Browser    https://abhigyank.github.io/To-Do-List/    chrome
    Maximize Browser Window

End All Test Process
    Pause Execution    End To-Do List Test


*** Test Cases ***
TC001-Add Item To-Do list
    #Open Browser    https://abhigyank.github.io/To-Do-List/    chrome
    #Maximize Browser Window
#1st To-do
    Wait Until Page Contains Element    //*[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]    10s
    Input Text       //input[@id="new-task"]    ${1st_todo}

    Sleep    3S

    Wait Until Page Contains Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]    10s
    Click Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]

    #2nd To-do
    Sleep    3S
    Wait Until Page Contains Element    //*[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]    10s
    Input Text       //input[@id="new-task"]    ${2nd_todo}

    Sleep    3S

    Wait Until Page Contains Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]    10s
    Click Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]

    #3rd To-do
    Sleep    3S
    Wait Until Page Contains Element    //*[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]    10s
    Input Text       //input[@id="new-task"]    ${3rd_todo}

    Sleep    3S

    Wait Until Page Contains Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]    10s
    Click Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]
   
    Pause Execution    End TC001-Add Item To-Do list
     
TC002-Have Done One To-Do Tasks
    Wait Until Page Contains Element    //*[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]    10s
    Input Text       //input[@id="new-task"]    ${1st_todo}

    Sleep    3S

    Wait Until Page Contains Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]    10s
    Click Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]

    #2nd To-do
    Sleep    3S
    Wait Until Page Contains Element    //*[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]    10s
    Input Text       //input[@id="new-task"]    ${2nd_todo}

    Sleep    3S

    Wait Until Page Contains Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]    10s
    Click Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]

    #3rd To-do
    Sleep    3S
    Wait Until Page Contains Element    //*[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]    10s
    Input Text       //input[@id="new-task"]    ${3rd_todo}

    Sleep    3S

    Wait Until Page Contains Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]    10s
    Click Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]
   
    #TAB:TO-DO Tasks
    Sleep    5S
    Wait Until Page Contains Element    //*[@class="mdl-tabs__tab is-active"]    10s
    Click Element    //a[contains(normalize-space(),"To-Do Tasks")] 

    Sleep    5S
    Wait Until Page Contains    ${1st_todo}    10s
    #1st Cooking = Done
    Click Element    //*[@class="mdl-checkbox__label" and @id="text-1"]
    #TAB:Completed
    Sleep    3S
    Click Element    //a[contains(normalize-space(),"Completed")]
    
    
    Pause Execution    End TC002-Have Done One To-Do Tasks

TC003-Delete One To-Do Tasks
    Wait Until Page Contains Element    //*[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]    10s
    Input Text       //input[@id="new-task"]    ${1st_todo}

    Sleep    3S

    Wait Until Page Contains Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]    10s
    Click Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]

    #2nd To-do
    Sleep    3S
    Wait Until Page Contains Element    //*[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]    10s
    Input Text       //input[@id="new-task"]    ${2nd_todo}

    Sleep    3S

    Wait Until Page Contains Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]    10s
    Click Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]

    #3rd To-do
    Sleep    3S
    Wait Until Page Contains Element    //*[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]    10s
    Input Text       //input[@id="new-task"]    ${3rd_todo}

    Sleep    3S

    Wait Until Page Contains Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]    10s
    Click Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]
   
    #TAB:TO-DO Tasks
    Sleep    5S
    Wait Until Page Contains Element    //*[@class="mdl-tabs__tab is-active"]    10s
    Click Element    //a[contains(normalize-space(),"To-Do Tasks")]

    #Deleted Test
    Sleep    3S
    Wait Until Page Contains Element    //button[contains(normalize-space(),"Delete")]    10s
    Click Element    //button[@class="mdl-button mdl-js-button mdl-js-ripple-effect delete" and @id="1"]
    
    #TAB:Completed
    Sleep    3S
    Click Element    //a[contains(normalize-space(),"Completed")]

    Pause Execution    End TC003-Delete One To-Do Tasks

TC004-Delete One Item On Tab Completed
    Wait Until Page Contains Element    //*[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]    10s
    Input Text       //input[@id="new-task"]    ${1st_todo}

    Sleep    3S

    Wait Until Page Contains Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]    10s
    Click Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]

    #2nd To-do
    Sleep    3S
    Wait Until Page Contains Element    //*[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]    10s
    Input Text       //input[@id="new-task"]    ${2nd_todo}

    Sleep    3S

    Wait Until Page Contains Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]    10s
    Click Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]

    #3rd To-do
    Sleep    3S
    Wait Until Page Contains Element    //*[@class="mdl-tabs__ripple-container mdl-js-ripple-effect"]    10s
    Input Text       //input[@id="new-task"]    ${3rd_todo}

    Sleep    3S

    Wait Until Page Contains Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]    10s
    Click Element    //button[@class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored"]
   
    #TAB:TO-DO Tasks
    Sleep    5S
    Wait Until Page Contains Element    //*[@class="mdl-tabs__tab is-active"]    10s
    Click Element    //a[contains(normalize-space(),"To-Do Tasks")] 

    Sleep    5S
    Wait Until Page Contains    ${1st_todo}    10s
    #1st Cooking = Done
    Click Element    //*[@class="mdl-checkbox__label" and @id="text-1"]
    #TAB:Completed
    Sleep    3S
    Click Element    //a[contains(normalize-space(),"Completed")]


    #Test Delete in TAB:Completed  (1st Cooking)
    Wait Until Page Contains Element    //button[contains(normalize-space(),"Delete")]    10s
    Click Element    //ul[@id="completed-tasks" and @class="mdl-list"]//button[@class="mdl-button mdl-js-button mdl-js-ripple-effect delete" and @id="1"]

    #Go Back To #TAB:TO-DO Tasks 
    Sleep   3S
    Click Element    //a[contains(normalize-space(),"To-Do Tasks")]
       
    Pause Execution    End TC004-Delete One Item On Tab Completed