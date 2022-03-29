# Windows scripts and such

## Everything is WIP!

Here I will store all files that I use to customize my windows experience.

This will grow over time.

Im just starting to learn coding and having fun so don't be to harsh if you find this.



---

## PowerShell Profile

 (/Documents/PowerShell/Microsoft.PowerShell_profile.ps1)

This is a PowerShell Profile that I originally made because the starship config only used the system username. I don't like the username Microsoft gave my account (in C:/Users/) so I wanted to set the Username for myself and make it possible for others to change that value as they see fit.



---

## PSStarship Module

(/Documents/PowerShell/PSStarship.psm1)

This is a module I made so that things that dont need to be ran all the time could be in another file to not clog up the profile file.



---

## Starship Config

(/.config/starship/starship.toml)

This is the config I customized to fit my need.

There are many options commented out that I have not used or looked at yet but this will likely change over time.

This is inspired by xcad2k's config ([dotfiles/starship.toml](https://github.com/xcad2k/dotfiles/blob/main/.config/starship.toml))



---

## Git Ignore file

(.gitignore)

I included this because if you choose to Fork this or Clone it wont try to upload everything in your Windows Home location if you choose to upload it to your own repo.

It's setup to only include the files in this repo.
