# Requirements:
# * PowerShell (dahh) - Script made with version 7.2.2
# * Starship - https://www.starship.rs/
# * NerdFont - https://www.nerdfonts.com/

# Debug output
$debug_output = $true
#$term_output = $false

# Online Strings
$starship = "https://raw.githubusercontent.com/sebtech33/Windows-HOME-files/main/.config/starship/starship.toml"

# Local strings
$starship_config = "$HOME\.config\starship\starship.toml"
#$enable = $true
$name = "SebTech33 "

$distro_icon = " ", ""


function check_os {
	if ( $IsWindows ) {
		Write-Output "The OS is Microsoft Windows"
		Write-Output "Script is currently only working on Windows, continuing"
		Write-Debug "This is Debug"
		$global:distro_icon = " "
		Start-Sleep -s 1
	}
	elseif ( $IsLinux ) {
		Write-Output "The Os is Linux"

		# TODO Need to check distro too
		
	}
	elseif ( $IsMacOS ) {
		Write-Output "The OS is MacOS"
		# TODO Find out what to do
	}
	$ENV:STARSHIP_DISTRO = $distro_icon + $name
}


function check_conf {
	$check = Test-Path -Path $starship_config -PathType Leaf

	Clear-Host
	
	if ( $check ) {
		Write-Output "Starship Loaded"
		Start-Sleep -s 0.5
		$ENV:STARSHIP_CONFIG = $starship_config
	}
	else {
		Write-Output "It works but no starship config file is found"
		$promt = Read-Host -Prompt "Do you want to download your starship config? (y/n)"
		
		if ( $promt -eq "y" ) {
			Write-Output "Ok, ill download the config"
			Invoke-WebRequest $starship -OutFile $starship_config
			check_conf
		}
		else {
			Write-Output "Ok, continuing with default config"
		}
	}
}

if ( $debug_output ) {
	$DebugPreference = "continue"
}
check_os
Start-Sleep -s 0.5

check_conf

#Start-Sleep -s 3
Clear-Host

#$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"

#$ENV:STARSHIP_CONFIG = $starship_config

Invoke-Expression (&starship init powershell)
