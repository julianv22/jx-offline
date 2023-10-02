Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# Function
function Write-Start {
	param ($msg)
	Write-Host (">> "+$msg) -ForegroundColor Green
}

function Write-Done { Write-Host "DONE" -ForegroundColor Blue; Write-Host }

#START
Start-Process -Wait powershell -verb runas -ArgumentList "Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0"

Write-Start -msg "Installing Scoop..."
if (Get-Command scoop -errorAction SilentlyContinue) {
	Write-Warning "Scoop already installed"
} else {
	#Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
	iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
}
Write-Done

Write-Start -msg "Installing Git..."
	scoop install git	
	scoop bucket add extras
	scoop bucket add nerd-fonts
	scoop bucket add java	
	scoop update
Write-Done

Write-Start -msg "Installing Scoop's packages"
	# scoop install <# Browsers #> firefox googleschrome
	scoop install <# Tools #>			obs-studio wpsoffice winscp
	scoop install <# Coding #>			vscode nodejs python notepadplusplus hxd
	scoop install <# Community #>		discord	
	Start-Process -Wait powershell -verb runas -ArgumentList "scoop install extras/ida-free"
	Start-Process -Wait powershell -verb runas -ArgumentList "scoop install DejaVuSansMono-NF-Mono vcredist-aio"
Write-Done

Write-Start -msg "Configuring VSCode"
	code --install-extension adpyke.codesnap --force
	code --install-extension visualstudioexptteam.vscodeintellicode --force	
	code --install-extension esbenp.prettier-vscode --force
	code --install-extension vscode-icons-team.vscode-icons --force
	code --install-extension dbaeumer.vscode-eslint --force
	code --install-extension visualstudioexptteam.intellicode-api-usage-examples --force
	code --install-extension chakrounanas.turbo-console-log --force
Write-Done

Write-Start -msg "Enable Viertualization"
	Start-Process -Wait powershell -verb runas -ArgumentList "echo y | Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -Norestart"
	Start-Process -Wait powershell -verb runas -ArgumentList "echo y | Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -Norestart"
	Start-Process -Wait powershell -verb runas -ArgumentList " echo y | Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All"
	Start-Process -Wait powershell -verb runas -ArgumentList "echo y | Enable-WindowsOptionalFeature -Online -FeatureName Containers -All"
Write-Done
#END