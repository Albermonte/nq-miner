
@echo off
SET OUTFILE="nq-miner-windows-${PACKAGE_VERSION_NO_WHITESPACE}.zip"
SET OUTPUT_DIR=".\dist"
echo Building %OUTFILE%

CALL pkg -t node12 --options max_old_space_size=4096 -o nq-miner.exe index.js

echo Copying native codes

mkdir dist

Xcopy /y ".\nq-miner.exe" "%OUTPUT_DIR%\nq-miner.exe*"
Xcopy /y ".\build\Release\nimiq_miner_cuda.node" "%OUTPUT_DIR%\nimiq_miner_cuda.node*"
Xcopy /y ".\build\Release\nimiq_miner_opencl.node" "%OUTPUT_DIR%\nimiq_miner_opencl.node*"
Xcopy /y ".\node_modules\node-lmdb\build\Release\node-lmdb.node" "%OUTPUT_DIR%\node-lmdb.node*"
Xcopy /y ".\node_modules\@nimiq\core\build\Release\nimiq_node.node" "%OUTPUT_DIR%\nimiq_node.node*"
Xcopy /y ".\start_gpu.bat" "%OUTPUT_DIR%\start_gpu.bat*"

echo Create zipped
CALL Powershell.exe Compress-Archive -Path .\dist\* -DestinationPath .\nq-miner.zip
