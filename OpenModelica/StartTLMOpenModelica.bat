echo on
REM OpenModelica TLM start-up script
REM Start with 6 arguments:
REM 1 XModelName (XModel directory) 
REM 2 start-time 
REM 3 end-time 
REM 4 max-time-step 
REM 5 server-name:port 
REM 6 model-file 

rem *********************SET PATHS****************************************************
rem set path to OpenModelica installation folder
set OpenModelicaPath=%OPENMODELICAHOME%

rem *********************SETUP SIMULATION*********************************************
set OMC_Cmd=%OpenModelicaPath%/bin/omc.exe
set TLMCONFIGFILE=tlm.config

If "%6" == "" goto USAGE

echo execution directory is %1
cd %1

If not exist %6 goto BADFILE

echo Starting a OpenModelica simulation with input file: %6
echo Make sure that: 
echo time = %2
echo timeEnd = %3
echo MaxTimeStep "<"= %4
echo 

echo Writing caseID %1 and server name %5 to file %TLMCONFIGFILE%
echo %1 > %TLMCONFIGFILE% 
echo %5 >> %TLMCONFIGFILE%
echo %2 >> %TLMCONFIGFILE%
echo %3 >> %TLMCONFIGFILE%
echo %4 >> %TLMCONFIGFILE%

set MOSFILE=%1.mos
for /F %%I in ("%6") do set MODELNAME=%%~nI 
for /F %%I in ("%Mofile%") do set MODELNAME_WITH_MO=%%I 

echo Writing %MOSFILE% 
echo // Autogenerated modelica script for TLM cosimulation > %MOSFILE%
echo loadModel(Modelica); >> %MOSFILE%
echo getErrorString(); >> %MOSFILE%
echo loadFile("%TLMPluginPath%/bin/OpenModelica/OM_TLM.mo"); >> %MOSFILE%
echo getErrorString(); >> %MOSFILE%
echo loadFile("%6"); >> %MOSFILE%
echo getErrorString(); >> %MOSFILE%
echo simulate(%MODELNAME%, startTime=%2, stopTime=%3, method="dassl", outputFormat="plt", simflags="-noEquidistantTimeGrid -maxStepSize=%4"); >> %MOSFILE%
echo getErrorString(); >> %MOSFILE%

echo Starting OpenModelica
echo %OMC_Cmd% %MOSFILE%

%OMC_Cmd% %1.mos > %1.simlog
goto DONE

:USAGE
echo Usage: 
echo %0 XModelName start-time end-time max-time-step server-name:port model-file 
goto DONE

:BADFILE
echo Model file %6 not found, cannot start simulation

:DONE
echo Done %0