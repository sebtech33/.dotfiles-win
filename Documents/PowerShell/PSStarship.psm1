$starship = "https://raw.githubusercontent.com/sebtech33/Windows-HOME-files/main/.config/starship/starship.toml"


#-----------------------[FUNCTIONS]-----------------------#
function Install-Starship() { # ADD Automated Starship install
    Write-Output "Hello there, this does not do anything yet"
}
function Get-StarshipConfig() {
    Write-Debug "No userdefined Starship config found"
    $prompt = Read-Host -Prompt "Do you want to download SebTech33's Starship config? (yes/no/never)" # TODO Add a never option somhow

    if ( $prompt -eq "y" -or "yes" ) {
        Write-Debug "Ok, i'll try to download that config file."
        Invoke-WebRequest $starship -OutFile $starship_config
    }
}

#-----------------------[EXPORT ALL FUNCTIONS]-----------------------#

Export-ModuleMember -Function *