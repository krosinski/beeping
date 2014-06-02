if [ ! "$1" ]
then
    echo "Usage: $0 <host-to-ping>"
    exit 1
fi

host=$1
ping_timeout=1
ping_sleep=3

function beeeep {
    if [ "$(uname)" == "Darwin" ]
    then
        afplay beep.wav
    elif [ "$(uname)" == "Linux" ]
    then
        paplay beep.wav
    fi
}

trap "exit" INT
while [ "1" ]
do
    ping -c 1 $host -W $ping_timeout 2>/dev/null >/dev/null && \
        echo -n "." || (echo -n "X" && beeeep)
    sleep $ping_sleep
done
