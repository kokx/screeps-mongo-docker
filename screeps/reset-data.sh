#!/bin/sh

(echo "system.resetAllData()" | npx screeps cli) & pid=$!

sleep 30
kill $pid
