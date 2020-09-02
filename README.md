# adquirencia_api
Necessary to install the Robot Framework

# Installation of Robot Framework

List of packages to download from web
Python
wxPython2.8-win64-unicode-2.8.12.1-py27
AutoItLibrary
AutoIt Window Info Tool

# Python
First, we need to install Python. You have to install version 2.7.13 which you can get from here if you didn’t download it from the links above. I’m using the 64bit version on my setup. I recommend you install the python to the default location (C:\Python27). Also, remember to check Add python.exe to a path is selected to be installed. This adds Python to PATH variable so you can call it anywhere in cmd with python command. I had some problem with the installation and pip(Python package manager) didn’t get installed so i did have to install it manually by going to cmd and writing the following commands:

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

python get-pip.py

After that you can check that it’s installed with command:

pip --version

You should get something like this:
pip 18.1 from c:\python27\lib\site-packages\pip (python 2.7)

You can also check that Python is correctly installed with command:

python --version

# Pywin32
Next, we are going to install Pywin32. This package provides access to much of the Win32 API, the ability to create and use COM objects, and the Pythonwin environment. We can install it through the cmd using pip:

pip install pywin32

# wxPython
This package is needed for the RIDE to work correctly. You can get it with pip again:
pip install -U wxPython
We also have to install the windows executable version wxPython2.8-win64-unicode-2.8.12.1-py27.exe. If you didn’t download it from the link in the beginning you can get it from here.

# Robot Framework
Then we also have to install the test automation framework.

pip install robotframework

# RIDE
RIDE is editor for the test data

pip install robotframework-ride

# AutoItLibrary
AutoItLibrary is a Robot Framework keyword library wrapper for the AutoIt Scripting Language.
pip install robotframework-autoitlibrary
We also have to extract the robotframework-autoitlibrary-1.2.2.zip file. If you didn’t download it in the beginning you can get it from here. You can extract it anywhere. Now you have to open new cmd but this time you have to run the cmd as Administrator (right-click the cmd from the start menu and choose Run as administrator). Now navigate in the cmd to the folder you extracted previously and run:

python setup.py install
