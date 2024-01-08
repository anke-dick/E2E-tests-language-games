*** Settings ***
Library  OperatingSystem
Library  SeleniumLibrary
Resource    ../page-objects/wikipedia-common/wikipedia-language-picker.resource



*** Variables ***
#Unicode text examples in verschiedenen Sprachen,
#vielleicht aus der yaml einlesen oder so.
# ToDo: (nice to have)
#url_list

${google_URL}=    https://www.google.de/?hl=de
${wikipedia_URL_caha}=    https://mr.wikipedia.org/wiki/%E0%A4%9A%E0%A4%B9%E0%A4%BE
${screenshot_name_caha}=    caha_mr.png
#=====
${wikipedia_URL_apple}=    https://en.wikipedia.org/wiki/Apple
${wikipedia_URL_seb}=    https://hi.wikipedia.org/wiki/%E0%A4%B8%E0%A5%87%E0%A4%AC
${screenshot_name_seb_hi}=    seb_hi.png
${screenshot_name_seb_ur}=    seb_ur.png
#${wiktionary_URL}=    https://www.google.de/?hl=de


# import via yaml or create a local dictionary with it here
${lang_marathi}=    Marathi
${lang_hindi}=    Hindi
${lang_urdu}=    Urdu

*** Keywords ***
Init Tests
    Log To Console    Test initialized
#    Set Screenshot directory   todo


*** Test Cases ***
Zweiter Testfall: Test open browser for url caha and change language
    #[Setup]    Init Tests
    #[Teardown]    Sleep    10 sec   #3 min
    Open Browser    ${wikipedia_URL_caha}    chrome
    Capture Page Screenshot    ${screenshot_name_caha}
    #Wikipedia list all available languages for this page
    #Change language in wikipedia to ${lang_marathi}
    Wikipedia change language to hi

Dritter Testfall: Test open browser for url seb and count languages
    #[Setup]    Init Tests
    #[Teardown]    Sleep    10 sec   #3 min
    Open Browser    ${wikipedia_URL_seb}    chrome
    Capture Page Screenshot    ${screenshot_name_seb_hi}
    #Wikipedia list all available languages for this page
    #Change language in wikipedia to ${lang_marathi}
    Wikipedia change language to ur
    Capture Page Screenshot    ${screenshot_name_seb_ur}
    Wikipedia List All Available Languages For This Page