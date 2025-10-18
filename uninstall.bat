
@echo off
TITLE Creative (CT)USB Driver UnInstallation
VER
ECHO Creative (CT)USB Driver UnInstallation
DATE /T
TIME /T
SET /A UNINSTALLSTATUS = 0

IF NOT %PROCESSOR_ARCHITECTURE%==AMD64 (
   echo "Installation does not support non 64bit architecture..."
   GOTO ERR_ARCH_END
)

:UNINSTALL64
ECHO UnInstalling 64bit drivers set

net stop Creative.VADMonitorService /y

@echo Uninstalling drivers ...
"%~dp0Support\I386\CTIOM32.exe"
"%~dp0Support\I386\W10\CTIOM32.exe"

regsvr32 /s /u %systemroot%\System32\CTUSBAPO64.dll
regsvr32 /s /u %systemroot%\SysWOW64\CTUSBAPO32.dll
regsvr32 /s /u %systemroot%\SysWOW64\CTUSBPPLD32.dll
regsvr32 /s /u %systemroot%\System32\CTUSBPPLD64.dll
regsvr32 /s /u %systemroot%\System32\CTUSBDGFX64.dll
regsvr32 /s /u %systemroot%\SysWOW64\CTUSBDGFX32.dll
regsvr32 /s /u %systemroot%\System32\CTUSBWrap64.dll
regsvr32 /s /u %systemroot%\SysWOW64\CTUSBWrap32.dll

del /F /Q %systemroot%\System32\SB1710.ico
del /F /Q %systemroot%\System32\SB1815.ico
del /F /Q %systemroot%\System32\SB1820.ico
del /F /Q %systemroot%\System32\SB1860.ico
del /F /Q %systemroot%\System32\MF1705.ico
del /F /Q %systemroot%\System32\MF1710.ico
del /F /Q %systemroot%\System32\SA0180.ico
del /F /Q %systemroot%\System32\SA0180_3.ico
del /F /Q %systemroot%\System32\SA0180_4.ico
del /F /Q %systemroot%\System32\SA0190.ico
del /F /Q %systemroot%\System32\ZZ0090.ico
del /F /Q %systemroot%\System32\SA0200.ico
del /F /Q %systemroot%\System32\SA0210.ico
del /F /Q %systemroot%\System32\MF1715.ico
del /F /Q %systemroot%\System32\MF0495.ico
del /F /Q %systemroot%\System32\MF8410.ico
del /F /Q %systemroot%\System32\MF8460.ico
del /F /Q %systemroot%\System32\MF8470.ico
del /F /Q %systemroot%\System32\SB1900.ico
del /F /Q %systemroot%\System32\SB.ico
del /F /Q %systemroot%\System32\SB.bmp


net stop audiosrv /y
del /F /Q %systemroot%\System32\CTUSBAPO64.dll
del /F /Q %systemroot%\SysWOW64\CTUSBAPO32.dll
del /F /Q %systemroot%\System32\CTUSBPPLD64.dll
del /F /Q %systemroot%\SysWOW64\CTUSBPPLD32.dll
del /F /Q %systemroot%\System32\CTUSBDGFX64.dll
del /F /Q %systemroot%\SysWOW64\CTUSBDGFX32.dll
del /F /Q %systemroot%\System32\CTUSBWrap64.dll
del /F /Q %systemroot%\SysWOW64\CTUSBWrap32.dll

del /F /Q %systemroot%\System32\Drivers\CTUSBa64.sys
del /F /Q %systemroot%\System32\Drivers\CTUSBfilt64.sys

del /F /Q %ProgramData%\Creative\Presets\*.*

rd "%ProgramData%\Creative\Presets" /S /Q

pnputil.exe /remove-device /deviceid "SWC\VID_041E&AID_0001"

net start audiosrv /y
net start Creative.VADMonitorService /y

SET /A UNINSTALLSTATUS = 1
GOTO UNINSTALL_STATUS

:UNINSTALL_STATUS
IF %UNINSTALLSTATUS%==1 (GOTO UNINSTALLSUCCESS) ELSE (GOTO UNINSTALLFAIL)

:UNINSTALLSUCCESS
ECHO "+=====================================================================+"
ECHO "|                    UnInstallation Successful!                       |"
ECHO "|                                                                     |"
ECHO "+=====================================================================+"
GOTO END

:UNINSTALLFAIL
ECHO "+=====================================================================+"
ECHO "|                    UnInstallation Unsuccessful!                     |"
ECHO "|                                                                     |"
ECHO "|        In order to fully uninstall the device, please go to         |"
ECHO "|    Microsoft Device Manager to continue to uninstall the device     |"
ECHO "|        After which exit Microsoft Device Manager when done.         |"
ECHO "|                                                                     |"
ECHO "+=====================================================================+"
GOTO END

:END
ECHO "+======================================================================+"
ECHO "|                                                                      |"
ECHO "| Please remember to reboot your system in order for your changes      |"
ECHO "| to be effective.                                                     |"
ECHO "|                                                                      |"
ECHO "+======================================================================+"
GOTO TOREBOOT

:ERR_ARCH_END
ECHO "+======================================================================+"
ECHO "|                                                                      |"
ECHO "|        Installation does not support non 64bit architecture...       |"
ECHO "|                                                                      |"
ECHO "+======================================================================+"
GOTO ENDEND

:TOREBOOT
IF [%1]==[NOREBOOT_BAT] ( GOTO TONOREBOOTBAT )

echo Reboot? [Y/N]
set /p var=
IF /i %var%==y ( shutdown /r /f /t 0 ) else exit
pause

:TONOREBOOTBAT
echo NO REBOOT BAT
:ENDEND