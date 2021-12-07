*** Settings ***
Library     SeleniumLibrary
Resource    ElementsPO.robot

*** Variables ***

#alerts menu interaction

${elements_modal_dialogs}   //span[contains(text(),'Modal Dialogs')]
${modal_dialogs_title}   //div[contains(text(),'Modal Dialogs')]
${modals_instructions}   //div[contains(text(),'Click on button to see modal')]
${smallmodal_button}   //button[@id='showSmallModal']
${smallmodal_title}   //div[@id='example-modal-sizes-title-sm']
${smallmodal_text}   //div[contains(text(),'This is a small modal. It has very less content')]
${smallmodal_close_button}   //button[@id='closeSmallModal']
${largemodal_button}   //button[@id='showLargeModal']
${largemodal_title}   //div[@id='example-modal-sizes-title-lg']
${largemodal_text}   //p[contains(text(),'Lorem Ipsum is simply dummy text of the printing a')]
${largemodal_close_button}   //button[@id='closeLargeModal']

*** Keywords ***

Click Alers, Frame & Windows menu
    scroll element into view  ${alerts_menu}
    wait until element is enabled  ${alerts_menu}
    click element  ${alerts_menu}
    sleep  2s

Select Modal Dialogs from Alerts menu
    wait until element is visible  ${elements_modal_dialogs}
    scroll element into view  ${elements_modal_dialogs}
    wait until element is enabled  ${elements_modal_dialogs}
    click element  ${elements_modal_dialogs}
    sleep  2s

Verify Modal Dialogs are Displayed
    wait until element is enabled  ${modal_dialogs_title}
    wait until element is enabled  ${modals_instructions}

Click on the Small Modal
    wait until element is enabled  ${smallmodal_button}
    click element  ${smallmodal_button}
    sleep  2s

Verify Small Modal is Displayed
    wait until element is visible  ${smallmodal_title}
    wait until element is visible  ${smallmodal_text}

Close the Small Modal
    wait until element is enabled  ${smallmodal_close_button}
    click element  ${smallmodal_close_button}
    sleep  2s
    wait until page does not contain element  ${smallmodal_title}
    wait until page does not contain element  ${smallmodal_text}

Click on the Large Modal
    wait until element is enabled  ${largemodal_button}
    click element  ${largemodal_button}
    sleep  2s

Verify Large Modal is Displayed
    wait until element is visible  ${largemodal_title}
    wait until element is visible  ${largemodal_text}

Close the Large Modal
    wait until element is enabled  ${largemodal_close_button}
    click element  ${largemodal_close_button}
    sleep  2s
    wait until page does not contain element  ${largemodal_title}
    wait until page does not contain element  ${largemodal_text}