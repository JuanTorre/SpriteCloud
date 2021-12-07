*** Settings ***
Library     SeleniumLibrary
Resource    LandingPagePO.robot

*** Variables ***

#elements page

${elements_header}  //div[@class="main-header"][contains(text(),'Elements')]
${elements_instructions}     //div[contains(text(),'Please select an item from left to start practice.')]
${elements_menu}   //div[@class="header-text"][contains(text(),'Elements')]
${alerts_menu}   //div[@class="header-text"][contains(text(),'Alerts, Frame & Windows')]
${widgets_menu}   //div[@class="header-text"][contains(text(),'Widgets')]

#elements menu interaction

${elements_textbox}    //span[contains(text(),'Text Box')]
${elements_radiobutton}   //span[contains(text(),'Radio Button')]
${radiobutton_title}    //div[contains(text(),'Radio Button')]
${textbox_title}    //div[contains(text(),'Text Box')]
${label_username}   //label[@id='userName-label']
${field_username}   //input[@id='userName']
${label_useremail}   //label[@id='userEmail-label']
${field_useremail}   //input[@id='userEmail']
${label_address}   //label[@id='currentAddress-label']
${field_address}   //textarea[@id='currentAddress']
${label_permaddress}   //label[@id='permanentAddress-label']
${field_permaddress}   //textarea[@id='permanentAddress']
${submit_button}   //button[@id='submit']
${yes_button}  //label[contains(text(),'Yes')]
${impressive_button}   //label[contains(text(),'Impressive')]

#test values

${name}     Juan Torre
${email}    test@mail.com
${current_address}  tester street 140-b
${permanent adress}  tester avenue 1520

*** Keywords ***

Navigate to Elements Page
    wait until element is enabled  ${menu_elements}
    click element   ${menu_elements}
    sleep  2s

Verify Elements Page is Displayed
    wait until element is visible  ${elements_header}
    wait until element is visible  ${elements_instructions}
    sleep  2s

Verify Elements Menu Navigations is Displayed
    wait until element is visible  ${elements_menu}
    wait until element is visible  ${alerts_menu}
    wait until element is visible  ${widgets_menu}
    sleep  3s

Click Elements sub-menu
    wait until element is enabled  ${elements_menu}
    click element  ${elements_menu}
    wait until element is visible  ${elements_textbox}

Select Text Box from Elements Menu
    wait until element is enabled  ${elements_textbox}
    click element  ${elements_textbox}
    wait until element is visible  ${textbox_title}

Select Radio Button from Elements Menu
    wait until element is enabled  ${elements_radiobutton}
    click element  ${elements_radiobutton}
    wait until element is visible  ${radiobutton_title}

Verify Text Box Form is Displayed
    wait until element is enabled  ${label_username}
    wait until element is enabled  ${label_useremail}
    wait until element is enabled  ${label_address}
    wait until element is enabled  ${label_permaddress}
    wait until element is visible  ${submit_button}
    sleep  3s

Fill Text Box Form
    wait until element is enabled  ${field_username}
    click element  ${field_username}
    input text  ${field_username}   ${name}
    sleep  1s
    wait until element is enabled  ${field_useremail}
    click element  ${field_useremail}
    input text  ${field_useremail}  ${email}
    sleep  1s
    wait until element is enabled  ${field_address}
    click element  ${field_address}
    input text  ${field_address}    ${current_address}
    sleep  1s
    wait until element is enabled  ${field_permaddress}
    click element  ${field_permaddress}
    input text  ${field_permaddress}    ${permanent adress}
    sleep  1s
    wait until element is enabled  ${submit_button}

Click Submit button
    click element  ${submit_button}
    sleep  2s

Verify Form is Submitted
    wait until element is enabled  //p[@id='name']
    wait until element is enabled  //p[@id='email']
    wait until element is enabled  //p[@id='currentAddress']
    wait until element is enabled  //p[@id='permanentAddress']
    sleep  2s

Select Yes Radio Button
    wait until element is enabled  ${yes_button}
    click element  ${yes_button}
    ${yes_selected}=  set variable  Yes
    wait until page contains element  //span[contains(text(),'${yes_selected}')]
    sleep  2s

Select Impressive Radio Button
    wait until element is enabled  ${impressive_button}
    click element  ${impressive_button}
    ${impressive_selected}=  set variable  Impressive
    wait until page contains element  //span[contains(text(),'${impressive_selected}')]
    sleep  2s