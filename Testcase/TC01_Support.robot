*** Settings ***
Resource    ../Resources/common_1.robot
Resource    ${CURDIR}${/}..\\Login.robot
Variables    ../Data/data.py

*** Keywords ***
Login into Productor Application
    Verify an application should be opened

When Navigate to Portfolio Management Menu
    Verify a Portfolio Managment Menu should be displayed

Then Click on Create portfolio button, Enter the mandatory details and click on cancel button
    Verify a Save button should be disabled by default and Portfolio shouldn't be created.

Then Click on Create portfolio button and Enter the mandatory details and click on Save button
    Verify a mandatory fields should be entered, a Save should be enabled, a Portfolio should be created

Then Select the checkbox of portfolio
    verify if checkbox of portfolio selected

Then Click on Search bar and search with valid portfolio in the portfolio page
    verify if the search bar should be enabled to search any portfolio and it should display result as per the search input 

Then Click on More icon in portfolio name, Click on Edit button,Enter Data and click on cancel button
    verify if it display edit and delete button as Dropdown, it should display Edit portfolio popup in editable mode , User to enter the data and It should redirect to the Portfolio page     

Then Click on More icon in portfolio name, click on Edit button, Enter the data and click on save button
    verify it should display a dropdown and it should display portfolio popup window in editable mode and save the changes by clicking save button

Then Click on More icon in Portfolio name, click on Delete Button and Click on Cancel Button
    verify if it display edit and delete button as dropdown, It Redirect to the Portfolio Page 

Then Click on More icon in Portfolio name, click on Delete Button and Click on Confirm button    
    verify if it display edit and delete button as dropdown,it Deleted Portfolio should not display in the portfolio page

Then Close the Browser 
    Verify an Application should be closed

Verify an application should be opened
    Login Application    ${username002}

Verify a Portfolio Managment Menu shoduld be displayed
    Wait Until Element is present then click the element    //span[@id="icon-Portfolio Management"]/ancestor::a
    
verify if user able to enter mandatory details in the fields and click the save button and it should added to the list of existing portfolio
    Create Portfolio     test1     test2

Verify a Tool configuration Menu should be displayed
    Wait Until Element is present then click the element        
    
Verify a Portfolio Managment Menu should be displayed
    Wait Until Element is present then click the element    ${BTN_Portfolio_man}

Verify a Save button should be disabled by default and Portfolio shouldn't be created.
    Create Portfolio and cancel    ${TC01_Portfolio_name}     ${TC01_Portfolio_Description1}

Verify a mandatory fields should be entered, a Save should be enabled, a Portfolio should be created
    Create Portfolio and save    ${TC01_Portfolio_name}     ${TC01_Portfolio_Description1}
   
verify if it should not display any result , it display message as " No records to display "    
    Search Portfolio    ${TC01_invalidPortfolio}
    search invalid portfolio

verify if the search bar should be enabled to search any portfolio and it should display result as per the search input 
    Search Portfolio    ${TC01_Portfolio_name}

verify if it display a dropdown with edit and delete button
    click on portfolio more button    ${TC01_Portfolio_name}
    Capture Page Screenshot


verify it should display a dropdown and it should display portfolio popup window in editable mode and save the changes by clicking save button
    click on portfolio more button    ${TC01_Portfolio_name}
    Click on Edit button and click on save button    ${TC01_Portfolio_name}    ${TC01_Portfolio_Description2}
    Capture Page Screenshot

verify if it display edit and delete button as Dropdown, it should display Edit portfolio popup in editable mode , User to enter the data and It should redirect to the Portfolio page     
    verify if it display a dropdown with edit and delete button    
    click on edit button and click on cancel button    ${TC01_Portfolio_name}    ${TC01_Portfolio_Description1}
    Capture Page Screenshot

verify if it display edit and delete button as dropdown, It Redirect to the Portfolio Page 
    verify if it display a dropdown with edit and delete button
    click on delete icon present in the more options    ${TC01_Portfolio_name}    ${BTN_Portfolio_delete_cancel}

verify if it display edit and delete button as dropdown,it Deleted Portfolio should not display in the portfolio page
    verify if it display a dropdown with edit and delete button
    click on delete icon present in the more options    ${TC01_Portfolio_name}    ${BTN_Portfolio_delete_confirm}

     
verify if checkbox of portfolio selected
    Select the checkbox    ${TC01_Portfolio_name}
Verify an Application should be closed
    "Close the Browser"
