$env:SCOOP_APPS="$env:USERPROFILE\scoop\apps"

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\quick-term.omp.json" | Invoke-Expression

Import-Module Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

function JX-Location {Set-Location -Path D:\jx-offline; ls}

function Scoop-Update {
	scoop update
	scoop update -a
	scoop status
	Scoop-Clean
	Write-Host; Write-Host ">> Get winget update..." -ForegroundColor Green
	winget update
	Write-Host; Write-Host ">> Get-WindowsUpdate..." -ForegroundColor Green
	Get-WindowsUpdate
}

function Scoop-Clean {
	scoop cleanup -a
	scoop cache rm -a
}

Set-Alias -Name jx -Value JX-Location
Set-Alias -Name S-Update -Value Scoop-Update
Set-Alias -Name S-Clean -Value Scoop-Clean

# Start-BitsTransfer -Source "https://raw.githubusercontent.com/julianv22/jx-offline/main/Microsoft.PowerShell_profile.ps1" -Destination $PROFILE
# (Get-PSReadLineOption).HistorySavePath
