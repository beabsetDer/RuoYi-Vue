@echo off
echo.
echo 啟動WEB前端
echo.

%~d0
cd %~dp0

cd ..
npm run dev

pause