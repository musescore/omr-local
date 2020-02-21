@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  Audiveris startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and AUDIVERIS_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\audiveris.jar;%APP_HOME%\lib\args4j-2.33.jar;%APP_HOME%\lib\bsaf-1.9.2.jar;%APP_HOME%\lib\logback-classic-1.1.7.jar;%APP_HOME%\lib\proxymusic-3.0.1.jar;%APP_HOME%\lib\slf4j-api-1.7.21.jar;%APP_HOME%\lib\jcip-annotations-1.0.jar;%APP_HOME%\lib\eventbus-1.4.jar;%APP_HOME%\lib\jgoodies-forms-1.9.0.jar;%APP_HOME%\lib\jgoodies-looks-2.7.0.jar;%APP_HOME%\lib\jai-core-1.1.3.jar;%APP_HOME%\lib\ij-1.51f.jar;%APP_HOME%\lib\jPodRenderer-5.6.jar;%APP_HOME%\lib\jgrapht-core-1.0.1.jar;%APP_HOME%\lib\jfreechart-1.0.19.jar;%APP_HOME%\lib\itextpdf-5.5.9.jar;%APP_HOME%\lib\jama-1.0.3.jar;%APP_HOME%\lib\reflections-0.9.10.jar;%APP_HOME%\lib\tesseract-3.04.01-1.3.jar;%APP_HOME%\lib\tesseract-3.04.01-1.3-macosx-x86_64.jar;%APP_HOME%\lib\leptonica-1.73-1.3.jar;%APP_HOME%\lib\leptonica-1.73-1.3-macosx-x86_64.jar;%APP_HOME%\lib\javacpp-1.3.jar;%APP_HOME%\lib\jai-imageio-core-1.3.1.jar;%APP_HOME%\lib\org.apache.commons.io-2.4.jar;%APP_HOME%\lib\logback-core-1.1.7.jar;%APP_HOME%\lib\jgoodies-common-1.8.1.jar;%APP_HOME%\lib\jPod-5.6.jar;%APP_HOME%\lib\iscwt-5.6.jar;%APP_HOME%\lib\isfreetype-5.6.jar;%APP_HOME%\lib\isrt-4.11.jar;%APP_HOME%\lib\com.springsource.javax.media.jai.codec-1.1.3.jar;%APP_HOME%\lib\com.springsource.javax.media.jai.core-1.1.3.jar;%APP_HOME%\lib\jPodFonts-5.5.jar;%APP_HOME%\lib\jcommon-1.0.23.jar;%APP_HOME%\lib\guava-18.0.jar;%APP_HOME%\lib\javassist-3.18.2-GA.jar;%APP_HOME%\lib\annotations-2.0.1.jar;%APP_HOME%\lib\commons-io-2.4.jar;%APP_HOME%\lib\jbig2-5.5.1.jar;%APP_HOME%\lib\isnativec-5.6.jar;%APP_HOME%\lib\jna-3.2.7.jar

@rem Execute Audiveris
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %AUDIVERIS_OPTS%  -classpath "%CLASSPATH%" Audiveris %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable AUDIVERIS_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%AUDIVERIS_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
