@echo off
setlocal
rem デフォルトの翻訳後言語
set mylang=ja

rem デフォルトの翻訳前言語
set favlang=en

set tlVal=%mylang%
set P1NULL=FALSE
set P2NULL=FALSE
set P1WORD=FALSE
call :StrLen %1
if not %StrLen% equ 2 set P1WORD=TRUE
if "a%1" == "a" set P1NULL=TRUE
if "%P1NULL%" == "TRUE" (
    set slVal=%favlang%
) else if "%P1NULL%" == "FALSE" if "%P1WORD%" == "TRUE" (
    set slVal=%favlang%
) else if "a%1" == "a%mylang%" (
    set slVal=%mylang%
    set tlVal=%favlang%
) else if "a%1" == "acn" (
    set slVal=zh-CN
) else (
    set slVal=%1
)

set dispmsg=%slVal%から%tlVal%にGoogle翻訳:
if "a%2" == "a" set P2NULL=TRUE
if "%P1NULL%" == "TRUE" (
    set /P words=%dispmsg%
) else if "%P2NULL% %P1WORD%" == "FALSE FALSE" (
    set words=%2 %3 %4 %5 %6 %7 %8 %9
) else if "%P2NULL% %P1WORD%" == "FALSE TRUE" (
    set words=%1 %2 %3 %4 %5 %6 %7 %8 %9
) else if "%P2NULL% %P1WORD%" == "TRUE FALSE" (
    set /P words=%dispmsg%
) else if "%P2NULL% %P1WORD%" == "TRUE TRUE" (
    set words=%1
)


call :trim %words%

start chrome "https://translate.google.co.jp/#view=home&op=translate&sl=%slVal%&tl=%tlVal%&text=%words%"
endlocal
exit /b



:trim
set words=%*

exit /b 0

rem ==============================================
rem 下記をコピペしました。
rem https://qiita.com/yz2cm/items/e2914df6d684b93e490f
rem ==============================================
rem ==============================================
rem StrLen - 文字数のカウント
rem ==============================================
:StrLen
    set _target=%1
    set _cou=0

    if not defined _target (
        set StrLen=0
        exit /b 0
    )

:__STRLEN_START__
    call set _target=%%_target:~1%%
    set /a _cou+=1
    if defined _target (
        goto __STRLEN_START__
    )

    set StrLen=%_cou%
exit /b 0



