# library script has two functions: 
# roll-average() - input is an array of all roll values from data.sh
# 	finds average value of all recorded rolls
# pass-percentage() - two parameters, num passes and num fails
# 	calculates the percentage of passes of all rolls

roll-average() {
	
	sum=0
	local rollsarr=($@)
	
	for value in ${rollsarr[@]}; do 
		sum=$((sum+value))
	done 
	
	len=${#rollsarr[@]}
	avg=$((sum/len))
	echo "Average of all raw dice rolls is $avg"
}

pass-percentage() {
	pp=$(( ($1 * 100) / ($2 + $1) ))
	# pp=$(echo "scale =2; ($1 / $2) * 100" | bc)
	echo "Pass/Fail Percentage is $pp percent pass"
}
