@echo off
TITLE = AutostartAfterPing
MODE con:cols=100 lines=3

rem   AutostartAfterPing
rem
rem   Customize and use this script to start programs automatically after 
rem   successfully pinging a specific server.
rem   * Used with a public server (www.google.de) it will start the programs 
rem     once the internet is available.
rem   * Used with a private server it will start the programs  once the 
rem     intranet/VPN is available.
rem
rem   Nowadays it's annoying for "mobile workers" to have several autostarting
rem   programs needing an internet, intranet or VPN connection. Often the 
rem   autostart of these programs is processed before a network connection is 
rem   established. These programs are annoying and error prone by displaying 
rem   login dialogs and error messages that are stealing the focus while you 
rem   are trying to enter a password for the WLAN or VPN Client.
rem
rem
rem   Manual
rem
rem   * Copy and customize this script to your needs.
rem   * Change the server to ping.
rem   * Disable the natural Autostart of the programs that you are adding here.
rem   * Add a link to the script in the Autostart folder.
rem
rem
rem   Hints
rem
rem   Autostart folder:
rem   * Run "shell:startup"
rem   * Taskmanagers Autostart tab
rem
rem   For a delay / wait of 1 sec use:   ping 127.0.0.1 -w 1000 -n 2 > nul
rem   Change n to count of seconds + 1
rem
rem   start "my title" /B "c:\program files\mycommand.exe"
rem     The /B switch will tell cmd to also close its window right away.
rem 
rem   start /min  xxx 
rem     The /min switch will tell the program to start minmized. Many programs 
rem     ignore the min (or max) switch.
rem

echo Going to autostart several applications after successful pinging www.google.de...
:pingloop
rem -n 6 means wait 5 sec -> Check every 5 sec
ping 127.0.0.1 -w 1000 -n 6 > nul
ping -n 1 www.google.de | find "TTL" >nul: 2>nul:
if errorlevel 1 goto :pingloop
echo Success - Going to start applications...


rem start /min "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Office\Microsoft Outlook 2010"


rem ping 127.0.0.1 -w 1000 -n 2 > nul
rem cd "C:\Users\%USERNAME%\AppData\Local\Microsoft\Teams"
rem start /min "" "C:\Users\%USERNAME%\AppData\Local\Microsoft\Teams\Update.exe" --processStart "Teams.exe" --process-start-args "--system-initiated"


rem ping 127.0.0.1 -w 1000 -n 2 > nul
rem rem Hamburger -> File -> Preferences
rem start /min "" "C:\Users\%USERNAME%\AppData\Local\slack\slack.exe"


rem Start this at last, so chances are high it is in front
ping 127.0.0.1 -w 1000 -n 4 > nul
start https://www.dilbert.com/


@echo on
