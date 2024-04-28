#!/bin/bash
FRUITS=("Apple" "Bannana" "Oringe")

echo "1st fruit name =${FRUITS[0]}"
echo "2st fruit name =${FRUITS[1]}"
echo "3st fruit name =${FRUITS[2]}"

echi "All fruit names = ${FRUITS[@]}" # "@" అన్నీ రకాలు వస్తాయి అని అర్ధం.  