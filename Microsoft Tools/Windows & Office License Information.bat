<# : hybrid batch + powershell script
@powershell -noprofile -Window Normal -c "$param='%*';$ScriptPath='%~f0';iex((Get-Content('%~f0') -Raw))"&exit/b
#>
mode con cols=70 lines=4

# Sistem dili algýlama
$Lang = (Get-UICulture).TwoLetterISOLanguageName

if ($Lang -eq "tr") {
    # --- TÜRKÇE ---
    $Host.UI.RawUI.WindowTitle = "Windows & Office Lisans Bilgileri"
    Write-Host ""
    Write-Host "`tLisans bilgileri toplanýyor, lütfen bekleyin..."
}
else {
    # --- ENGLISH ---
    $Host.UI.RawUI.WindowTitle = "Windows & Office License Information"
    Write-Host ""
    Write-Host "`tCollecting license information, please wait..."
}

# --- DÝL AYARLARI VE METÝNLER ---
# --- LANGUAGE SETTINGS AND STRINGS ---

# Ýþletim sistemi arayüz dilini kontrol et
# Check the OS UI language
$uiCulture = (Get-UICulture).Name
$Global:LANG = $null

# Türkçe metinler
# Turkish strings
$TR = @{
    OhookStatus                 = "Office sürümünde kalýcý Office aktivasyonu için Ohook yöntemi iþletim sistemine yüklenmiþ.`n`n" +
                                  "Office aktivasyon bilgisindeki 'Lisans Durumu : Bildirim' veya 'Yetkisiz Kullaným Süresi' uyarýsý varsa bu uyarýyý görmezden gelin.`n`n" +
                                  "Office ürününüz kalýcý olarak etkinleþtirilmiþ."
    Status0                     = "Lisanssýz"
    Status1                     = "Lisanslý"
    Status2                     = "Yetkisiz Kullaným Süresi"
    Status3                     = "KMS Lisansýnýn Süresi Doldu veya Donaným Tolerans Dýþý"
    Status4                     = "Orijinal Olmayan Yetkisiz Kullaným Süresi"
    Status5                     = "Bildirim"
    Status6                     = "Uzatýlmýþ Yetkisiz Kullaným Süresi"
    StatusDefault               = "Bilinmeyen"
    Unknown                     = "Bilinmiyor"
    PopupNoProducts             = "Windows ve Office ürünleri bulunamadý veya lisans durumu bilinmiyor.`n`n"
    PopupTitle                  = "                 Windows & Office Lisans Bilgileri`n ------------------------------------------------------------------------`n`n"
    UnknownProduct              = "Bilinmeyen Ürün"
    PopupLicStatus              = "Lisans Durumu"
    PopupChannel                = "Ürün Anahtarý Kanalý"
    PopupPartialKey             = "Kýsmi Ürün Anahtarý"
    PopupKmsDays                = "Lisanslý KMS Gün Sayýsý"
    PopupKmsName                = "KMS Sunucu Adý"
    PopupKmsIp                  = "KMS Sunucu IP Adresi"
    PopupOhookStatus            = "OHOOK DURUMU :"
    PopupMessageBoxTitle        = "Windows & Office Lisans Bilgileri"
}

# Ýngilizce metinler
# English strings
$EN = @{
    OhookStatus                 = "The Ohook method for permanent Office activation is installed on the operating system for this Office version.`n`n" +
                                  "If there is a 'License Status: Notification' or 'Grace Period' warning in the Office activation info, please ignore this warning.`n`n" +
                                  "Your Office product is permanently activated."
    Status0                     = "Unlicensed"
    Status1                     = "Licensed"
    Status2                     = "Grace Period"
    Status3                     = "KMS License Expired or Hardware Out of Tolerance"
    Status4                     = "Non-Genuine Grace Period"
    Status5                     = "Notification"
    Status6                     = "Extended Grace Period"
    StatusDefault               = "Unknown"
    Unknown                     = "Unknown"
    PopupNoProducts             = "No Windows or Office products found, or license status is unknown.`n`n"
    PopupTitle                  = "                 Windows & Office License Information`n ------------------------------------------------------------------------`n`n"
    UnknownProduct              = "Unknown Product"
    PopupLicStatus              = "License Status"
    PopupChannel                = "Product Key Channel"
    PopupPartialKey             = "Partial Product Key"
    PopupKmsDays                = "Licensed KMS Days Left"
    PopupKmsName                = "KMS Server Name"
    PopupKmsIp                  = "KMS Server IP Address"
    PopupOhookStatus            = "OHOOK STATUS :"
    PopupMessageBoxTitle        = "Windows & Office Lisans Bilgileri"
}

# Dil seçimi
# Language selection
if ($uiCulture -eq 'tr-TR') {
    $Global:LANG = $TR
} else {
    $Global:LANG = $EN
}
# --- DÝL AYARLARI VE METÝNLER SONU ---
# --- END OF LANGUAGE SETTINGS AND STRINGS ---


