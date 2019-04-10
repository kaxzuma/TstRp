@echo off
set words=%1 %2 %3 %4 %5 %6 %7 %8 %9
call :trim %words%
start chrome "https://www.google.co.jp/search?q=%words%"
exit /b
:trim
set words=%*
