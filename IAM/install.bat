@echo off

rem Install Python
python-3.11.1-amd64.exe /quiet

rem Install packages from requirements.txt
pip install -r requirements.txt

