@echo off
mkdir newcerts
mkdir certs
mkdir crl

echo ------------������Կ��------------
keytool -genkey -alias serverkey -keystore YuchBerrySvr.key


pause