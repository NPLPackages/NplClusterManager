@echo off 
pushd "%~dp0../../../../redist/" 
call "ParaEngineClient.exe" single="false" mc="true" 
popd 