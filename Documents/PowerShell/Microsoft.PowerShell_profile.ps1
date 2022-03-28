#!/usr/bin/env pwsh, powershell

# Requirements:
# - PowerShell Core (dahh) 	- Script made with version 7.2.2
# - Starship				- https://www.starship.rs/
# - NerdFont				- https://www.nerdfonts.com/

# Static name for custom Name.
# Leave empty ($name = "") if you either want:
# - Starship config to handle the username # TODO Add username "plugin" to Starship conf - Disabled by default
# - No username showing in terminal
$name = 'SebTech33' # Default = ''

# Debug output
# Only use for debugging code
# NOTE: This will enable it for all scripts and modules.
# Options = '' / $false / $true / "Inquire"
$debug_output = '' #Default = ''


# START OF CODE #


# Online Strings
#$starship = "https://raw.githubusercontent.com/sebtech33/Windows-HOME-files/main/.config/starship/starship.toml"

# Local strings
# Default: "$HOME\.config\starship.toml"
$starship_config = "$HOME\.config\starship\starship.toml" # Location for Starship Config


# FUNCTIONS #

function Set-DebugOption() { # Function to set debug option for every script
	if ( $debug_output ) { # Set DebugPreference to show Debug messages
		$DebugPreference = "Continue"
	}
	elseif ( [string]$debug_output -eq "Inquire" ) { # Set DebugPreference to stop for every Debug messages
		$DebugPreference = "Inquire"
	}
	else { # Set DebugPreference to the default value of SilentlyContinue
		$DebugPreference = 'SilentlyContinue'
	}
}

function Test-StarshipConfig() { # Function to check if a config for Starship is in place
	$check = Test-Path -Path $starship_config -PathType Leaf

	if ( $check ) {
		Write-Debug "Starship Found"
		$ENV:STARSHIP_CONFIG = $starship_config
	}
}
# else {
# 	Write-Debug "It works but no starship config file is found"
# 	$promt = Read-Host -Prompt "Do you want to download your starship config? (y/n)"
#
# 	if ( $promt -eq "y" ) {
# 		Write-Debug "Ok, ill download the config"
# 		Invoke-WebRequest $starship -OutFile $starship_config
# 		check_conf
# 	}
# 	else {
# 		Write-Debug "Ok, continuing with default config"
# 	}
# }

function Get-OsIcon() { # Function to Check OS type and assign it an icon for the os 
	if ( $IsWindows ) {
		Write-Debug "The OS is Microsoft Windows"
		$OSversion = [System.Environment]::OSVersion.Version.Major
		$OSbuild = [System.Environment]::OSVersion.Version.Build

		if ( $OSversion -eq '10' -or '11' -and $OSbuild -ge 22000 ) { 	# For Windows 11
			return ""
		}
		elseif ( $OSversion -eq '10' -and $OSbuild -le 19044) { 		# For Windows 10
			return ""
		}
		elseif ($OSversion -eq '8') { 									# For Windows 8
			return ""
		}
		elseif ($OSversion -eq '7') {									# For Windows 7
			return ""
		}
	}
	elseif ( $IsLinux ) { # ADD Linux support
		Write-Output "The Os is Linux"
	}
	elseif ( $IsMacOS ) { # ADD Mac support
		Write-Output "The OS is MacOS"
	}
}

function Get-Name() {
	if ([string]::IsNullOrEmpty($name)) {
		return ''
	}
	elseif ($name) {
		return $name+' '
	}
}


# MAIN SCRIPT #

Set-DebugOption
Test-StarshipConfig


# RUN STARSHIP
$ENV:STARSHIP_DISTRO = ((Get-OsIcon), (Get-Name))
Invoke-Expression (&starship init powershell)
