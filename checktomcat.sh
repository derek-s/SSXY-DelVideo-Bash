TomcatID=`ps -ef|grep tomcat-8.0.32|grep -v 'grep'|head -1|awk '{print $2}'`
WebUrl=http://localhost:8080
echo "Check Tomcat Status....."
if [ $TomcatID  ];then
	echo "The Tomcat is Running"
	HttpServerCode=`curl -I $WebUrl > /home/sjww/log/status.txt`
	Status=`cat /home/sjww/log/status.txt|head -1|awk '{print $2}'`
	if [ $Status -eq 200 ];then
		echo "Tomcat is working"
	fi
else
	echo "Tomcat is error"
	kill -9 $TomcatID
	sleep 3
	/usr/local/tomcat-8.0.32/bin/startup.sh
	sleep 10

fi

