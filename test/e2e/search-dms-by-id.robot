*** settings ***
Library     Selenium2Library
Test Teardown    Close Browser

*** Variable ***
${BASE_SERVER}    http://localhost:8080/

*** testcase *** 

Input docID = 1 should return "DOC ID = 1 link: = http://file01.txt"
    [Tags]  feature1
    Open search document
    Search document    1
    Should found document  1

Input docID = 5 should return "DOC ID NOT FOUND"
    [Tags]  feature2
    Open search document
    Search document    5
    Click Button   document-search-submit
    Wait Until Element Contains    id=errorMSG    DOC ID NOT FOUND

Input docID = "" should return "Please Enter DOC ID!!!"
    [Tags]  feature2
    Open search document
    Search document    ${EMPTY}
    Wait Until Element Contains    id=errorMSG    Please Enter DOC ID!!!


#  custom keyword
*** Keywords ***
Should found document
    [Arguments]   ${doc id}
    
    Wait Until Element Is Visible   id=docIdResult
    Wait Until Element Contains    id=docIdResult    DOC ID: = ${doc id}
    Element Text Should Be     status     Status: = RELEASE
    Element Text Should Be     user     User: = SUV
    Element Text Should Be     description     Description: = PMOC
    Element Should Contain     link     http://archive/PMOC

Search document
    [Arguments]   ${doc id}
    Input Text  docID   ${doc id}
    Click Button   document-search-submit

Open search document
    Open Browser    ${BASE_SERVER}    gc