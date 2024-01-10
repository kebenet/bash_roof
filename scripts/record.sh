#!/bin/bash
#FILE! Save Undo information

saperator='<:=:>'
file="$TT_CONFIG/undo_line.ttdb"
#TODO! case Undo? change and replace value to file


load(){

	line=$(tail -n 1 "${file}" | tr "${saperator}" ' ')

	echo "${line}"
	
}

remove(){

	#CODE! remove last line using sed 
	sed -i "$ d" "$file"
}

save(){
	echo "${1}${saperator}${2}${saperator}${3}" >> "${file}"
}


# Check if the first parameter is "load"
if [ "$1" = "load" ]; then

  load

elif [ "$1" = "save" ]; then
  	echo "${2}${saperator}${3}${saperator}${4}" >> "${file}"

elif [ "$1" = "remove" ]; then
	
  	sed -i "$ d" "$file"

else
  echo "1st Argument must be load or save"
  exit 7
fi
