@echo off

echo ------------������Կ��------------
keytool -keystore YuchBerrySvr.key -genkeypair -alias serverkey

echo ------------������Կ��------------
echo keytool -genkey -v -alias YuchBerryServerKey -keyalg RSA -keystore YuchBerrySvr.key

echo ------------Ϊ�ͻ�������֤��---------
echo keytool -genkey -keystore YuchBerryClient.p12 -alias YuchBerryServerKey -keyalg RSA -storetype PKCS12

echo ------------�÷��������οͻ���֤��---------
echo keytool -export -file YuchBerryClient.cer -keystore YuchBerryClient.p12 -alias YuchBerryServerKey -storetype PKCS12 -rfc

echo keytool -import -v -file YuchBerryClient.cer -keystore YuchBerrySvr.key

pause