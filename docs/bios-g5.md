# BIOS Settings on G5


## BIOS - Update / Diagnostics / Factory defaults

  * Main
    * Update System BIOS / Check HP.com for BIOS Updates 
    * System Diagnostics
      * Memory Test
      * Storage Test (if installed)
      * Hard Drive Test (Extensive)
    * Apply Factory Defaults end Exit

  * Security
    * Hard Drive Utilities / Secure Erase
    * Restore Security Settings To Factory Defaults
    * TPM Embedded Security / Clear TPM
    * BIOS SureStart / Network Controller Configuration Restore

  * Advanced
    * Secure Boot Configuration / Reset Secure Boot keys to factory defaults
    * Secure Boot Configuration / Configure Legacy Support and Secure Boot -> Legacy Support Enable and Secure Boot Disable
       * To allow Memtest86+ to boot


##  Memtest86+

  * Run at least one pass (www.system-rescue.org) 


## BIOS - Configuration

  * Main
    * Update System BIOS / Lock BIOS Version
    * Change Date and Time
    * System IDs / Ownership Tag

  * Security
    * System Management Command -> Disable

  * Advanced
    * Boot Options
      * Network (PXE) Boot -> Disable
      * Power On When Lid id Opened -> Enable
      * Audio Alerts During Boot -> Disable

    * HP Sure Recover
      * HP Sure Recover -> Disable

    * Secure Boot Configuration
      * Configure Legacy Support and Secure Boot -> LS Disable & SB Enable

    * System Options
      * Virtualization Technology (VTx) -> Enabled
      * Virtualization Technology for Directed I/O (VTd) -> Enabled
      * Launch Hotkeys without Fn Keypress -> Disable (?)

    * Build-In Device Options
      * Wake On LAN -> Disabled
      * Backlit keyboard timeout -> 1 min.
      * Fingerprint Devive -> Disable

    * Power Management Options
      * Wake when Lid is Opened -> Enable
      * Battery Health Manager

    * Remote Management Options
      * Intel Management Engine (ME) -> Disable



## BIOS Docs

  * http://h10032.www1.hp.com/ctg/Manual/c06114605



# HP Cloud Recovery

  * HP Cloud Recovery Supported Platforms
    * https://ftp.ext.hp.com/pub/caps-softpaq/CloudRecovery/crsupportedplatform.html
  * HP Business PCs - Using the HP Cloud Recovery Download Tool
    * https://support.hp.com/us-en/document/c05115630
  * Cloud Recovery Client
    * VERSION: 2.9.1.26376 - sp135957.exe

