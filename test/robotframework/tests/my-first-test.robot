
*** Variables ***

${some_scalar_number}=    ${13}
${some_scalar_boolean}=    ${TRUE}

# ${EMPTY} and other fancy constants in robot .... ToDo

${some_scalar_string}=    Dies ist ein wundervoller multiline Text.
...    Dieser Text geht hier weiter.

${another_multiline_string}    SEPARATOR=    
...    Anfangstext ist ${some_scalar_boolean},
...    hier kommt die Mitte,
...    und jetzt endlich das Ende hier ${some_scalar_number}.

${a_third_multiline_string}    SEPARATOR=\|
...    Teil 1
...    Teil 2
...    und nun der dritte Teil

# an array/list of things
#a dictionary/object
#some dictionary structure
#some data import from a nice yaml

*** Test Cases ***
Test Logging
    [Documentation]    Hier kommt dann die super fancy documentation hin.
    ...    Diese kann auch multiline sein und Variablen beinhalten, 
    ...    wie zum Beispiel die folgenden:
    ...    - ${some_scalar_number}
    ...    - ${some_scalar_boolean}
    ...    - ${some_scalar_string}
    Log    Hallo World
    Log To Console    Dies schreibt auf die Console.
    Log    Und dies schreibt sowohl auf die Console als auch in die report.xml
    ...    console=yes
    Log    Dies ist ein ${some_scalar_boolean} Logeintrag.
    ...    console=yes
    Log To Console    ${some_scalar_string}
    Log Many    aaaaa    bc d e f    ${3} + ${4} = ${3+4}    usw.
    Log    ${another_multiline_string}    DEBUG    console=yes
    Log    ${a_third_multiline_string}    WARN    console=yes


