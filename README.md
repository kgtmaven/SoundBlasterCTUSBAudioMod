# Sound Blaster CTUSB Audio Drivers Mod

${\color{red}WARNING! \space Use \space At \space Your \space Own \space Risk!}$

Sound Blaster CTUSB Audio Drivers for newer Sound Blaster USB devices.

Such as Sound Blaster X4 and etc.

This driver is designed to solve an annoying problem.

<br/><br/>
<img width="1529" height="651" alt="sb1815_ctusbaud" src="https://github.com/user-attachments/assets/b6867cef-49b2-49ea-9574-a5a77ea6bf9b" />
<br/><br/>

## Supported Devices
 - Sound Blaster X4

<br/>

## What's Difference on this Driver?
 - CTUSBAud Kernel Driver
   - <img width="400" height="455" alt="sb1815_usbaudio2_service" src="https://github.com/user-attachments/assets/20ffa976-a83e-4145-91d5-639773f5ffa4" /> <img width="400" height="455" alt="sb1815_ctusbaud_service" src="https://github.com/user-attachments/assets/ce472794-b68e-4f7e-81bd-c17eb2dadc93" />
   - The Sound Blaster X4 originally used a kernel driver called "CTUSBAud/CTUSBa64" as of driver version '1.18.01.04', but newer versions use Microsoft's default kernel driver, "usbaudio2.sys". This causes annoying problems on some systems.
   - Therefore, this driver is based on driver version '3.06.03.00' and is a modded driver designed to operate in the same way as '1.18.01.04'.
   - While many Sound Blaster X4 users have found that using the '1.18.01.04' driver version has resolved an annoying issue, it may still cause clicks and pops on some systems. i recommend using the appropriate driver for your situation.

<br/>

## Notes
 - When installing the driver, you must boot in 'Disable driver signature enforcement' mode.
 - If you experience clicks or pops while using this driver, please use the official driver.