function Get-OhookStatus {
    $officeBasePath = "C:\Program Files\Microsoft Office\root\vfs\"
    $fs = New-Object -ComObject Scripting.FileSystemObject

    if ($fs.FolderExists($officeBasePath + "System")) {
        $officePath = $officeBasePath + "System\"
    }
    elseif ($fs.FolderExists($officeBasePath + "SystemX86")) {
        $officePath = $officeBasePath + "SystemX86\"
    }
    else {
        return ""
    }

    $sppcFile = $officePath + "sppc.dll"
    $sppcsFile = $officePath + "sppcs.dll"

    if (($fs.FileExists($sppcFile)) -and ($fs.FileExists($sppcsFile))) {
        # DEÐÝÞTÝRÝLDÝ / MODIFIED
        return $LANG.OhookStatus
    }
    else {
        return ""
    }
}

function Get-LicenseStatusText {
    param ($code)
    # DEÐÝÞTÝRÝLDÝ / MODIFIED
    switch ($code) {
        0 { return $LANG.Status0 }
        1 { return $LANG.Status1 }
        2 { return $LANG.Status2 }
        3 { return $LANG.Status3 }
        4 { return $LANG.Status4 }
        5 { return $LANG.Status5 }
        6 { return $LANG.Status6 }
        default { return $LANG.StatusDefault }
    }
}

function Get-SlmgrDlvInfo {
    param($productID)

    $output = & cscript.exe /nologo "$env:SystemRoot\System32\slmgr.vbs" /dlv $productID 2>&1
    $lines = $output -split "`r?`n"

    # "Ürün Anahtarý Kanalý" veya "Product Key Channel" satýrlarýný arýyoruz (Bu satýr zaten iki dili de destekliyordu)
    foreach ($line in $lines) {
        if ($line -match 'Ürün Anahtarý Kanalý' -or $line -match 'Product Key Channel') {
            # Satýrdan : sonrasý deðeri al
            $parts = $line -split ':', 2
            if ($parts.Count -ge 2) {
                $channelText = $parts[1].Trim()

                # OEM dm veya OEM:NONSLP gibi ifadeleri düzgün yaz
                if ($channelText -match '^dm$') {
                    return "OEM-DM"
                }
                elseif ($channelText -match '^(OEM)[:\-]?(.*)$') {
                    return "OEM:$($matches[2].Trim())"
                }
                elseif ($channelText -ne '') {
                    return $channelText
                }
                else {
                    # DEÐÝÞTÝRÝLDÝ / MODIFIED
                    return $LANG.Unknown
                }
            }
        }
    }
    # DEÐÝÞTÝRÝLDÝ / MODIFIED
    return $LANG.Unknown
}

function Get-KMSInfoFromSlmgr {
    param($productID)

    $output = & cscript.exe /nologo "$env:SystemRoot\System32\slmgr.vbs" /dlv $productID 2>&1

    # DEÐÝÞTÝRÝLDÝ: Ýngilizce 'Product Key Channel' eklendi
    # MODIFIED: Added English 'Product Key Channel'
    $channelLine = $output | Where-Object { $_ -match 'Ürün Anahtarý Kanalý' -or $_ -match 'Product Key Channel' }
    $channelText = if ($channelLine) { $channelLine -replace '.*:\s*','' } else { '' }

    if ($channelText -match '(KMS|GVLK|Volume)') {
        # DEÐÝÞTÝRÝLDÝ: Ýngilizce 'KMS machine name:' ve 'KMS machine IP address:' eklendi
        # MODIFIED: Added English 'KMS machine name:' and 'KMS machine IP address:'
        $kmsNameLine = $output | Where-Object { $_ -match 'KMS makinesi adý:' -or $_ -match 'KMS machine name:' }
        $kmsIpLine = $output | Where-Object { $_ -match 'KMS makinesi IP adresi:' -or $_ -match 'KMS machine IP address:' }

        $kmsName = if ($kmsNameLine) { $kmsNameLine -replace '.*:\s*','' } else { '' }
        $kmsIp = if ($kmsIpLine) { $kmsIpLine -replace '.*:\s*','' } else { '' }

        if ([string]::IsNullOrWhiteSpace($kmsName) -or $kmsName.Trim() -eq '1688') {
            try {
                $regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform"
                $regKmsName = (Get-ItemProperty -Path $regPath -Name KeyManagementServiceName -ErrorAction SilentlyContinue).KeyManagementServiceName
                if ($regKmsName -and $regKmsName -ne '1688') {
                    $kmsName = $regKmsName
                }
            } catch {
            }
        }

        return @{
            Channel = $channelText.Trim()
            KMSName = $kmsName.Trim()
            KMSIp = $kmsIp.Trim()
        }
    }
    else {
        return @{
            Channel = $channelText.Trim()
            KMSName = ''
            KMSIp = ''
        }
    }
}

