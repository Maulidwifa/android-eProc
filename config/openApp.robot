*** Settings ***
Library  AppiumLibrary

*** Variables ***
${platformName}     Android
${udid}             121522543J003338
${appPackage}       com.seribusaudara.quotation.dev
${appActivity}      com.seribusaudara.quotation.ui.screen.splash.SplashActivity
${akunOP}           088210068283
${passwordProject}  12345
${passwordSite}     test1234


*** Keywords ***
Open app Dev Project
    Open Application    http://127.0.0.1:4723    platformName=${platformName}    
    ...    deviceName=${udid}    appPackage=${appPackage}
    ...    appActivity=${appActivity}    automationName=UiAutomator2
	
Close App
    # Close All Applications
    Close Application