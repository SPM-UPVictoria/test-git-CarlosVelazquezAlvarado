
#!/bin/sh
# locate--Searches the locate database for the specified pattern.

locatedb="/tmp/locate.db"

exec grep -i "$@" $locatedb
