echo  " Enter the file name :"
	read  file
	if [  -f  "$file" ]
	then
	echo  "Enter the Starting line number:"
	read  snum
	echo  "Enter the Ending line number:"
	read  enum
	if  [ $snum  -lt  $enum ]
	then
	echo  "The selected lines from $snum line to $enum line in $file  :"
	sed  -n  '  '$snum','$enum' 'p'  ' $file
	else
	echo  "Enter proper starting & ending line numbers."
	fi
	else
	echo  "The file ' $file ' doesn't exists. "
	fi

