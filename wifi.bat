@echo off
mode con: cols=130 lines=35
net session >nul 2>&1
if %errorLevel% == 0 ( goto _bgcon_ ) else ( goto eradmcon_ )
:_bgcon_
title Hotspot Status : Stopped
:bgcon_

color 17
cls
echo __________________________________________________________________________________________________________________________________
echo.                                                 He2A WiFi Hotspot Script for Retards
echo __________________________________________________________________________________________________________________________________
set INP=
echo Select your option:
echo S to set wifi hotspot settings
echo C to start wifi hotspot with existing settings
echo D to disconnect wifi hotspot
echo I to show current wifi hotspot information
echo T to make temporary wifi hotspot for 10 minutes
echo Q to quit

echo.
set /P INP="Type input: "
if "%INP%"=="s" goto secon_ 
if "%INP%"=="S" goto secon_ 

if "%INP%"=="c" goto stcon_
if "%INP%"=="C" goto stcon_

if "%INP%"=="d" goto decon_ 
if "%INP%"=="D" goto decon_

if "%INP%"=="i" goto incon_ 
if "%INP%"=="I" goto incon_

if "%INP%"=="p" goto pscon_ 
if "%INP%"=="P" goto pscon_

if "%INP%"=="t" goto tmcon_
if "%INP%"=="T" goto tmcon_

if "%INP%"=="q" exit
if "%INP%"=="Q" exit

cls
goto bgcon_

:secon_
cls
echo __________________________________________________________________________________________________________________________________
echo.                                                 He2A WiFi Hotspot Script for Retards
echo __________________________________________________________________________________________________________________________________

set /P WIF="Type name of WiFi hotspot: "
set /P PWD="Type password: "

if "%PWD%" == "" ( goto erpwdcon_ )
if "%PWD:~7,1%"=="" ( goto erpwdcon_ )

cls
echo __________________________________________________________________________________________________________________________________
echo.                                                 He2A WiFi Hotspot Script for Retards
echo __________________________________________________________________________________________________________________________________
netsh wlan set hostednetwork mode=allow ssid="%WIF%" key="%PWD%"
netsh wlan start hostednetwork
color 2A

title Hotspot Status : Started
echo.
timeout /t 5 > nul

set WIF=
set PWD=
goto bgcon_

:stcon_
cls
echo __________________________________________________________________________________________________________________________________
echo.                                                 He2A WiFi Hotspot Script for Retards
echo __________________________________________________________________________________________________________________________________
netsh wlan start hostednetwork
color 2A

title Hotspot Status : Started
timeout /t 5 > nul
goto bgcon_

:erpwdcon_
color 4C

cls
echo __________________________________________________________________________________________________________________________________
echo.                                                 He2A WiFi Hotspot Script for Retards
echo __________________________________________________________________________________________________________________________________
if "%PWD%" == "" ( echo You must enter a password. ) else ( echo Password must be of 8 characters or longer. )
timeout /t 5 > nul

set WIF=
set PWD=
color 17
goto secon_

:decon_
cls
echo __________________________________________________________________________________________________________________________________
echo.                                                 He2A WiFi Hotspot Script for Retards
echo __________________________________________________________________________________________________________________________________
netsh wlan stop hostednetwork
color 2A

title Hotspot Status : Stopped
timeout /t 5 > nul
goto bgcon_

:pscon_
color 4C
cls
echo __________________________________________________________________________________________________________________________________
echo.                                                 He2A WiFi Hotspot Script for Retards
echo __________________________________________________________________________________________________________________________________
netsh wlan show hostednetwork setting=security

timeout /t 5 > nul
goto bgcon_

:tmcon_
cls
echo __________________________________________________________________________________________________________________________________
echo.                                                 He2A WiFi Hotspot Script for Retards
echo __________________________________________________________________________________________________________________________________
set /a ssid_tmp=%RANDOM%
set /a key_tmp=%RANDOM%
echo Hotspot successfully created.
echo SSID = TMP_%ssid_tmp%
echo Hotspot will close in 10 minutes. Press any key to force close hotspot.

timeout /t 600 > nul
netsh wlan stop hostednetwork > nul
goto bgcon_
:incon_
cls
echo __________________________________________________________________________________________________________________________________
echo.                                                 He2A WiFi Hotspot Script for Retards
echo __________________________________________________________________________________________________________________________________
netsh wlan show hostednetwork
echo.
echo Enter L to refresh periodically (CAN'T GO BACK)
echo Enter any other key to continue

echo.
set /P INPT="Type input: "
if "%INPT%"=="l" goto lpcon_ 
if "%INPT%"=="L" goto lpcon_ 
set INPT=
goto bgcon_

:lpcon_
title Hotspot Status : Display Loop (To stop the script, close the window or press Ctrl+C)

:lpcon2_
cls
echo __________________________________________________________________________________________________________________________________
echo.                                                 He2A WiFi Hotspot Script for Retards
echo __________________________________________________________________________________________________________________________________
color 2A
netsh wlan show hostednetwork
timeout /t 1 > nul
color 4C
timeout /t 1 > nul
goto lpcon2_

:eradmcon_
color 4C
title Hotspot Status : Insufficient Permission
echo __________________________________________________________________________________________________________________________________
echo.                                                 He2A WiFi Hotspot Script for Retards
echo __________________________________________________________________________________________________________________________________
echo You need administrator rights to run this script properly.
echo Press any key to quit.
pause > nul
exit
