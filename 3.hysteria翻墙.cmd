%%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a 
cls
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
CD /D "%~dp0"
@echo off

echo 是否执行IP更新？IP更新从云端更新IP配置以解决封锁问题！
echo 按5跳过，按1选择ip1更新，若ip1不好用再按2选ip2更新，如果更新后都用不了，请发邮件到 freeman105@gmail.com 进行反馈！
choice /C 12345 /T 15 /D 5 /M "1、ip1更新  2、ip2更新  3、ip3更新  4、ip4更新 5、跳过"
if errorlevel 5 goto startfq
if errorlevel 4 goto ip4
if errorlevel 3 goto ip3
if errorlevel 2 goto ip2
if errorlevel 1 goto ip1



:ip4
start /wait "" "%~dp0hysteria\ip_Update\ip_4.bat"
goto startfq

:ip3
start /wait "" "%~dp0hysteria\ip_Update\ip_3.bat"
goto startfq

:ip2
start /wait "" "%~dp0hysteria\ip_Update\ip_2.bat"
goto startfq

:ip1
start /wait "" "%~dp0hysteria\ip_Update\ip_1.bat"
goto startfq

:startfq
 
start "" "%~dp0hysteria\hysteria-tun-windows-6.0-386.exe" -c .\hysteria\config.json

echo 等待翻墙软件启动，请稍候...
IF EXIST %~dp0Browser\chrome.exe (
    start %~dp0Browser\chrome.exe --user-data-dir=%~dp0chrome-user-data --proxy-server="socks5://127.0.0.1:1080" --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE 127.0.0.1" https://www.google.com/
) ELSE (
	%SystemRoot%\System32\reg.exe query "HKLM\Software\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" >nul 2>&1
	IF  not errorlevel 1 (
    start chrome.exe --user-data-dir=%~dp0chrome-user-data  --proxy-server="socks5://127.0.0.1:1080" --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE 127.0.0.1"  https://www.google.com/
	) else (
		echo Chrome浏览器不存在或没有正确安装，请尝试重新安装Chrome浏览器
		echo 或者采用以下办法：
		echo 右键点桌面的Google Chrome图标，再点属性，找到chrome.exe文件的路径，然后打开那个目录，把chrome.exe 连同那个目录下的所有子文件夹和文件，一起拷贝到ChromeGo文件夹下的Browser目录里面，然后重新启动ChromeGo的翻墙脚本。
	)
)
pause
