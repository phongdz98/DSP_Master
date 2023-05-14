import os
# os.system('python -m pip install --upgrade pip')
os.system('pip install -r requirements.txt')
os.system('pyinstaller --onefile -w main.py')