function Get-Products {
    try {
        $query = "SELECT * FROM SoftwareLicensingProduct WHERE PartialProductKey IS NOT NULL"
        $allProducts = Get-CimInstance -Query $query | Where-Object { $_.LicenseStatus -ne 0 }
        return $allProducts
    } catch {
        return @()
    }
}

function Show-LicenseStatusPopup {
    Add-Type -AssemblyName PresentationFramework

    $products = Get-Products
    $ohookMessage = Get-OhookStatus

    $output = ""

    if ($products.Count -eq 0) {
        # DEÐÝÞTÝRÝLDÝ / MODIFIED
        $output += $LANG.PopupNoProducts
    } else {
        # DEÐÝÞTÝRÝLDÝ / MODIFIED
        $output += $LANG.PopupTitle

        $os = Get-CimInstance -ClassName Win32_OperatingSystem
        $osCaption = $os.Caption
        $osNameWritten = $false

        foreach ($p in $products) {
            # DEÐÝÞTÝRÝLDÝ / MODIFIED
            $type = if ($p.Name -match 'Office') { '' } elseif ($p.Name -match '^Windows') { '' } else { $LANG.UnknownProduct }
            $statusText = Get-LicenseStatusText $p.LicenseStatus

            if ($p.Name -match '^Windows' -and -not $osNameWritten) {
                $output += "$osCaption`n"
                $osNameWritten = $true
            }

            # Kanal bilgisini Get-SlmgrDlvInfo fonksiyonundan al (OEM:NONSLP için doðru çýktý)
            $channel = Get-SlmgrDlvInfo -productID $p.ID

            if ($p.Name -match 'Office') {
                $output += "$($p.Name)`n"
            }

            $output += "`n"
            # DEÐÝÞTÝRÝLDÝ / MODIFIED
            $output += "$($LANG.PopupLicStatus)		: $statusText`n"
            $output += "`n"
            # DEÐÝÞTÝRÝLDÝ / MODIFIED
            $output += "$($LANG.PopupChannel)       	: $channel`n"
            # DEÐÝÞTÝRÝLDÝ / MODIFIED
            $output += "$($LANG.PopupPartialKey)       	: $($p.PartialProductKey)`n"

            # KMS bilgilerini sadece KMS lisansý varsa göster
            $kmsInfo = Get-KMSInfoFromSlmgr -productID $p.ID
            if ($p.GracePeriodRemaining -gt 0) {
                $daysLeft = [math]::Floor($p.GracePeriodRemaining / (24*60))
                # DEÐÝÞTÝRÝLDÝ / MODIFIED
                $output += "$($LANG.PopupKmsDays)	: $daysLeft`n"

                $kmsNameTrimmed = $kmsInfo.KMSName.Trim()
                if (-not [string]::IsNullOrWhiteSpace($kmsNameTrimmed) -and $kmsNameTrimmed -ne '1688') {
                    if ($kmsNameTrimmed -match '^(.*):\d+$') {
                        $kmsHost = $matches[1].Trim()
                        if ($kmsHost -eq '') {
                            # DEÐÝÞTÝRÝLDÝ / MODIFIED
                                $output += "$($LANG.PopupKmsName)		: $($LANG.Unknown)`n"
                        } else {
                            # DEÐÝÞTÝRÝLDÝ / MODIFIED
                                $output += "$($LANG.PopupKmsName)		: $kmsHost`n"
                        }
                    } else {
                        # DEÐÝÞTÝRÝLDÝ / MODIFIED
                            $output += "$($LANG.PopupKmsName)		: $kmsNameTrimmed`n"
                    }
                }

                if ($kmsInfo.KMSIp -ne '') {
                    # DEÐÝÞTÝRÝLDÝ / MODIFIED
                    $output += "$($LANG.PopupKmsIp)	: $($kmsInfo.KMSIp)`n"
                }
            }

            $output += "------------------------------------------------------------------------`n"
            $output += "`n"
        }
    }

if ($ohookMessage -ne "") {
    $officeLicenseExists = $false
    foreach ($p in $products) {
        if ($p.Name -match 'Office') {
            $officeLicenseExists = $true
            break
        }
    }
    if ($officeLicenseExists) {
        # DEÐÝÞTÝRÝLDÝ / MODIFIED
        $output += "$($LANG.PopupOhookStatus)`n"
        $output += $ohookMessage
    }
}

    Add-Type -AssemblyName System.Windows.Forms
    # DEÐÝÞTÝRÝLDÝ / MODIFIED
    [System.Windows.Forms.MessageBox]::Show($output, $LANG.PopupMessageBoxTitle, [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information, [System.Windows.Forms.MessageBoxDefaultButton]::Button1, [System.Windows.Forms.MessageBoxOptions]::ServiceNotification)
}

Show-LicenseStatusPopup