# Install Win10

  * Settings / Personalization / Start / “Occasionally show suggestions in Start” -> Disable
  * Uninstall/remove tiles from Start menu
  * Windows Update -> Install all updates
  * cleanmgr.exe / Clean up system files -> Previous Windows installation(s) & others


# Install apps

  * Firefox
  * Notepad++
  * LibreOffice
  * 7zip
  * BeyondCompare
  * SMPlayer


# Firefox

  * Search
    * Search Bar / Add search bar in toolbar
    * Default Search Engine / DuckDuckGo
  * Privacy & Security
    * Enhanced Tracking Protection / Strict
    * Permissions / Autoplay / Block Audio and Video
  * Extensions / Add "uBlock Origin"


# Remove unused apps

  * Remove One, Mail, ...


# Disable Windows functions

  * appwiz.cpl / Turn Windows features on and off
    * Disable: Internet Explorer 11, XPS
    * Enable: Telnet Client


# Disable Fast Startup

  * powercfg.cpl / Turn on fast startup -> Disable


# Enable BitLocker

  * tpm.msc - make sure that TPM firmware is upgraded to 2.0 (if possible)
  * c: / enable BitLocker


# Create standard local account

  * Set password for the current admin user
  * net users newNotAdminUsername /add
  * Review
    * net users
    * net localgroup
    * lusrmgr.msc
  * (Alternatively) Settings / Accounts / Family & other users / Add someone else to this PC


# Uninstall Cortana (if exists)

  * (as admin) Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage
  * (as user) Get-AppxPackage Microsoft.549981C3F5F10 | Remove-AppxPackage
  * More: https://www.windowscentral.com/how-uninstall-cortana-windows-10-may-2020-update


# Review/update privacy settings

  * Settings / Privacy / *
    * Disable all for Edge


