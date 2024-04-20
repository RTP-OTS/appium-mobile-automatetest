*** Settings ***
Library    AppiumLibrary


*** Variables ***
${APPIUM_SERVER}          http://0.0.0.0:4723/wd/hub
${PLATFORM_VERSION}       14
${PLATFORM_NAME}          Android
${DEVICE_NAME}            emulator-5554
${APP_PACKAGE}            com.avjindersinghsekhon.minimaltodo
${APP_ACTIVITY}           com.example.avjindersinghsekhon.toodle.MainActivity
${AUTOMATION_NAME}        UiAutomator2
${AVD}                    Pixel_3a_API_34_extension_level_7_arm64-v8a
${topicName_text}         Meeting@room2
${TopicSelector}          //android.widget.LinearLayout[@resource-id="com.avjindersinghsekhon.minimaltodo:id/listItemLinearLayout"] 

*** Keywords ***
Open Test Application   
    Open Application    remote_url=${APPIUM_SERVER}
    ...     deviceName=${DEVICE_NAME}   
    ...     platformName=${PLATFORM_NAME}
    ...     appPackage=${APP_PACKAGE}
    ...     appActivity=${APP_ACTIVITY}

Open New Todo
    Tap     id=android:id/button1
    Tap     id=com.android.permissioncontroller:id/permission_allow_button
    Tap     id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB

*** Test Cases ***
Testcase-001 Open New ToDo and validate topic on page
    Open Test Application
    Open New Todo
    Input Text  xpath=//android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/userToDoEditText"]     ${topicName_text}
    Tap     id=com.avjindersinghsekhon.minimaltodo:id/toDoHasDateSwitchCompat
    Tap     id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
    Wait Until Element Is Visible   xpath=${TopicSelector} 
    Element Should Be Visible       xpath=${TopicSelector}
    Page Should Contain Text        ${topicName_text}















