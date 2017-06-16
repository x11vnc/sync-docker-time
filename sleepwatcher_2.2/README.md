# SleepWatcher

SleepWatcher is a command line tool (daemon) that monitors sleep, wakeup and idleness of a Mac. It was developed by Bernhard Baehr. It can be used to execute a Unix command when the Mac or the display of the Mac goes to sleep mode or wakes up, after a given time without user interaction or when the user resumes activity after a break or when the power supply of a Mac notebook is attached or detached. It also can send the Mac to sleep mode or retrieve the time since last user activity.

## Installation

### Uninstall Previous Versions
If you have previously installed SleepWatcher 2.1 or earlier, please uninstall the older version manually first by running the following commands:
```
make uninstall
sudo make uninstall_root
```

### Install as Regular User
If you use SleepWatcher on a single user Mac and only want to execute your own .sleep and .wakeup scripts, it is suggested for you to run SleepWatcher as a regular user. You can install using the following command:
```
make
make install
```

Now SleepWatcher will start running. You can create executable files $HOME/.sleep and $HOME/.wakeup in their home directories, which will be executed when the Mac goes to sleep mode or wakes up. SleepWatcher will stop when you log off from the Mac and it will be restarted automatically when you log in again.


### Install as Root
If you want to install SleepWatcher for all users, run the following commands:
```
make
sudo make install_root
```

Now SleepWatcher will start running. Mac users can create executable files $HOME/.sleep and $HOME/.wakeup in their home directories, which will be executed when the Mac goes to sleep mode or wakes up. When you reboot the Mac, SleepWatcher is started automatically via launchd.
