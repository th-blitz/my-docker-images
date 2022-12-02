#!/bin/bash

CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup --"
    # YOUR_JUST_ONCE_LOGIC_HERE
else
    echo "-- Not first container startup --"
fi


source="" && destination="" && target="server@some.server.com" && ssh $target -p 8080 ls $source | xargs -n1 -P4 -I% rsync --rsh='ssh -p8080' -avP $target:$source/% $destination


hydra -L users.txt -P passwords.txt ssh://172.1.40.33 -t 4