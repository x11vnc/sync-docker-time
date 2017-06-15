#/bin/bash

if [ -f ~/Library/LaunchAgents/io.github.sync-docker-time.plist ];
then
  launchctl unload ~/Library/LaunchAgents/io.github.sync-docker-time.plist 2> /dev/null
  killall sleepwatcher-sdt 2> /dev/null

  rm -rf ~/Library/SyncDockerTime/
  rm -f ~/Library/LaunchAgents/io.github.sync-docker-time.plist
fi
