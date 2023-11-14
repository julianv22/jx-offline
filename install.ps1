Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# irm christitus.com/win | iex

# Function
function Write-Start {
	param ($msg)
	Write-Host (">> "+$msg) -ForegroundColor Green
}

function Write-App {
	param ($msg)
	Write-Host $msg -ForegroundColor Magenta
}

function Write-Done { Write-Host "DONE" -ForegroundColor Yellow; Write-Host }

# START
Write-Start "Installing scoop..."
	if (Get-Command scoop -errorAction SilentlyContinue) {
		Write-Warning "Scoop is already installed"
	} else {
		iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
		# irm get.scoop.sh | iex
	}
Write-Done

Write-Start "Installing git & buckets..."
	scoop install git
	scoop bucket add extras
	scoop bucket add java
	scoop bucket add main
	scoop bucket add nerd-fonts
    scoop bucket add nonportable
    scoop bucket add versions
	scoop update
Write-Done

Write-Start "Installing Windows Terminal & Powershell..."
	scoop install windows-terminal pwsh psreadline oh-my-posh terminal-icons
	Import-Module Terminal-Icons
	Import-Module PSReadLine
	Set-PSReadLineOption -PredictionSource History
	Set-PSReadLineOption -PredictionViewStyle ListView
	Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0
	if (!(test-path $PROFILE)) {
		New-Item -Path $PROFILE -Type File -Force
	}
	Copy-Item -Path "D:\jx-offline\Microsoft.PowerShell_profile.ps1" -Destination $PROFILE
	# Copy-Item -Path ".\Microsoft.PowerShell_profile.ps1" -Destination $PROFILE
	. $PROFILE
Write-Done

Write-Start "Installing apps..."
	Write-App "<# Fonts #>";		scoop install SourceCodePro-NF-Mono
	Write-App "<# Developing #>";	scoop install nodejs python vscode kate
	Write-App "<# Sofwares #>";		scoop install obs-studio vcredist-aio # discord wpsoffice bleachbit hibit-uninstaller
	Write-App "<# Games #>";		scoop install steam
	Write-App "<# JX-Tools #>";		scoop install winscp hxd ida-free
	Write-App "<# Apps #>";			scoop install neofetch btop nano irfanview nilesoft-shell shutup10 kdeconnect wingetui
	Write-Host; code --install-extension vscode-icons-team.vscode-icons --force
	Write-App "Add 'Open with Code' to Context Menu" # Add 'Open with Code' to Context Menu
	reg import "C:\Users\Admin\scoop\apps\vscode\current\install-context.reg"
	reg import "C:\Users\Admin\scoop\apps\vscode\current\install-associations.reg"
Write-Done

Write-Start "Cleanup apps by removing old verions"
    scoop cleanup -a
Write-Done

Write-Start "Clear the download caches"
    scoop cache rm -a
Write-Done

Write-Start "Show status and check for new app versions"
	Write-App "------------Winget------------"
	Write-Host ("Use winget update <package-name> to update packages
or use winget update --all to update all") -ForegroundColor Cyan
	winget update
	Write-App "------------Scoop-------------"
	Write-Host "Use scoop update <package-name> to update packages" -ForegroundColor Cyan
	scoop status
Write-Done
	wt btop # Open Windows Terminal
# END
