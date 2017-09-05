#!/bin/bash
old_IFS=$IFS
IFS=$(echo -en "\n\b")
FolderPath="/usr/local/tomcat-8.0.32/webapps/ROOT/upload"
VODPath="/data/vod/source/"
MonFolder=`date +"%Y%m"`
SevenDayFDate=`date -d "7 day ago" +%Y%m`
if [ ${MonFolder} == ${SevenDayFDate} ]
then
	DataPath=${VODPath}${MonFolder}
	echo $DataPath
else
	DataPath=${VODPath}${SevenDayFDate}
	echo $DataPath
fi

SystemDate=`date +"%Y-%m-%d"`
SevenDayDate=`date -d "7 day ago" +%Y-%m-%d`
delvideo(){
	for i in `ls`;
	do
		echo 'FileName: ' $i
		FileModify=`stat $i | grep -i Modify | awk -F. '{print $1}' | awk '{print $2}'`
		echo 'Modify: ' $FileModify
		if [ $FileModify == $SevenDayDate ]
		then
			echo 'OldFile:' $i
			echo 'Del ' $i
			rm -f $i
		fi
	done
echo 'CleanUp Over' 
}
cd $FolderPath
delvideo


if [ ! -f "$DataPath" ]
then
	echo 'Change Directory'
	echo $DataPath 'Folder Exits'
	cd $DataPath
	delvideo
else
	echo $DataPath 'Not Exits'
fi
echo 'recovery IFS'
IFS=$old_IFS
