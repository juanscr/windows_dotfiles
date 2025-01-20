# My Windows Dotfiles
As I have always used Arch Linux and Window Tilling Managers on my own, when I
moved for working for Microsoft using Windows again was a challenge. In this
documentation, you'll find everything that I did and all my dotfiles for my
Windows installation in order to make it as similar as possible for maximizing
performance.

## Setup
To setup my dotfiles, first clone the bare repository in the desired place.

```powershell
git clone --bare git@github.com:juanscr/windows_dotfiles.git
```

Then, use the following command to get all the files from the repository and, for
usability, stop showing files not uploaded to git.

```powershell
Function DotfilesGit {git --git-dir=$HOME\path\to\repository --work-tree=$HOME @args}
Set-Alias -name dfiles -Value DotfilesGit
dfiles config status.showUntrackedFiles no
dfiles restore --staged .
dfiles checkout .
```

And there you go. Happy tinkering!
## Table of Contents
- [Programs I install](#programs)
- [My PowerToys config](#power-toys)
- [AutoHotkey at LogOn](#ahk-setup)
- [WinUtil for the win](#winutil)
- [Tiling in Windows](#tiling)
- [GlazeWM FTW!](#glazewm)

<a name="programs"></a>
## Programs
First, as a package manager I use [scoop](https://github.com/ScoopInstaller/Scoop).
After installing `scoop` I install the following programs through it:

- `neovim`: Text command line editor. For my installation to work, it must also
be installed `zig` and `node` for treesitter support.
- `git`: Version control.
- `sudo`: Sudo for windows.
- `eza`: Ls but in Rust.
- `glazewm`: Tilling window management for windows.
- `autohotkey`: Automate scripts and bind to keybinds.
- `unzip`: Unzip utility.
- `fd`: Fuzzy finder.
- `ripgrep`: Recursively search in directories.
- `grep`: Print lines matching a pattern.

Additionally, through the windows store I install:

- [Power Toys](https://github.com/microsoft/PowerToys): Windows system
utilities for power users.

Also, using `winget` I install [powershell](https://github.com/PowerShell/PowerShell)
for replacing Windows Powerhsell as it is a much faster and improved alternative
from the default shell as such:

```powershell
winget install --id Microsoft.Powershell --source winget
```

<a name="power-toys"></a>
## My Power Toys Configuration
Microsoft PowerToys is a set of utilities for power users to tune and
streamline their Windows experience for greater productivity. This is great as it
allows for adding features and customizing a lot of the default experience for Windows.

I use the following modules from power toys:

- Awake: Keep your PC awake
- Color picker: utility for seeing RGB of current color on screen. Mapped to
Win+Shift+C.
- PowerToys Run: A quick application launcher like dmenu.
- Environment Variables: Quick way to manage environment variables in system.
- Keyboard Manager: utility for remapping keys. I remapped Escape and Caps-lock using
this.

### PowerToys Run
For running the PowerToys Run utility, I map it to my common keybind in my other window
managers `Win+d` to launch it. Additionally, I disable all plugins except for two:

- Program: Search for programs to launch.
- Windows settings: Search for settings to modify.

<a name="ahk-setup"></a>
## Setting up AHK at LogIn
It is a good idea to setup AutoHotkeys to run when you login to your system, so you
have everything setup and running when you login with your user. This can be done
simply with the Task Scheduler provided by Windows.

To setup the task, first open the Task Schedule and create a new task. At the general
tab, make sure to change the "Configure for:" option to "Windows 10" as such:

![first-tab-error](./Pictures/assets/first-window.png)

After that, setup a new trigger, select "At log on" as the trigger and change to
only run when "Specific user:" is yours (it should be automatically set if you are
logged in as your user). I also activate a delay on the trigger as for some weird
reason without it AHK would fail to start.

Then, set the action and as the script set the path to the
`autohotkey` executable and, as an argument, the path to the autohotkey configuration
you want. You should have something similar as:

![actions-error](./Pictures/assets/action.png)

Lastly, go to the conditions tab and remove the checkmark so it runs the task
everytime, even if the computer is not connect to AC as such:

![conditions-error](./Pictures/assets/conditions.png)

<a name="winutil"></a>
## WinUtil Tweaks
[WinUtil](https://christitustech.github.io/winutil/) is a set of windows utilities and
set of scripts for customizing the Windows experience for a more minimal and faster
experience. I have found this pretty useful as it automates a lot of valuable tasks and
debloating easily my Windows installation.

The following tweaks I apply are:

- Disable ConsumerFeatures
- Disable Telemetry
- Disable GameDVR
- Disable hibernation
- Disable homegroup
- Disable wifi sense
- Change Windows Terminal default: PowerShell 5 -> PowerShell 7
- Disable Powershell 7 Telemetry
- Set services to manual

I also turn off the following features:

- Bing Search in Start Menu
- Snap Window
- Snap Assist Flyout
- Snap Assist Suggestion

I also suggest running once in a while the "Run Disk Cleanup" for cleaning up
storage space.

<a name="tiling"></a>
## Tiling in Windows
I initially tested `komorebi` for personal purposes and try to create a production
environment for it. Although it is a good project, it has two things I don't like:

- It is slow, at least compared with `glazewm`.
- For usage at work, one needs to buy an individual commercial license.

Although I am not against charging for using a tool such as `komorebi`, I find the
pricing not worth it as you would have to pay monthly. As such, I decided to go with
`glazewm` instead.

`glazewm` is a tilling window manager based on i3. Although I loved the preset
workspace layouts `komorebi` had, glaze wins massively in performance. Additionally,
`glazewm` is FOSS which allows all types of use in all scenarios, which I deeply
support.

<a name="glazewm"></a>
## GlazeWM FTW!
For setting `glazewm`, first through Power Toys create the environment variable
`GLAZEWM_CONFIG_PATH` to `C:\Users\youruserhere\.config\glazewm\config,yaml` so it can
properly load the configuration I created. After that, everything will work with my
configuration which you can modify at your will.
