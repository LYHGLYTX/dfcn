@echo off
setlocal
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File "%~dp0tools\package-windows.ps1"
set "packageExitCode=%errorlevel%"
echo(
pause
exit /b %packageExitCode%
