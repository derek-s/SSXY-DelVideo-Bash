# SSXY服务器用Bash

### checktomcat

检测tomcat运行状态，若tomcat未运行或已运行但无法访问localhost，则重启Tomcat并写入日志文件。

### delvideo

检测服务器上的视频文件，获取视频文件的Modify时间。
当视频文件Modify == 当前系统日期-7天之后，则删除该视频解决服务器硬盘空间。