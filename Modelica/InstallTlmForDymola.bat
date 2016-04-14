rem /////////////////////SET PATHS////////////////////////////////////////////////////
rem set path to TLMPlugin (i.e. c:\TLMPlugin)
setx TLMPluginPath %BEAST%\src\TLMPlugin
set TLMPluginPath = %BEAST%\src\TLMPlugin

rem set path to Dymola installation folder
set DymolaPath="c:\Program Files (x86)\Dymola 7.1"

rem set path to Microsoft Visual Studio installation folder
set VC32Path="c:\Program Files (x86)\Microsoft Visual Studio 9.0"

rem /////////////////////COMPILE DYMOLA LIB///////////////////////////////////////////
echo DOS BAT file to vc++-make
rem Add the modelica bin path to the Windows System Environment Variables:
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /d "%TLMPluginPath%\bin;%path%" /f
rem set path to Microsoft Visual Studio installation folder
call %VC32Path%\Common7\Tools\vsvars32.bat 
rem run nmake.exe 
set ABI=VC32
rem delete old VC32 folder
rmdir /s /q VC32
nmake.exe -f MakeVcLib.vc default
rem copy generated tlmmodelica.lib file to Dymola bin folder 
copy %TLMPluginPath%\Modelica\%ABI%\tlmmodelica.lib %DymolaPath%\bin\lib
rem copy generated tlmforce.h file to Dymola source folder
copy %TLMPluginPath%\Modelica\tlmforce.h %DymolaPath%\Source\
rem delete old VC32 folder
rmdir /s /q VC32

rem /////////////////////COMPILE AND INSTALL TLM MANAGER//////////////////////////////
call CompileTLMManager.bat