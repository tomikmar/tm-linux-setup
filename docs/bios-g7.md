# BIOS Settings on G7


## BIOS - Update / Diagnostics / Factory defaults

  * Main
    * Update System BIOS / Check HP.com for BIOS Updates (or update from USB)
    * System Diagnostics
      * Processor
        * Processor Test
        * CPU Stress Test
      * Memory Test
      * Storage Test
        * Hard Drive/SSD Test - Quick Test & Extensive Test
    * Apply Factory Defaults end Exit

  * Security
    * Hard Drive Utilities / Secure Erase
    * Advanced / HP Sure Recover / HP Sure Recover -> Disable (to speed up reboot required for cleanup below)
    * Restore Security Settings To Factory Defaults
    * TPM Embedded Security / Clear TPM
    * Secure Boot Configuration / Reset Secure Boot keys to factory defaults (if enabled)


##  Memtest86+

  * Run at least one pass (www.system-rescue.org) 


## BIOS - Configuration

  * Main
    * Update System BIOS / Lock BIOS Version
    * Change Date and Time
    * System IDs / Ownership Tag

  * Security
    * Secure Boot Configuration
    * System Management Command -> Disable

  * Advanced
    * Boot Options
      * Network (PXE) Boot -> Disable
      * Power On When Lid id Opened -> Enable
      * Audio Alerts During Boot -> Disable

    * HP Sure Recover
      * HP Sure Recover -> Disable

    * System Options
      * Virtualization Technology (VTx) -> Enabled
      * Virtualization Technology for Directed I/O (VTd) -> Enabled
      * Launch Hotkeys without Fn Keypress -> Disable (= enable function keys by default) 
      * Max DC Performance

    * Build-In Device Options
      * Wake On LAN -> Disabled
      * Video memory size -> 512MB
      * Microphone -> Disable
      * Backlit keyboard timeout -> 1 min.
      * Integrated camera -> Disable
      * Fingerprint Devive -> Disable

    * Power Management Options
      * Battery Health Manager

    * Remote Management Options
      * Intel Active Management Technolgy (AMT) -> Disable


## BIOS Docs

  * HP PC Commercial BIOS (UEFI) Setup - Administration Guide For Commercial Platforms 2020-2024 with HP BIOS
    * https://h10032.www1.hp.com/ctg/Manual/c06696065.pdf


## HP Cloud Recovery

  * HP Cloud Recovery Supported Platforms
    * https://ftp.ext.hp.com/pub/caps-softpaq/CloudRecovery/crsupportedplatform.html
    * Link to: Cloud Recovery Client

