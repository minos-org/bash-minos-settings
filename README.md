Drivers
=======

- Bash doesn't source /etc/profile.d/, /etc/bash.d/ (or similar) in Ubuntu/Debian (bug [#675008](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=675008)) for interactive sessions. minos-core-settings depends on this feature to inject their own preferences (/etc/profile.d/minos-bash.sh).

- Skel bashrc doesn't source ~/.profile.d, /etc/bash.d/ or similar. Minos packages may add their own skel ~/.profile.d/files.sh

- minos-core-settings sets bash to vi mode by default, and no vi mode options exist currently in /etc/inputrc

Editing directly /etc/bash.bashrc and other affected files could work initially but would break every time bash gets updated. Freezing bash isn't a good idea, and I don't want to maintain such huge package. So the best idea I could think of was to automatically mix lp:ubuntu/bash and these files and publish the result to lp:minos/archive

Special procedure
=================

Due to bug #LP-760201 and others it's not possible to override files into debian/, therefore the common recipe (used in all others minos packages) doesn't work here (ideas to normalize this are welcome =)!

    lp:ubuntu/bash
    merge deb lp:~minos-archive/minos/minos-bash-tweaks

    lp:ubuntu/bash
    nest-part deb lp:~minos-archive/minos/minos-bash-tweaks debian debian

So this package is created by an special procedure (executed everyday at midnight somewhere)

    bzr branch lp:ubuntu/bash
    git clone  https://github.com/minos-org/minos-bash-tweaks
    git clone  https://github.com/minos-org/minos-bash

    rm -rf     minos-bash/*
    mv         bash/* minos-bash/
    mv         minos-bash-tweaks/debian/* minos-bash/debian/
    cd         minos-bash && git push

There exist a regular syncronization with lp, at lp:minos-archive/minos-bash which builds the actual packages a few hours after a new mix is pushed.
