## About

- Bash doesn't source /etc/profile.d/, /etc/bash.d/ (or similar) in Ubuntu/Debian (bug [#675008](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=675008)) for interactive sessions. minos-core-settings depends on this feature to inject their own preferences (/etc/profile.d/bash-minos.sh).

- Skel bashrc doesn't source ~/.profile.d, /etc/bash.d/ or similar. Minos packages may add their own skel ~/.profile.d/files.sh, therefore a new skel bashrc file is provided

- minos-core-settings sets bash to vi mode by default but no vi mode options exist currently in /etc/inputrc, this repository add those, specially vim-objects =)_

- command_not_found_handle function is executed every time a command is not found, this repository adds a call to `dmenu-run` provided by the minos-tools-extra package which adds math operations, web searches, currency conversion, etc within the default interactive shell.

## Quick start

### On Ubuntu (only LTS releases)

1. Set up the minos archive:

   ```
   $ sudo add-apt-repository ppa:minos-archive/main
   ```

2. Install:

   ```
   $ sudo apt-get update && sudo apt-get install bash-minos-settings
   ```

3. Enjoy ☺!

## Feedback

Please drop me an [email](mailto:m@javier.io) with your suggestions or open [an issue](https://github.com/minos-org/bash-minos-settings/issues) with your comments.
