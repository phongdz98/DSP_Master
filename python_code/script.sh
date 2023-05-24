#python -m venv venv
#./venv/Scripts/activate
#python -m pip install --upgrade pip
#pip install -r requirements.txt
pyinstaller --onefile --clean --icon=dev.ico --upx-dir=C:\upx-4.0.0-win32 -w main.py