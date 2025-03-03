> Create env python (python -m venv venv)
> activated venv (.\venv\Scripts\activate)
 
> pip install -r requirements.txt  

> pip install robotframework


## Cara Set Up
Pre Request  
 - Node  
 - Java Installed on system  
 - JAVA_HOME is set in environment variables (comment to check "java-version")  
 - an android mobile device  
 - connecting cable  


Steps :   
 1. Download SDK tools (https://developer.android.com/studio) *scroll to Command line tools only  
 2. unzip file folder SDK tools  
    cmd > go to bin foler SDK tools  
    (ke web https://developer.android.com/tools/sdkmanager, copy sdkmanager "platform-tools" "platforms;android-34") *34 ini API level versi android 14  
     - jika error (Could not determine SDK root.  
Error: Either specify it explicitly with --sdk_root= or move this package into its expected location: <sdk>\cmdline-tools\latest\)  
     - lakukan (sdkmanager --sdk_root=path-to-where-cmdline-tools-is "platform-tools" "platforms;android-34")  
  
 3. Set environment variables   
    ANDROID_HOME = location sdk tools folder  
    path : appent the path of platform-tools folder  
  
 4. Check command adb devices  
    (untuk sekarang android nya tidak menggunakan emulator)  
  
 5. make devices ready  
    - enable developer mode  
    - make USB debugging on  
  
install (appium driver install uiautomator2)  
pip install Appium-Python-Client  
  
command liat apk = adb shell dumpsys window windows  
  
appPackage = com.seribusaudara.quotation.dev  
appActivity = com.seribusaudara.quotation.ui.screen.splash.SplashActivity  
  
Capabilities Android  
{  
  "appium:appPackage": "com.seribusaudara.quotation.dev",  
  "appium:appActivity": "com.seribusaudara.quotation.ui.screen.splash.SplashActivity",  
  "appium:platformName": "Android",  
  "appium:deviceName": "..",  
  "appium:automationName": "UiAutomator2",  
  "appium:udid": "121522543J003338"  
}  
  
appium -p 4723  
  
  
  
  
Help  
 - //android.widget.TextView[contains(@text, 'Welcome')] (contoh untuk penggunaan contains text)  
 - //android.widget.TextView[contains(@text, 'Welcome')]/preceding-sibling:: (contoh untuk naik 1 tapi masih satu parent)  
 - //android.widget.TextView[@id='title']/following-sibling::android.widget.TextView[@class='info'] (contoh untuk turun tapi masih satu parent)  
 - //android.widget.Button[@id='submit-button']/ancestor::android.widget.LinearLayout (contoh untuk mengambil element induk)  
 - //android.widget.LinearLayout/descendant::android.widget.Button (contoh mengambil element lebih dalam)  
   
cara untuk wireless adb connect  
 - aktifkan proses debug nirkabel  
 - stay connect via USB   
 - adb kill-server  
 - adb usb  
 - adb tcpip 5556   
 - adb connect <ip address>:<port>	(ip: 192.168.137.241)  
 - adb devices (must be see two device names , one of them is by deviceIP)  
 - unplug USB cable  
