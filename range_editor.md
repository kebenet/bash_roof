

[get range]: from_files
get line fzy
# get json object
# change remove append object
	 [change remove append]: object item

# Extension Pattern
# exclude dir pattern
# rc files

rnd all file pattern

# Undo all [Change Remove Append]
	save undo information on single file
	[what to save]
	filename or variable file
	line index if line mode
	array index from json list
	key and value
	value
undo single or multiple editing => maybe can delete in 10 days

# 
while IFS="=" read -r key value
do
    mydict["$key"]="$value"
done < "yourfile.txt"

# print all keys and values
for key in "${!mydict[@]}"
do
    echo "$key=${mydict[$key]}"
done

cat file.txt | todict | key sublime | ext | find select
| editline | temp | edit | 