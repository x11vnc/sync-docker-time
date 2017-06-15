#
#	Makefile for sleepwatcher
#
#	21.11.2004 bb	created
#	05.05.2005 bb	removed Carbon framework, target clean added
#	23.04.2006 bb	produce a Universal binary of sleepwatcher
#	02.04.2010 bb	-macosx-version-min=10.3 => 10.4
#	06.15.2017 xj	Changed to support intel only
#

CFLAGS = -O3 -prebind -mmacosx-version-min=10.4
LIBS   = -framework IOKit -framework CoreFoundation

BINDIR=/usr/local/sbin
MANDIR=/usr/local/man

sleepwatcher: src/sleepwatcher.c
	$(CC) $(CFLAGS) -o sleepwatcher src/sleepwatcher.c $(LIBS)

install: sleepwatcher
	mkdir -p ~/Library/SleepWatcher/bin
	cp sleepwatcher ~/Library/SleepWatcher/bin
	mkdir -p ~/Library/LaunchAgents
	cp config/de.bernhard-baehr.sleepwatcher-20compatibility-localuser.plist ~/Library/LaunchAgents/de.bernhard-baehr.sleepwatcher.plist
	touch ~/.sleep ~/.wakeup
	launchctl load ~/Library/LaunchAgents/de.bernhard-baehr.sleepwatcher.plist

uninstall:
	launchctl list | grep -q de.bernhard-baehr.sleepwatcher &&
    launchctl remove de.bernhard-baehr.sleepwatcher || true
	killall sleepwatcher || true
	rm -rf ~/Library/SleepWatcher
	rm -f ~/Library/LaunchAgents/de.bernhard-baehr.sleepwatcher.plist

install_root: sleepwatcher man/sleepwatcher.8
	mkdir -p $(BINDIR)
	install -o root -g wheel -m 755 sleepwatcher $(BINDIR)
	mkdir -p $(MANDIR)/man8
	install -o root -g wheel -m 644 man/sleepwatcher.8 $(MANDIR)/man8
	cp config/de.bernhard-baehr.sleepwatcher-20compatibility.plist /Library/LaunchDaemons/de.bernhard-baehr.sleepwatcher.plist
	cp config/rc.* /etc
	launchctl load /Library/LaunchDaemons/de.bernhard-baehr.sleepwatcher.plist

uninstall_root:
	launchctl list | grep -q de.bernhard-baehr.sleepwatcher &&
    launchctl remove de.bernhard-baehr.sleepwatcher || true
	killall sleepwatcher || true
	rm -rf /Library/StartupItems/SleepWatcher
	rm -f /usr/local/sbin/sleepwatcher /usr/local/share/man/man8/sleepwatcher
	mv /Library/LaunchDaemons/de.bernhard-baehr.sleepwatcher.plist ~/.Trash || true
	mv /etc/rc.sleep /etc/rc.wakeup ~/.Trash || true

clean:
	rm -f sleepwatcher
