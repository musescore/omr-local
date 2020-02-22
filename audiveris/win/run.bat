@echo off

set APP_HOME=%~dp0

set JAVA_HOME=%APP_HOME%/jre1.8.0_231
set APPDATA=%APP_HOME%/data

@echo %APP_HOME%/Audiveris32/bin/Audiveris.bat %*

call %APP_HOME%/Audiveris32/bin/Audiveris.bat %*
