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

if exist %userprofile%\.vim ( rmdir %userprofile%\.vim )
echo junction symlinking .vim directory to %userprofile%\.vim...
mklink /J %userprofile%\.vim .vim

if exist %userprofile%\_vimrc ( del %userprofile%\_vimrc )
echo hard symlinking _vimrc to %userprofile%\_vimrc...
mklink /H %userprofile%\_vimrc _vimrc

if exist %userprofile%\_vsvimrc ( del %userprofile%\_vsvimrc )
echo hard symlinking _vsvimrc to %userprofile%\_vsvimrc...
mklink /H %userprofile%\_vsvimrc _vsvimrc 

if exist %userprofile%\xmllint.exe ( del %userprofile%\xmllint.exe )
echo hard symlinking xmllint.exe to %userprofile%\_vsvimrc ...
mklink /H %userprofile%\xmllint.exe xmllint.exe


