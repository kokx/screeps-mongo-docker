#!/bin/sh

(echo "system.resetAllData()" | npx screeps cli) & pid=$!

sleep 30
kill $pid

(echo "utils.addNPCTerminals()" | npx screeps cli) & pid=$!

sleep 5
kill $pid