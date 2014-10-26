Driver
======

Bash doesn't source /etc/profile.d/ neither /etc/bash.d (or similar) in Ubuntu/Debian (bug [#675008](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=675008)) for interactive sessions. minos-core-settings depends on this feature to inject their own preferences (/etc/profile.d/minos-bash.sh).

Editing directly /etc/bash.bashrc could work initially but would break every time bash gets an update. Freezing bash isn't a good idea, and I don't want to maintain such huge package. So the best idea I could think of was to create ppa recipes responsible of merging lp:ubuntu-lts-releases/bash with this repository and publishing the results to lp:minos/archive
