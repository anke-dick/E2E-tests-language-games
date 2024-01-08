*** Settings ***
Library    SeleniumLibrary
Library    Collections


*** Variables ***
#<div id="p-lang-btn" class="vector-dropdown mw-portlet mw-portlet-lang">
 #	<input type="checkbox" id="p-lang-btn-checkbox" role="button" 
 #aria-haspopup="true" data-event-name="ui.dropdown-p-lang-btn"
${xpath_language_picker_wikipedia}=    //div[@id="p-lang-btn"]
#/input[@type="checkbox" and @id="p-lang-btn-checkbox"]
${xpath_language_block}=   todo

#<li title="मराठी" 
#data-code="mr" 
#class="interlanguage-link interwiki-mr mw-list-item">
#<a class="autonym" lang="mr" dir="ltr" 
#href="https://mr.wikipedia.org/wiki/%E0%A4%9A%E0%A4%B9%E0%A4%BE" 
#title="चहा – Marathi" hreflang="mr">मराठी</a></li>

${xpath_language_list_item}=    //li[contains(@class,"interlanguage-link") and 
...    contains(@class,"mw-list-item")]

*** Keywords ***
_Click language picker open
    ${text}=    Get Text    ${xpath_language_picker_wikipedia}
    Log     other languages "${text}"    console=yes
    Click Element    ${xpath_language_picker_wikipedia}
    Capture Page Screenshot

#${isAnyVisible}=    Run Keyword And Return Status
    #...    Element Should Be Visible    ${xpath_language_list_item}
    #Log    is visible = ${isAnyVisible}
    #Run Keyword If    "${TRUE}" != "${isAnyVisible}"
    #...    Scroll Element Into View    ${xpath_language_list_item}
    #Capture Page Screenshot
    #${res_lang_name}=    Get Text    ${xpath_language_list_item}
    #${res_lang_code}=    Get Element Attribute    ${xpath_language_list_item}    data-code
    #Log    First Element ${res_lang_code} found with text ${res_lang_name}


_Select language ${language_code}
    Element Should Be Visible    ${xpath_language_list_item}
    ${xpath_specific_item} =    Set Variable
    ...    ${xpath_language_list_item}/a[@lang="${language_code}"]
    Scroll Element Into View    ${xpath_specific_item}
    Click Element    ${xpath_specific_item}

_List all available languages
    [Documentation]    see [link](https://stackoverflow.com/questions/53768056/iterate-through-web-elements-with-selenium-and-robot-framework)
    Element Should Be Visible    ${xpath_language_list_item}
    ${xpath_specific_item} =    Set Variable
    ...    ${xpath_language_list_item}
    ${num_of_lang}=    Get Element Count    ${xpath_specific_item}
    #datentypen &{array}  @{list}
    @{list}=    Get Webelements    ${xpath_specific_item}
    @{response_list}=    Create List
    #@{list_of_known_states} =    ACCOUNT_ACTIVATED    ACCOUNT_PREOVISIONED    ACCOUNT_DELETED

    FOR    ${obj}    IN    @{list}
        #Log    ${obj.text}    #console=yes
        #${language_name}=   Get Text    ${obj}
        #Log To Console    ${language_name}
        Append To List    ${response_list}    ${obj.text}
    END
    #log variables
    Log many     @{response_list}
    [Return]    @{response_list}

#    Scroll Element Into View    ${xpath_specific_item}
#    Click Element    ${xpath_specific_item}

Wikipedia change language to ${language_code}
    _Click language picker open
    _Select language ${language_code}

Wikipedia list all available languages for this page
    _Click language picker open
    #&{result}=
    _List all available languages
    [Return]    Chinesisch
#<div id="p-lang-btn" class="vector-dropdown mw-portlet mw-portlet-lang">
#	<input type="checkbox" id="p-lang-btn-checkbox" role="button" aria-haspopup="true" data-event-name="ui.dropdown-p-lang-btn"

#Change language in wikipedia to ${language}