@echo off
echo.
echo ���]
echo.

%~d0
cd %~dp0

cd ..
npm run build:prod

pause