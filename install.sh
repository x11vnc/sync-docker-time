#/bin/bash

if [ ! -f ~/Library/SyncDockerTime/io.github.sync-docker-time.plist ];
then
  mkdir -p ~/Library/SyncDockerTime/
  curl -L -s https://github.com/x11vnc/sync-docker-time/archive/master.zip | \
      bsdtar xf - -C ~/Library/SyncDockerTime/ --strip-components 1
  rm -rf ~/Library/SyncDockerTime/sleepwatcher_2.2
  chmod a+x ~/Library/SyncDockerTime/bin/*
  ln -s -f ~/Library/SyncDockerTime/io.github.sync-docker-time.plist \
      ~/Library/LaunchAgents/
  launchctl load ~/Library/LaunchAgents/io.github.sync-docker-time.plist
fi
