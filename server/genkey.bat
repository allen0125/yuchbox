@echo off

mkdir newcerts
mkdir certs
mkdir crl

del YuchBerrySvr.key

echo ------------������Կ��------------
keytool -genkey -alias serverkey -keystore YuchBerrySvr.key

pause