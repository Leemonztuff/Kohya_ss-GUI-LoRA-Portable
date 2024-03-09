@echo off
del README.md
echo Unpacking Git and Python... & start /wait git_python.part01.exe & del git_python.part01.exe & del git_python.part*.rar

set path=git\cmd;python;venv\scripts
set appdata=tmp
set userprofile=tmp
set temp=tmp

git init .
git remote add origin https://github.com/bmaltais/kohya_ss.git
git pull origin v22.6.2

python -m venv venv
call venv\Scripts\activate.bat

pip install --use-pep517 -U -r firstrun.txt
echo Installing bitsandbytes
python firstrun.py

del firstrun.* & webui.cmd

pause