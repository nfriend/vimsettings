:: This script automatically installs symbolic links for files and directories in this repository
:: Written by Nathan Friend, March 29, 2015

@echo off

:: Requests admin privileges
:: from http://stackoverflow.com/a/10052222/1063392
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------


:: symlink relevant directories and files into the user's home directory

if exist %homepath%\.vim ( rmdir %homepath%\.vim )
echo junction symlinking .vim directory to %homepath%\.vim...
mklink /J %homepath%\.vim .vim

if exist %homepath%\_vimrc ( del %homepath%\_vimrc )
echo hard symlinking _vimrc to %homepath%\_vimrc...
mklink /H %homepath%\_vimrc _vimrc

if exist %homepath%\_vsvimrc ( del %homepath%\_vsvimrc )
echo hard symlinking _vsvimrc to %homepath%\_vsvimrc...
mklink /H %homepath%\_vsvimrc _vsvimrc 

if exist %homepath%\xmllint.exe ( del %homepath%\xmllint.exe )
echo hard symlinking xmllint.exe to %homepath%\_vsvimrc ...
mklink /H %homepath%\xmllint.exe xmllint.exe


