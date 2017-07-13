*** settings ***
Library     Selenium2Library

*** testcase *** 

Input docID = 1 should return "DOC ID = 1 link: = http://file01.txt"
    Open Browser    http://localhost:8081/    gc
    Set Browser Implicit Wait    2 seconds
    Input Text  docID   1
    Click Button   document-search-submit

Input docID = 5 should return "DOC ID NOT FOUND"
    Input Text  docID   5
    Click Button   document-search-submit



#  custom keyword

