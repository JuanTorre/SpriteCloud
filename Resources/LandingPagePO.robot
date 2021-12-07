*** Settings ***
Library     SeleniumLibrary

*** Variables ***

#Browser settings

${browser}  chrome
${url}  https://demoqa.com/

#landing page

${header_image}    //header/a[1]/img[1]
${banner_image}    //img[@class="banner-image"]
${menu_elements}   //h5[contains(text(),'Elements')]
${menu_forms}   //h5[contains(text(),'Forms')]
${menu_alerts}   //h5[contains(text(),'Alerts, Frame & Windows')]
${menu_widgets}   //h5[contains(text(),'Widgets')]
${menu_interactions}   //h5[contains(text(),'Interactions')]
${menu_book}   //h5[contains(text(),'Book Store Application')]

#forms page
${forms_header}  //div[@class="main-header"][contains(text(),'Forms')]

#alerts page
${alerts_header}  //div[@class="main-header"][contains(text(),'Alerts, Frame & Windows')]

#widgets page
${widgets_header}  //div[@class="main-header"][contains(text(),'Widgets')]

#interactions page
${interactions_header}  //div[@class="main-header"][contains(text(),'Interactions')]

*** Keywords ***

#keywords landing page

Verify Banner Image is Displayed
    wait until element is visible  ${banner_image}
    wait until element is enabled  ${banner_image}
    sleep  2s

Verify Menu in Landing Page is Displayed
    wait until element is visible  ${banner_image}
    wait until element is visible  ${menu_elements}
    wait until element is visible  ${menu_forms}
    wait until element is visible  ${menu_alerts}
    wait until element is visible  ${menu_widgets}
    wait until element is visible  ${menu_interactions}
    wait until element is visible  ${menu_book}
    sleep  3s

Click the Header Image
    wait until element is enabled  ${header_image}
    click element  ${header_image}
    sleep  2s

#keywords forms page

Navigate to Forms Page
    wait until element is enabled  ${menu_forms}
    click element   ${menu_forms}
    sleep  2s

Verify Forms Page is Displayed
    wait until element is visible  ${forms_header}
    sleep  2s

#keywords alerts page

Navigate to Alerts Page
    wait until element is enabled  ${menu_alerts}
    click element   ${menu_alerts}
    sleep  2s

Verify Alerts Page is Displayed
    wait until element is visible  ${alerts_header}
    sleep  2s

#keywords widgets page

Navigate to Widgets Page
    wait until element is enabled  ${menu_widgets}
    click element   ${menu_widgets}
    sleep  2s

Verify Widgets Page is Displayed
    wait until element is visible  ${widgets_header}
    sleep  2s

#keywords interactions page

Navigate to Interactions Page
    wait until element is enabled  ${menu_interactions}
    click element   ${menu_interactions}
    sleep  2s

Verify Interactions Page is Displayed
    wait until element is visible  ${interactions_header}
    sleep  2s