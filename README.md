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
 - Sound Blaster X7 (Experimental, Ported)
 - Sound Blaster E5 (Experimental, Ported)

<br/>

## What's Difference on this Driver?
 - CTUSBAud Kernel Driver
   - <img width="400" height="455" alt="sb1815_usbaudio2_service" src="https://github.com/user-attachments/assets/20ffa976-a83e-4145-91d5-639773f5ffa4" /> <img width="400" height="455" alt="sb1815_ctusbaud_service" src="https://github.com/user-attachments/assets/ce472794-b68e-4f7e-81bd-c17eb2dadc93" />
   - The Sound Blaster X4 originally used a kernel driver called "CTUSBAud/CTUSBa64" as of driver version '1.18.01.04', but newer versions use Microsoft's default kernel driver, "usbaudio2.sys". This causes annoying problems on some systems.
   - Therefore, this driver is based on driver version '3.06.03.00' and is a modded driver designed to operate in the same way as '1.18.01.04'.
   - While many Sound Blaster X4 users have found that using the '1.18.01.04' or '2.00.02.10' driver version has resolved an annoying issue, it may still cause clicks and pops on some systems. i recommend using the appropriate driver for your situation.

 - Support for older devices
   - <img width="1319" height="653" alt="sb1580_ctusbaud" src="https://github.com/user-attachments/assets/5ee83720-6506-4aef-b94a-4a40283d8c87" />
   - <img width="1315" height="655" alt="sb1590_ctusbaud" src="https://github.com/user-attachments/assets/70cbc50d-3952-495b-9a6a-51b777160db7" />
   - Sound Blaster X7 / E5 originally uses the "KSUSBAud" kernel driver, but it was made to work successfully with the "CTUSBAud" kernel driver as well. This is still in the experimental stage, with focus on the availability of the latest kernel drivers on previous devices.

<br/>

## Notes
 - When installing the driver, you must boot in 'Disable driver signature enforcement' mode.
 - If you experience clicks or pops while using this driver, please use the official driver.
 - There is currently a minor issue with Acoustic Engine. Switching between speaker and headphone modes must be done manually by changing the output channel settings.
