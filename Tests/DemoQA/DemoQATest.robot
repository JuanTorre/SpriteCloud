*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/LandingPagePO.robot
Resource    ../../Resources/ElementsPO.robot
Resource    ../../Resources/AlertsPO.robot

*** Test Cases ***

Open DemoQA Page
    Open Browser   ${url}  ${browser}
    Set Window Size	 1900   1600
    Verify Banner Image is Displayed
    Verify Menu in Landing Page is Displayed
    reload page

Verify Landing Page Menu Navigation is Working
    Navigate to Elements Page
    Verify Elements Page is Displayed
    Click the Header Image
    Navigate to Forms Page
    Verify Forms Page is Displayed
    Click the Header Image
    Navigate to Alerts Page
    Verify Alerts Page is Displayed
    Click the Header Image
    Navigate to Widgets Page
    Verify Widgets Page is Displayed
    Click the Header Image
    Navigate to Interactions Page
    Verify Interactions Page is Displayed
    Click the Header Image
    reload page

Test the Text Box Functionality
    Navigate to Elements Page
    Verify Elements Menu Navigations is Displayed
    Click Elements sub-menu
    Select Text Box from Elements Menu
    Verify Text Box Form is Displayed
    Fill Text Box Form
    Click Submit button
    Verify Form is Submitted
    Click the Header Image
    reload page

Test the Radio Button Functionality
    Navigate to Elements Page
    Verify Elements Menu Navigations is Displayed
    Click Elements sub-menu
    Select Radio Button from Elements Menu
    Select Yes Radio Button
    Select Impressive Radio Button
    Click the Header Image
    reload page

Test Small Modal dialogs
    Navigate to Alerts Page
    Select Modal Dialogs from Alerts menu
    Verify Modal Dialogs are Displayed
    Click on the Small Modal
    Verify Small Modal is Displayed
    Close the Small Modal
    reload page

Test Large Modal dialog
    Verify Modal Dialogs are Displayed
    Click on the Large Modal
    Verify Large Modal is Displayed
    Close the Large Modal
    Click the Header Image
    close browser