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


# Configure power management

  * powercfg.cpl
    * Choose what the power buttons do
      * Turn on fast startup -> Disable
      * Hibernate -> Enable
    * Change when the computer sleeps
      * Review
      * Change advanced power settings / Sleep / Hibernate after


# Enable BitLocker

  * tpm.msc - make sure that TPM firmware is upgraded to 2.0 (if possible)
  * c: / enable BitLocker


# Configure accounts

Create local admin account

  * net users someAdminUsername /add
  * net users someAdminUsername *
  * net localgroup Administrators someAdminUsername /add
  * net localgroup Users someAdminUsername /delete
  * Loout/login

Change current account to standard one

  * net localgroup Users currentUsername /add
  * net localgroup Administrators currentUsername /delete
  * Loout/login
 
Review settings

  * net users
  * net localgroup
  * lusrmgr.msc
  * Settings / Accounts / Family & other users


# Uninstall Cortana (if exists)

  * (as admin) Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage
  * (as user) Get-AppxPackage Microsoft.549981C3F5F10 | Remove-AppxPackage
  * More: https://www.windowscentral.com/how-uninstall-cortana-windows-10-may-2020-update


# Review/update privacy settings

  * Settings / Privacy / *
    * Disable all for Edge


