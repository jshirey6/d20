#!/usr/bin/bash 
# d20 roller, param 1 = save dc param 2 = roll modifier 

dc=$1 
mod=$2 

echo "rolling a d20" 

natroll=$((1 + $RANDOM % 20)) 

echo "umodified roll: $natroll"

if [[ $natroll -eq 20 ]]; then
	echo "Nat 20! Critical Success!"
elif [[ $natroll -eq 1 ]]; then 
	echo "Critical Failure!"
fi

result=$(($natroll + $mod))

echo "result: $result"

if [[ $result -lt $dc ]]; then 
	echo "Failed!" 
	echo "$natroll,$mod,Fail" >> data.csv
else 
	echo "Passed!" 
	echo "$natroll,$mod,Pass" >> data.csv
fi
