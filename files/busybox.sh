#!/bin/sh
#
# This File generates an output to two logfiles
#
 
i=0;
while true;
do
    echo "$i: $(date)" >> ${HOME}/elastic/1.log;
    echo "$(date) INFO $i" >> ${HOME}/elastic/2.log;
    echo "StdOut: $i: $(date)" 
    i=$((i+1));
    sleep 1;
done


# Get hostname
hostname=`hostname -A` 2> /dev/null

# Get distro
distro=`python -c 'import platform ; print platform.linux_distribution()[0] + " " +        platform.linux_distribution()[1]'` 2> /dev/null

# Get uptime
if [ -f "/proc/uptime" ]; then
uptime=`cat /proc/uptime`
uptime=${uptime%%.*}
seconds=$(( uptime%60 ))
minutes=$(( uptime/60%60 ))
hours=$(( uptime/60/60%24 ))
days=$(( uptime/60/60/24 ))
uptime="$days days, $hours hours, $minutes minutes, $seconds seconds"
else
uptime=""
fi

echo $hostname
echo $distro
echo $uptime

