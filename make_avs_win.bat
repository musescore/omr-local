@echo off

set FILE_PATH=%2
set FILE_NAME=%~n2
set BUILD_DIR=%3

set APP_HOME=%~dp0

if "%1" equ "check" (
    @echo Check success
    exit 0
)

@echo === prepare build ===

set AUDIVERIS=%APP_HOME%/audiveris/win/run.bat
set ZIP=%APP_HOME%/audiveris/win/7z.exe

@echo === run orm and export ===
call %AUDIVERIS% -batch -export -output %BUILD_DIR% %FILE_PATH%
@echo Done export

set BUILD_PATH=%BUILD_DIR%/%FILE_NAME%

@echo === run pack avs file ===
%ZIP% a -mm=Deflate -tzip %BUILD_PATH%/%FILE_NAME%.avs %BUILD_PATH%/%FILE_NAME%.mxl %BUILD_PATH%/%FILE_NAME%.omr

@echo all done file:  %BUILD_PATH%/%FILE_NAME%.avs

exit 0
