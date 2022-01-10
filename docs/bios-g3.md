# BIOS Settings on G3


## BIOS - Update / Diagnostics / Factory defaults

  * Main
    * Update System BIOS / Check HP.com for BIOS Updates 
    * System Diagnostics
      * Memory Test
      * Hard Drive Test (Extensive)
    * Apply Factory Defaults end Exit

  * Security
    * Hard Drive Utilities / Secure Erase
    * Restore Security Settings To Factory Defaults
    * TPM Embedded Security / Clear TPM
    * BIOS SureStart / Network Controller Configuration Restore

  * Advanced
    * Secure Boot Configuration / Reset Secure Boot keys to factory defaults


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

    * Secure Boot Configuration
      * Configure Legacy Support and Secure Boot -> LS Disable & SB Enable

    * System Options
      * Virtualization Technology (VTx)
      * Virtualization Technology for Directed I/O (VTd) 

    * Build-In Device Options
      * Wake On LAN -> Disabled
      * Fan Quiet Mode -> Enable
      * Backlit keyboard timeout -> 1 min.
      * Fingerprint Devive -> Disable

    * Power Management Options
      * Wake when Lid is Opened -> Enable

    * Remote Management Options
      * Active Management (AMT) -> Disable


## Run Memtest

  * https://www.memtest86.com


## BIOS Docs

  * http://h10032.www1.hp.com/ctg/Manual/c06114605


# Upgrade TPM firmware (1.2 to 2.0)

  * https://support.hp.com/us-en/document/c05381064


# HP Cloud Recovery

  * HP Cloud Recovery Supported Platforms
    * https://ftp.ext.hp.com/pub/caps-softpaq/CloudRecovery/crsupportedplatform.html
  * HP Business PCs - Using the HP Cloud Recovery Download Tool
    * https://support.hp.com/us-en/document/c05115630
  * Cloud Recovery Client
    * VERSION: 2.9.1.26376 - sp135957.exe

