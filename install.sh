#/bin/bash

if [ ! -f ~/Library/SyncDockerTime/io.github.sync-docker-time.plist ];
then
  mkdir -p ~/Library/SyncDockerTime/log

  if [[ "$0" == "bash" ]]; then
    # Running in a pipe. Always download latest version
    curl -L -s https://github.com/x11vnc/sync-docker-time/archive/master.zip | \
        bsdtar xf - -C ~/Library/SyncDockerTime/ --strip-components 1
    rm -rf ~/Library/SyncDockerTime/sleepwatcher_2.2
    chmod a+x ~/Library/SyncDockerTime/bin/*
  else
    # Running locally
    cp -r bin io.github.sync-docker-time.plist LICENSE uninstall.sh ~/Library/SyncDockerTime/
  fi

  ln -s -f ~/Library/SyncDockerTime/io.github.sync-docker-time.plist \
      ~/Library/LaunchAgents/
  perl -e "s/\~/\/Users\/$USER/g" -p -i ~/Library/SyncDockerTime/io.github.sync-docker-time.plist

  launchctl unload ~/Library/LaunchAgents/io.github.sync-docker-time.plist 2> /dev/null
  launchctl load ~/Library/LaunchAgents/io.github.sync-docker-time.plist

  # Try to run sync-docker-time once and also check launchctl
  ~/Library/SyncDockerTime/bin/sync-docker-time > ~/Library/SyncDockerTime/log/stdout.log && \
    launchctl list io.github.sync-docker-time | grep -q '"LastExitStatus" = 0'

  if [ $? -eq '0' ]; then
    echo "SyncDockerTime was installed successfully"
  else
    echo "Installation of SyncDockerTime has failed"
  fi
else
  echo "SyncDockerTime already exists. Please uninstall first by running uninstall.sh."
fi
