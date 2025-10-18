@echo off
TITLE Creative (CT)USB Driver Installation
VER
ECHO Creative (CT)USB Driver Installation
DATE /T
TIME /T

SET /A INSTALLSTATUS=0
SET LANG=ENG

IF NOT %PROCESSOR_ARCHITECTURE%==AMD64 (
    echo "Installation does not support non 64bit architecture..."
    GOTO ERR_ARCH_END
)

:INSTALL64
ECHO Installing 64bit drivers set...

md "%ProgramData%\Creative\Presets"

xcopy /Y /Q "%~dp0Driver\Presets\*.*" "%ProgramData%\Creative\Presets"

REM trigger driver installation....
@echo Removing previous known drivers set ...
"%~dp0Support\I386\CTIOM32.exe"
"%~dp0Support\I386\W10\CTIOM32.exe"

pnputil.exe /add-driver "%~dp0Driver\Win\Bin\ctusbaud.inf" /install
timeout /T 5
pnputil.exe /add-driver "%~dp0Driver\Win\Bin\ctusbacom.inf" /install
timeout /T 5
pnputil.exe /add-driver "%~dp0Driver\Win\Bin\ctusbaext.inf" /install
timeout /T 5

"%~dp0Driver\Win\Bin\AddCat.exe" %systemroot%\CTUSBAPO64.hda
"%~dp0Driver\Win\Bin\AddCat.exe" %systemroot%\CTUSBAPO32.hda
"%~dp0Driver\Win\Bin\AddCat.exe" %systemroot%\CTUSBDGFX64.hda
"%~dp0Driver\Win\Bin\AddCat.exe" %systemroot%\CTUSBDGFX32.hda
"%~dp0Driver\Win\Bin\AddCat.exe" %systemroot%\CTUSBWrap64.hda
"%~dp0Driver\Win\Bin\AddCat.exe" %systemroot%\CTUSBWrap64.hda

IF [%1]==[] (
    echo not null LANG : %LANG%
    echo "Installing ENG strings..."
    regedit /s "%~dp0Driver\LANG\ksaudeng.reg"
    GOTO SET_INSTALL_DONE
) ELSE ( GOTO SET_INSTALL_LANG )

:SET_INSTALL_LANG
SET LANG=%1
echo "Selected %LANG% strings ..."

IF %LANG%==default (
    echo "Installing default ENG strings..."
    regedit /s "%~dp0Driver\LANG\ksaudeng.reg"
)

IF %LANG%==BRZ (
    echo "Installing BRZ strings..."
    regedit /s "%~dp0Driver\LANG\ksaudbrz.reg" 
)
    
IF %LANG%==CHS (
    echo "Installing CHS strings..."
    regedit /s "%~dp0Driver\LANG\ksaudchs.reg" 
)
    
IF %LANG%==CHT (
    echo "Installing CHT strings..."
    regedit /s "%~dp0Driver\LANG\ksaudcht.reg" 
)
    
IF %LANG%==DUT (
    echo "Installing DUT strings..."
    regedit /s "%~dp0Driver\LANG\ksauddut.reg" 
)
    
IF %LANG%==FRN (
    echo "Installing FRN strings..."
    regedit /s "%~dp0Driver\LANG\ksaudfrn.reg" 
)
    
IF %LANG%==GER (
    echo "Installing GER strings..."
    regedit /s "%~dp0Driver\LANG\ksaudger.reg" 
)
    
IF %LANG%==ITA (
    echo "Installing ITA strings..."
    regedit /s "%~dp0Driver\LANG\ksaudita.reg"
)
    
IF %LANG%==JPN (
    echo "Installing JPN strings..."
    regedit /s "%~dp0Driver\LANG\ksaudjpn.reg" 
)

IF %LANG%==KOR (
    echo "Installing KOR strings..."
    regedit /s "%~dp0Driver\LANG\ksaudkor.reg" 
)
    
IF %LANG%==POL (
    echo "Installing POL strings..."
    regedit /s "%~dp0Driver\LANG\ksaudpol.reg" 
)

IF %LANG%==RUS (
    echo Installing RUS strings...
    regedit /s "%~dp0Driver\LANG\ksaudrus.reg" 
)

IF %LANG%==SPN (
    echo "Installing SPN strings..."
    regedit /s "%~dp0Driver\LANG\ksaudspn.reg" 
)

:SET_INSTALL_DONE
echo LANG : %LANG%

SET /A INSTALLSTATUS = 1
GOTO INSTALL_STATUS

:INSTALL_STATUS
IF %INSTALLSTATUS%==1 (GOTO INSTALLSUCCESS) ELSE (GOTO INSTALLFAIL)

:INSTALLSUCCESS
ECHO "+=====================================================================+"
ECHO "|                                                                     |"
ECHO "|                    Installation Successful!                         |"
ECHO "|                                                                     |"
ECHO "+=====================================================================+"
GOTO END

:INSTALLFAIL
ECHO "+=====================================================================+"
ECHO "|                    Installation Unsuccessful!                       |"
ECHO "|                                                                     |"
ECHO "|         In order to fully install the device, please go to          |"
ECHO "|     Microsoft Device Manager to continue to install the device      |"
ECHO "|                                                                     |"
ECHO "+=====================================================================+"
GOTO END

:ERR_ARCH_END
ECHO "+======================================================================+"
ECHO "|                                                                      |"
ECHO "|        Installation does not support non 64bit architecture...       |"
ECHO "|                                                                      |"
ECHO "+======================================================================+"
GOTO ENDEND

:END
ECHO "+======================================================================+"
ECHO "|                                                                      |"
ECHO "| Please reboot your system in order for your changes to be effective. |"
ECHO "|                                                                      |"
ECHO "+======================================================================+"

IF [%2]==[NOREBOOT_BAT] ( GOTO TONOREBOOTBAT )

echo Reboot? [Y/N]
set /p var=
IF /i %var%==y (shutdown /r /f /t 0) else exit

:TONOREBOOTBAT
echo NO REBOOT BAT
:ENDEND