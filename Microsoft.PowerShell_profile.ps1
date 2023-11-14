$env:SCOOP_APPS="$env:USERPROFILE\scoop\apps"

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\quick-term.omp.json" | Invoke-Expression

Import-Module Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

function JX-Location {Set-Location -Path D:\jx-offline; ls}
Set-Alias -Name jx -Value JX-Location

function S-Update {
	scoop update
	scoop update -a
	scoop status
	Scoop-Clean
}

function S-Clean {
	scoop cleanup -a
	scoop cache rm -a
}

function PS-Windows-Update {
	if (Get-Module -ListAvailable -Name PSWindowsUpdate) {
		Write-Warning "PSWindowsUpdate is already installed"
	} else {
		Write-Start "Installing PSWindowsUpdate..."
		Install-Module PSWindowsUpdate -Force
		Add-WUServiceManager -MicrosoftUpdate -Confirm:$false
	}
}

function W-Update {
	Write-Host ">> Get 'winget' updatable..." -ForegroundColor Green
	winget update
	Write-Host; Write-Host ">> Get-WindowsUpdate..." -ForegroundColor Green
	Get-WindowsUpdate
}

# Start-BitsTransfer -Source "https://raw.githubusercontent.com/julianv22/jx-offline/main/Microsoft.PowerShell_profile.ps1" -Destination $PROFILE
# (Get-PSReadLineOption).HistorySavePath
