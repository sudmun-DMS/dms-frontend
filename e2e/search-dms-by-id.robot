*** settings ***
Library     Selenium2Library
*** testcase *** 
search doc id 
    Open Browser    http://localhost:8081/    gc
    Input Text  docID   1
    Click Button   document-search-submit

*** keyword ***

#  custom keyword

