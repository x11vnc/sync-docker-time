# Sync Docker Time for Mac

`sync-docker-time` is a tool for syncing the clocks in Docker for Mac's HyperKit VM. As of release 17.03.1, the Docker daemon fails to update the VM's time after the computer wakes up from sleep. This results in a lag of the clocks in the Docker containers. This can lead to compilation errors, authentication errors, etc.

## Installation

To install, run the following command:

`curl -L -s https://raw.githubusercontent.com/x11vnc/sync-docker-time/master/install.sh | bash`

## Uninstallation

To uninstall, run the following command:

`curl -L -s https://raw.githubusercontent.com/x11vnc/sync-docker-time/master/uninstall.sh | bash`

## Attributions
This package utilizes a customized version of [SleepWatcher 2.2](http://www.bernhard-baehr.de/) and the Docker image [`walkerlee/nsenter`](https://github.com/walkerlee/docker-nsenter). Its idea is similar to [`docker-time-sync-agent`](https://github.com/arunvelsriram/docker-time-sync-agent), but with improved responsiveness and reliability: `sync-docker-time` would update the clock almost immediately after the computer wakes up (instead of waiting for 30 seconds), and it also checks the output of the `ntpd` process to avoid missing time updates.
