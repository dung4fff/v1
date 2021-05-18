@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\App-Windows.bat" https://raw.githubusercontent.com/Motdulieu/App-Windows/main/App-Windows.bat > out.txt 2>&1
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
echo get ip address VPS
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Error get IP, please go to address: https://dashboard.ngrok.com/status/tunnels"
echo User: runneradmin
echo Pass: Motdulieu2021
