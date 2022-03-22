# Debug output
#$term_output = $true

# Online Strings
$starship = "https://raw.githubusercontent.com/sebtech33/Windows-HOME-files/main/.config/starship/starship.toml"

# Local strings
$starship_config = "$HOME\.config\starship\starship.toml"
$enable = $true


function check_conf {
	$check = Test-Path -Path $starship_config -PathType Leaf

	Clear-Host
	
	if ( $check -eq $true )
	{
		Write-Output "Starship Loaded"
		Start-Sleep -s 0.5
		$ENV:STARSHIP_CONFIG = $starship_config
	}
	else{
		Write-Output "It works but no starship config file is found"
		$promt = Read-Host -Prompt "Do you want to download your starship config? (y/n)"
		if ( $promt -eq "y" )
		{
			Write-Output "Ok, ill download the config"
			Invoke-WebRequest $starship -OutFile $starship_config
			check_conf
		}
		else {
			Write-Output "Ok, continuing with default config"
		}
	}
}




check_conf

#Start-Sleep -s 3
Clear-Host

#$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"

#$ENV:STARSHIP_CONFIG = $starship_config
$ENV:STARSHIP_DISTRO = "? SebTech33"
Invoke-Expression (&starship init powershell)
