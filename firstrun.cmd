@echo off
del README.md
echo Unpacking Git and Python... & start /wait git_python.part01.exe & del git_python.part01.exe & del git_python.part*.rar

set path=git\cmd;python;venv\scripts
set appdata=tmp
set userprofile=tmp
set temp=tmp

git init .
git remote add origin https://github.com/bmaltais/kohya_ss.git
git pull origin master

python -m venv venv
call venv\Scripts\activate.bat

pip install torch==2.0.1+cu118 torchvision==0.15.2+cu118 --extra-index-url https://download.pytorch.org/whl/cu118
pip install --use-pep517 -U -r requirements.txt
pip install -U xformers==0.0.20
pip install https://huggingface.co/r4ziel/xformers_pre_built/resolve/main/triton-2.0.0-cp310-cp310-win_amd64.whl

echo Installing bitsandbytes
python firstrun.py

del firstrun.* & webui.cmd

pause