#/bin/bash

if [ -f ~/Library/LaunchAgents/io.github.sync-docker-time.plist ];
then
  launchctl list | grep -q io.github.sync-docker-time.plist &&
    launchctl unload ~/Library/LaunchAgents/io.github.sync-docker-time.plist
  rm -f ~/Library/LaunchAgents/io.github.sync-docker-time.plist
  rm -rf ~/Library/SyncDockerTime/
fi
