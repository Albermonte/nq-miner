@echo off
echo "------------------------START Miner----------------------"
SET UV_THREADPOOL_SIZE=32
nq-miner.exe -t opencl -a "NQ65GS91H8CSQFAN1EVSUK3GX7PLL9N1X4KC." -p eu.nimpool.io:8444 -n "My rig"
echo "------------------------END Miner----------------------"
echo "Something went wrong or you exited"
pause
