## About

- Bash doesn't source /etc/profile.d/, /etc/bash.d/ (or similar) in Ubuntu/Debian (bug [#675008](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=675008)) for interactive sessions. minos-core-settings depends on this feature to inject their own preferences (/etc/profile.d/minos-bash.sh).

- Skel bashrc doesn't source ~/.profile.d, /etc/bash.d/ or similar. Minos packages may add their own skel ~/.profile.d/files.sh, therefore a new skel bashrc file is provided

- minos-core-settings sets bash to vi mode by default but no vi mode options exist currently in /etc/inputrc, this repository add those, specially vim-objects =)_

## Quick start

1. Set up the minos archive:

   ```
   $ sudo add-apt-repository ppa:minos-archive/main
   ```

2. Install:

   ```
   $ sudo apt-get update && sudo apt-get install minos-bash-tweaks
   ```

3. Enjoy ☺!

## Uninstalling

If by any reason you dislike these settings you can uninstall by running:

   ```
   $ sudo apt-get remove minos-bash-tweaks
   ```

## Feedback

Please drop me an [email](mailto:m@javier.io) with your suggestions or open [an issue](https://github.com/minos-org/minos-bash-tweaks/issues) with your comments.
