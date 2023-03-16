@echo off
del README.md
echo Unpacking Git and Python... & start /wait git_python.part01.exe & del git_python.part01.exe & del git_python.part*.rar

set path=git\cmd;python
set appdata=tmp
set userprofile=tmp
set temp=tmp

git init .
git remote add origin https://github.com/bmaltais/kohya_ss.git
git pull origin master

python -m venv venv
call .\venv\Scripts\activate

pip install torch==1.12.1+cu116 torchvision==0.13.1+cu116 --extra-index-url https://download.pytorch.org/whl/cu116
pip install --use-pep517 --upgrade -r requirements.txt
pip install -U -I --no-deps https://github.com/C43H66N12O12S2/stable-diffusion-webui/releases/download/f/xformers-0.0.14.dev0-cp310-cp310-win_amd64.whl

echo Installing bitsandbytes and CUDNN
python firstrun.py

del firstrun.* & webui.cmd

pause