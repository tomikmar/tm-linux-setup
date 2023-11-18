# Install Win11

  * Windows Update -> Install all updates
  * cleanmgr.exe / Clean up system files
  * Set red background for admin user
  * Settings / Privacy & security / General / Show me suggested content in the Settings app -> Off
  * Settings / Privacy & security / <Rights>
    * Review and disable unnecessary  
  * Turn off web search
    ```
    Windows Registry Editor Version 5.00

    [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search]
    "BingSearchEnabled"=dword:00000000
    ```


# Remove unused apps

  * Remove installed app for all users
    * [OK] Get-AppxPackage -allusers *MicrosoftOfficeHub* | Remove-AppxPackage
    * [OK] Get-AppxPackage -allusers *SpotifyAB.SpotifyMusic* | Remove-AppxPackage
    * [??] Get-AppxPackage -allusers *MicrosoftTeams* | Remove-AppxPackage 
    * [??] Get-AppxPackage -allusers *BingNews* | Remove-AppxPackage
    * [??] Get-AppxPackage -allusers *OneDriveSync*
    * [??] Get-AppxPackage -allusers *communicationsapps*
    * [??] Get-AppxPackage *WebExperience* | Remove-AppxPackage

  * Remove app for future users
    * [OK] Get-AppxProvisionedPackage –online | where-object {$_.packagename –like "*MicrosoftOfficeHub*"} | Remove-AppxProvisionedPackage –online
    * [OK] Get-AppxProvisionedPackage –online | where-object {$_.packagename –like "*MicrosoftTeams*"} | Remove-AppxProvisionedPackage –online
    * [OK] Get-AppxProvisionedPackage –online | where-object {$_.packagename –like "*BingNews*"} | Remove-AppxProvisionedPackage –online
    * [OK] Get-AppxProvisionedPackage –online | where-object {$_.packagename –like "*communicationsapps*"} | Remove-AppxProvisionedPackage –online
    * [OK] Get-AppxProvisionedPackage –online | where-object {$_.packagename –like "*WebExperience*"} | Remove-AppxProvisionedPackage –online


# Enable BitLocker

  * c: / enable BitLocker


# Select Windows functions

  * appwiz.cpl / Turn Windows features on and off
    * Enable: Windows Sandbox


# Configure power management

  * powercfg.cpl
    * Choose what the power buttons do
      * Turn on fast startup -> Disable
      * Hibernate -> Enable
    * Change when the computer sleeps
      * Review
      * Change advanced power settings / Sleep / Hibernate after


# Configure devices

  * Settings
    * Bluetooth & devices / Bluetooth -> Off
    * Autoplay -> Off


# Install apps

  * Firefox
  * Notepad++
  * LibreOffice
  * 7zip
  * BeyondCompare
  * SMPlayer


# Configure accounts

Add aditional user and set password

  * net user someAdminUsername /add
  * net user someAdminUsername * 
  * net user someAdminUsername /passwordreq:yes
  * wmic UserAccount where Name=”someAdminUsername” set PasswordExpires=False

Review accounts

  * net user
  * net localgroup
  * lusrmgr.msc
  * Settings / Accounts


# Firefox

  * Search
    * Search Bar / Add search bar in toolbar
    * Default Search Engine / DuckDuckGo
  * Privacy & Security
    * Enhanced Tracking Protection / Strict
    * Permissions / Autoplay / Block Audio and Video
  * Extensions / Add "uBlock Origin"


# Install WSL2 and Ubuntu (only for user who needs this)

  * wsl --status
  * wsl --list --online
  * wsl --install -d Ubuntu
  * wsl --list -v


# Review above for new user

