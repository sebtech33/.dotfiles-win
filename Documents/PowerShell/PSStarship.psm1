$starship = "https://raw.githubusercontent.com/sebtech33/Windows-HOME-files/main/.config/starship/starship.toml"

function Install-Starship() { # ADD Automated Starship install
    Write-Host "Hello there, module imported"
}
function Get-StarshipConfig() {
    Write-Debug "No userdefined Starship config found"
    $prompt = Read-Host -Prompt "Do you want to download SebTech33's Starship config? (yes/no/never)"

    if ( $prompt -eq "y" -or "yes" ) {
        Write-Debug "Ok, i'll try to download that config file."
        Invoke-WebRequest $starship -OutFile $starship_config

        # try {
        #     Invoke-WebRequest $starship -OutFile $starship_config
        # }
        # catch {
        #     $StatusCode = $_.Exception.Response.StatusCode.value__
        # }
        # Write-Host $StatusCode
    }
}

Export-ModuleMember -Function *
#Export-ModuleMember -Function Install-Starship, Get-StarshipConfig


# else {
#     Write-Debug "It works but no starship config file is found"
#     $promt = Read-Host -Prompt "Do you want to download your starship config? (y/n)"
    
#     if ( $promt -eq "y" ) {
#         Write-Debug "Ok, ill download the config"
#         Invoke-WebRequest $starship -OutFile $starship_config
#         check_conf
#     }
#     else {
#         Write-Debug "Ok, continuing with default config"
#     }
# }