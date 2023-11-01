Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# Function
function Write-Start {
	param ($msg)
	Write-Host (">> "+$msg) -ForegroundColor Green
}

function Write-Done { Write-Host "DONE" -ForegroundColor Yellow; Write-Host }

#START
Write-Start -msg "Installing scoop..."
	if (Get-Command scoop -errorAction SilentlyContinue) {
		Write-Warning "Scoop is already installed"
	} else {		
		iex "& {$(irm get.scoop.sh)} -RunAsAdmin"		
	}
Write-Done

Write-Start -msg "Installing git & buckets..."
	scoop install git
	scoop bucket add extras
	scoop bucket add java
	scoop bucket add main
	scoop bucket add nerd-fonts
    scoop bucket add nonportable
    scoop bucket add versions
	scoop update
Write-Done

Write-Start -msg "Installing Windows Terminal & Powershell..."
	scoop install windows-terminal pwsh psreadline oh-my-posh terminal-icons
	scoop install DejaVuSansMono-NF-Mono
	Import-Module Terminal-Icons
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

Write-Start -msg "Installing apps..."
	Write-Host "<# Developing #>";	scoop install nodejs python vscode notepadplusplus
	Write-Host "<# Sofwares #>";	scoop install obs-studio discord wpsoffice vcredist-aio
	Write-Host "<# Games #>";		scoop install steam
	Write-Host "<# JX-Tools #>";	scoop install winscp hxd ida-free
	Write-Host "<# Winget #>";		scoop install winget
    #Write-Host "<# Virtual Machine #>";	scoop install <# Virtual Machine #>	nonportable/virtualbox-np
	Write-Host; code --install-extension vscode-icons-team.vscode-icons --force
Write-Done

# Write-Start -msg "Enable Virtualization"
# 	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -Norestart
# 	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -Norestart
# 	Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All
# 	Enable-WindowsOptionalFeature -Online -FeatureName Containers -All
# Write-Done

Write-Start -msg "Cleanup apps by removing old verions"
    scoop cleanup -a
Write-Done

Write-Start -msg "Clear the download caches"
    scoop cache rm -a
Write-Done

Write-Start -msg "Show status and check for new app versions"
	Write-Host (" ! Use winget upgrade <package-name> to upgrade packages") -ForegroundColor Blue
	Write-Host " ! or use winget upgrade --all to upgrade all" -ForegroundColor Blue
	winget upgrade
	Write-Host; Write-Host " ! Use scoop update <package-name> to update packages" -ForegroundColor Blue
    scoop status
Write-Done

# Opening Windows Terminal...
	windowsterminal
#END