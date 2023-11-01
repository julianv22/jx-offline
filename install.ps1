Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# Function
function Write-Start {
	param ($msg)
	Write-Host (">> "+$msg) -ForegroundColor Green
}

function Write-Done { Write-Host "DONE" -ForegroundColor Yellow; Write-Host }

#START
Start-Process -Wait powershell -verb runas -ArgumentList "Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0"

Write-Start -msg "Installing Scoop..."
if (Get-Command scoop -errorAction SilentlyContinue) {
	Write-Warning "Scoop is already installed"
} else {
	#Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
	iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
}
	Install-Module -Name Terminal-Icons -Scope CurrentUser -Force
	Import-Module Terminal-Icons
if (!(test-path $PROFILE)) {
	New-Item -Path $PROFILE -Type File -Force
}
	Clear-Content $PROFILE
	Add-Content $PROFILE -Value "oh-my-posh init pwsh --config 'C:\Users\Admin\scoop\apps\oh-my-posh\current\themes\quick-term.omp.json' | Invoke-Expression
Import-Module Terminal-Icons"
	.$PROFILE
Write-Done

Write-Start -msg "Installing git & buckets..."
	scoop install git    
	scoop bucket add extras
	scoop bucket add nerd-fonts
	scoop bucket add java
    scoop bucket add nonportable
    scoop bucket add versions    
	scoop update
Write-Done

Write-Start -msg "Installing Scoop's packages..."
	scoop install <# Environments #>	DejaVuSansMono-NF-Mono windows-terminal oh-my-posh
	scoop install <# Developing #>		vscode nodejs python notepadplusplus hxd winscp	
	scoop install <# Sofwares #>		obs-studio discord wpsoffice	
	scoop install <# Games #>			steam	
    #scoop install <# Virtual Machine #>		nonportable/virtualbox-np
	Start-Process -Wait powershell -verb runas -ArgumentList "scoop install ida-free"
	Start-Process -Wait powershell -verb runas -ArgumentList "scoop install vcredist-aio"
Write-Done

Write-Start -msg "Installing extensions..."		
	code --install-extension vscode-icons-team.vscode-icons --force	
Write-Done

Write-Start -msg "Enable Virtualization"
	Start-Process -Wait powershell -verb runas -ArgumentList "echo y | Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -Norestart"
	Start-Process -Wait powershell -verb runas -ArgumentList "echo y | Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -All -Norestart"
	Start-Process -Wait powershell -verb runas -ArgumentList " echo y | Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -All"
	Start-Process -Wait powershell -verb runas -ArgumentList "echo y | Enable-WindowsOptionalFeature -Online -FeatureName Containers -All"
Write-Done

Write-Start -msg "Cleanup apps by removing old verions"
    scoop cleanup -a
Write-Done

Write-Start -msg "Clear the download cache"
    scoop cache rm -a
Write-Done

Write-Start -msg "Show status and check for new app versions"
    scoop status
Write-Done
	windowsterminal.exe
#END
