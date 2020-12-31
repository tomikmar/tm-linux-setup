# Install Win10

  * Settings / Personalization / Start / “Occasionally show suggestions in Start” -> Disable
  * Uninstall/remove tiles from Start menu
  * Windows Update -> Install all updates
  * cleanmgr.exe / Clean up system files -> Previous Windows installation(s) & others


# Install apps

  * Firefox
  * LibreOffice
  * 7zip
  * Notepad++


# Remove apps

  * Remove One, Mail, ...


# Disable Windows functions

  * appwiz.cpl / Turn Windows features on and off
    * Disable: Internet Explorer 11, XPS
    * Enable: Telnet Client


# Disable Fast Startup

  * powercfg.cpl / Turn on fast startup -> Disable


# Enable BitLocker

  * c: / enable BitLocker


# Create standard local account

  * Settings / Accounts / Family & other users / Add someone else to this PC
  * net users


# Uninstall Cortana

  * Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage
  * More: https://www.windowscentral.com/how-uninstall-cortana-windows-10-may-2020-update


# Review/update privacy settings

  * Settings / Privacy / *
    * Disable all for Edge


