#!/usr/bin/env pwsh, powershell

#-----------------------[Requirements]-----------------------#

# - PowerShell Core (dahh) 	- Script made with version 7.2.2
# - Starship				- https://www.starship.rs/
# - NerdFont				- https://www.nerdfonts.com/

#-----------------------[SETTINGS]-----------------------#

# Custom Name:
# - Starship config to handle the username (Disabled by default)
# - No username showing in terminal
$username = '' # Default = ''

# Debug output
# Only use for debugging code
# NOTE: This will enable it for all scripts and modules.
# Options = '' / $false / $true / "Inquire"
$debug_output = '' #Default = ''

# Location for Starship Config
$starship_config = "$HOME\.config\starship\starship.toml" # Default: "$HOME\.config\starship.toml"


#-----------------------[START OF CODE]-----------------------#


#-----------------------[FUNCTIONS]-----------------------#

function Set-DebugOption() { # Function to set debug option for every script
	if ([string]::IsNullOrEmpty($debug_output)) {
		$DebugPreference = 'SilentlyContinue'
	}
	elseif ( $debug_output ) { # Set DebugPreference to show Debug messages
		$DebugPreference = "Continue"
	}
	elseif ( [string]$debug_output -eq "Inquire" ) { # Set DebugPreference to stop for every Debug messages
		$DebugPreference = "Inquire"
	}
	else { # Set DebugPreference to the default value of SilentlyContinue
		$DebugPreference = 'SilentlyContinue'
	}
}

function Set-StarshipConfig() { # Function to check if a config for Starship is in place
	$check = Test-Path -Path $starship_config -PathType Leaf

	if ( $check ) { # See if Starship config exits
		Write-Debug "Starship Found"
		return $starship_config
	}
	elseif (!$check) { # Config does not exist
		Import-Module -Name $HOME/Documents/PowerShell/PSStarship.psm1
		Get-StarshipConfig
		Remove-Module -Name PSStarship
		Set-StarshipConfig
	}
}

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

function Get-Name() { # TODO Prompt asking to write a username
	if ([string]::IsNullOrEmpty($username)) {
		return ''
	}
	elseif ($username) {
		return $username+' '
	}
}


#-----------------------[RUN OPTIONS]-----------------------#

Set-DebugOption


#-----------------------[RUN STARSHIP]-----------------------#
$ENV:STARSHIP_CONFIG = ((Set-StarshipConfig))
$ENV:STARSHIP_DISTRO = ((Get-OsIcon), (Get-Name))
Invoke-Expression (&starship init powershell)