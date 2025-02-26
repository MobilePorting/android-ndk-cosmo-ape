@echo off
setlocal
call :find_bin
if "%~1" == "-cc1" goto :L

set "_BIN_DIR=" && "%_BIN_DIR%clang.exe" --target=i686-linux-android34 %*
if ERRORLEVEL 1 exit /b 1
goto :done

:L
rem Target is already an argument.
set "_BIN_DIR=" && "%_BIN_DIR%clang.exe" %*
if ERRORLEVEL 1 exit /b 1
goto :done

:find_bin
rem Accommodate a quoted arg0, e.g.: "clang"
rem https://github.com/android-ndk/ndk/issues/616
set _BIN_DIR=%~dp0
exit /b

:done
