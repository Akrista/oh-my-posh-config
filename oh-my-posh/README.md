# oh-my-posh-config

## Installation

On Powershell, install this modules with the following command:

```powershell
Install-Module oh-my-posh -Scope CurrentUser
Install-Module PSReadLine -AllowPrerelease -Force
Install-Module -Name Terminal-Icons -Repository PSGallery

```

To install zoxide, run this command in your command prompt:

```powershell
curl.exe -A "MS" https://webinstall.dev/zoxide | powershell
```

Alternatively, you can use a package manager:

| Repository    | Instructions                          |
| ------------- | ------------------------------------- |
| **crates.io** | `cargo install zoxide --locked`       |
| Chocolatey    | `choco install zoxide`                |
| conda-forge   | `conda install -c conda-forge zoxide` |
| Scoop         | `scoop install zoxide`                |

To install gsudo, run this command in your command prompt:

Using Scoop: scoop install gsudo
Or using WinGet winget install gerardog.gsudo
Or using Chocolatey: choco install gsudo
Or manually: Unzip the latest release, and add to the path.
Or running:

```powershell
PowerShell -Command "Set-ExecutionPolicy RemoteSigned -scope Process; [Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iwr -useb https://raw.githubusercontent.com/gerardog/gsudo/master/installgsudo.ps1 | iex"
```

Check your $PROFILE

After this, be sure to set your $profile as the same you found on this repository.
