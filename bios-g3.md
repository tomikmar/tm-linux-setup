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

    * Remote Management Options
      * Active Management (AMT) -> Disable


## Run Memtest


## BIOS Docs

  * http://h10032.www1.hp.com/ctg/Manual/c06114605


