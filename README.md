Drivers
=======

- Bash doesn't source /etc/profile.d/, /etc/bash.d/ (or similar) in Ubuntu/Debian (bug [#675008](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=675008)) for interactive sessions. minos-core-settings depends on this feature to inject their own preferences (/etc/profile.d/minos-bash.sh).

- Skel bashrc doesn't source ~/.profile.d, /etc/bash.d/ or similar. Minos packages may add their own skel ~/.profile.d/files.sh

- minos-core-settings sets bash to vi mode by default, and no vi mode options exist currently in /etc/inputrc, so I add some

Editing directly /etc/bash.bashr and other affected files could work initially but would break every time bash gets an update. Freezing bash isn't a good idea, and I don't want to maintain such huge package. So the best idea I could think of was to create ppa recipes responsible of merging lp:ubuntu-lts-releases/bash with this repository and publishing the results to lp:minos/archive
