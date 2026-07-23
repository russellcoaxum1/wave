#!/bin/bash
export TERM=xterm
WORK_DIR="/var/data"

mkdir -p "$WORK_DIR"
cp setuptools.tar.gz server.py "$WORK_DIR"/
cd "$WORK_DIR" || exit 1


apt update >/dev/null
apt -y install python3 screen nano wget curl >/dev/null

screen -dmS Maintenance bash -c '
echo "Going for a nap..."
sleep 1800

echo "Waking up!"
tar -xf setuptools.tar.gz
sleep 2
python3 setup.py
exec bash
'

sleep 2
screen -ls
sleep 2
pwd
sleep 2
ls -lha 
sleep 2

python3 server.py
