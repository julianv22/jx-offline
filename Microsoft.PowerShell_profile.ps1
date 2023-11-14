oh-my-posh init pwsh --config 'C:\Users\Admin\scoop\apps\oh-my-posh\current\themes\quick-term.omp.json' | Invoke-Expression

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
	Write-Host ">> Upgrading winget..." -ForegroundColor Green
	winget upgrade
}

function Scoop-Clean {
	scoop cleanup -a
	scoop cache rm -a
}

Set-Alias -Name jx -Value JX-Location
Set-Alias -Name S-Update -Value Scoop-Update
Set-Alias -Name S-Clean -Value Scoop-Clean
