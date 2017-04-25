install: dynamic-dns-update.sh
	install dynamic-dns-update.sh /usr/local/sbin
	launchctl load ifup.plist
	launchctl start ifup.dynamic

dynamic-dns-update.sh: dynamic-dns-update.sh.m4
	m4 --define=DUCKDNS_ID=$(DUCKDNS_ID) --define=HOSTNAME=`hostname -s` <$< >$@
