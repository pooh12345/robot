*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${WEB}  https://www.web-dodee.com/project/ecmftp7500-stock-product/
${BROWSER}  chrome
${welcomeadmin}  ยินดีต้อนรับคุณ [ M City ] เข้าระบบ
${welcomecus}  Username หรือ Password ไม่ถูกต้อง
*** Test Cases ***
loginadmin
    loginpage
    login_admin
logininvalid
    loginpage
    login_invalid
*** Keywords ***
loginpage
    Open Browser    ${WEB}  ${BROWSER}
    Page Should Contain    Login
login_admin
     input text  id:txt_user  admin
     input text  id:txt_pass  1234
     click element  xpath://*[@id="form2"]/div[3]/div/button[1]
     Sleep  5s
     ${welcomeadmin}=    Handle Alert    action=ACCEPT
     Close Browser
login_invalid
     input text  id:txt_user  user
     input text  id:txt_pass  1234
     click element  xpath://*[@id="form2"]/div[3]/div/button[1]
     Sleep  5s
     ${welcomecus}=    Handle Alert    action=ACCEPT
     Close Browser

# robot testcase\tc1-1.robot