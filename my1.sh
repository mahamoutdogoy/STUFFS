#!/bin/bash
# ./down.sh start_number end_number
# need to have the site cookies in the specified folder. Browser extensions can be used to export cookies to file
n=$1
l=$2
dn=`echo $1-$2`
rm -Rf $dn
mkdir $dn 
cd $dn
# Get the default image 1sss
wget -R -d --load-cookies ~/Desktop/hk/cookies.txt  -U "Mozilla/6.0 (Windows NT 6.2; WOW64; rv:16.0.1) Gecko/20121011 Firefox/16.0.1"  "https://kp.christuniversity.in/KnowledgePro/images/StudentPhotos/218392.jpg?2016-06-02%2019:15:34.0-SRMHR_SHOW_PERSON_PHOTO&personId=13"   &> /dev/null

# Get the default image 2
wget -R -d --load-cookies ~/Desktop/hk/cookies.txt  -U "Mozilla/6.0 (Windows NT 6.2; WOW64; rv:16.0.1) Gecko/20121011 Firefox/16.0.1"  "https://ums.university.edu:8443/ums/FileUploadServlet?action=UMS-SRMHR_SHOW_PERSON_PHOTO&personId=1"   &> /dev/null

mv "./FileUploadServlet?action=UMS-SRMHR_SHOW_PERSON_PHOTO&personId=13" ./s13
mv "./FileUploadServlet?action=UMS-SRMHR_SHOW_PERSON_PHOTO&personId=1" ./s1

ss=$?
if [ $ss -eq 0 ]
then
	while [ $n -le $l  ]
	do
		echo $n
		wget -R -d --load-cookies ~/Desktop/hk/cookies.txt  -U "Mozilla/6.0 (Windows NT 6.2; WOW64; rv:16.0.1) Gecko/20121011 Firefox/16.0.1"  "https://ums.university.edu:8443/ums/FileUploadServlet?action=UMS-SRMHR_SHOW_PERSON_PHOTO&personId=$n"  &> /dev/null 
		cmp "./s1" "./FileUploadServlet?action=UMS-SRMHR_SHOW_PERSON_PHOTO&personId=$n"  > /dev/null
		if [ $? -eq 0 ]
		then
			rm "FileUploadServlet?action=UMS-SRMHR_SHOW_PERSON_PHOTO&personId=$n" &> /dev/null
		else
			cmp "./s13" "./FileUploadServlet?action=UMS-SRMHR_SHOW_PERSON_PHOTO&personId=$n"  > /dev/null
			if [ $? -eq 0 ]
			then
				rm -f  "FileUploadServlet?action=UMS-SRMHR_SHOW_PERSON_PHOTO&personId=$n" &> /dev/null
			else
				mv "FileUploadServlet?action=UMS-SRMHR_SHOW_PERSON_PHOTO&personId=$n" "$n.jpeg"
			
			fi	
		fi
		n=`expr $n + 1`
	done
	rm -f "./s1" &> /dev/null
	rm -f "./s13" &> /dev/null
else
	echo "Error"
fi
