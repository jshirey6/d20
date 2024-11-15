#!/usr/bin/bash 
# d20 roller data analysis script, no params 

echo "reading from file..." 

read -ra data < "/mnt/c/revature/d20/data.csv"

passes=0
fails=0

while IFS=, read -r roll mod status
do 
	allrolls+=($roll)
	if [[ $status == "Pass" ]]; then
		passes=$((passes+1))
	else 
		fails=$((fails+1))
	fi

done < /mnt/c/revature/d20/data.csv

source /mnt/c/revature/d20/library.sh

roll-average "${allrolls[@]}"

pass-percentage $passes $fails

echo "Passes: $passes" 
echo "Failures: $fails"

echo "$avg,$pp,$(date)" >> /mnt/c/revature/d20/statistics.csv
