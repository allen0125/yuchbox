@echo off
del YuchBerrySvr.key

echo ------------������Կ��------------
keytool -genkey -alias serverkey -keystore YuchBerrySvr.key

pause