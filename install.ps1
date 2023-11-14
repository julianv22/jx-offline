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
	Start-BitsTransfer -Source "https://raw.githubusercontent.com/julianv22/jx-offline/main/Microsoft.PowerShell_profile.ps1" -Destination $PROFILE
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
	Write-Host "Add 'Open with Code' to Context Menu..."
	reg import "$env:SCOOP_APPS\vscode\current\install-context.reg"
	reg import "$env:SCOOP_APPS\vscode\current\install-associations.reg"
Write-Done

Write-Start "Checking update..."
	S-Update
Write-Done
	wt btop # Open Windows Terminal wit BTOP
# END
