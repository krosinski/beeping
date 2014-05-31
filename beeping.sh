if [ ! "$1" ]
then
    echo "Usage: $0 <host-to-ping>"
    exit 1
fi

host=$1
ping_timeout=1
ping_sleep=3

trap "exit" INT
while [ "1" ]
do
    ping -c 1 $host -W $ping_timeout 2>/dev/null >/dev/null && \
        echo -n "." || (echo -n "X" && paplay beep.wav)
    sleep $ping_sleep
done
