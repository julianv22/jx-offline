Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
#irm christitus.com/win | iex

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

#START
Write-Start "Installing scoop..."
	if (Get-Command scoop -errorAction SilentlyContinue) {
		Write-Warning "Scoop is already installed"
	} else {		
		iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
		#irm get.scoop.sh | iex		
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
	Clear-Content $PROFILE
	Add-Content $PROFILE -Value "oh-my-posh init pwsh --config 'C:\Users\Admin\scoop\apps\oh-my-posh\current\themes\quick-term.omp.json' | Invoke-Expression
Import-Module Terminal-Icons"
	. $PROFILE
Write-Done

Write-Start "Installing apps..."
	Write-App "<# Fonts #>";		scoop install DejaVuSansMono-NF-Mono
	Write-App "<# Developing #>";	scoop install nodejs python vscode notepadplusplus
	Write-App "<# Sofwares #>";		scoop install obs-studio discord wpsoffice hibit-uninstaller vcredist-aio
	Write-App "<# Games #>";		scoop install steam
	Write-App "<# JX-Tools #>";		scoop install winscp hxd ida-free
	Write-App "<# Apps #>";			scoop install neofetch ntop nano irfanview open-shell-np nilesoft-shell shutup10 winget
    #Write-App "<# Virtual Machine #>";	scoop install <# Virtual Machine #>	nonportable/virtualbox-np
	Write-Host; code --install-extension vscode-icons-team.vscode-icons --force
Write-Done

# Write-Start -msg "Enable Virtualization"
# 	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -Norestart
# 	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -Norestart
# 	Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All
# 	Enable-WindowsOptionalFeature -Online -FeatureName Containers -All
# Write-Done

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

# Open Windows Terminal
	windowsterminal
#END
