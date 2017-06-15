#/bin/bash

if [ ! -f ~/Library/SyncDockerTime/io.github.sync-docker-time.plist ];
then
  mkdir -p ~/Library/SyncDockerTime/
  curl https://github.com/x11vnc/sync-docker-time/archive/master.zip | \
      bsdtar xf -C ~/Library/SyncDockerTime/ --strip 1
  chmod a+x ~/Library/SyncDockerTime/bin/*
  ln -s -f ~/Library/SyncDockerTime/io.github.sync-docker-time.plist \
      ~/Library/LaunchAgents/
  launchctl load ~/Library/LaunchAgents/io.github.sync-docker-time.plist
fi
