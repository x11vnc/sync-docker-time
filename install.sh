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
  perl -e "s/\~/\/Users\/$USER/g" -p -i ~/Library/SyncDockerTime/io.github.sync-docker-time.plist

  launchctl unload ~/Library/LaunchAgents/io.github.sync-docker-time.plist 2> /dev/null
  launchctl load ~/Library/LaunchAgents/io.github.sync-docker-time.plist
  launchctl list io.github.sync-docker-time | grep -q '"LastExitStatus" = 0'

  if [ $? -eq '0' ]; then
    echo "sync-docker-time was installed successfully"
  else
    echo "Installation of sync-docker-time has failed"
  fi
fi
