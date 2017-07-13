*** settings ***
Library     Selenium2Library

*** Variable ***
${BASE_SERVER}    http://localhost:8081/

*** testcase *** 

Input docID = 1 should return "DOC ID = 1 link: = http://file01.txt"
    Open Browser    ${BASE_SERVER}    gc
    Set Browser Implicit Wait    2 seconds
    Input Text  docID   1
    Click Button   document-search-submit
    Element Text Should Be     docIdResult     DOC ID: = 1
    Element Text Should Be     status     Status: = RELEASE
    Element Text Should Be     user     User: = SUV
    Element Text Should Be     description     Description: = PMOC
    Element Should Contain     link     http://archive/PMOC

Input docID = 5 should return "DOC ID NOT FOUND"
    Clear Element Text  docID
    Input Text  docID   5
    Click Button   document-search-submit
    Element Text Should Be     errorMSG    DOC ID NOT FOUND



#  custom keyword