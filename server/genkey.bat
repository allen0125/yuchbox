@echo off
mkdir newcerts
mkdir certs
mkdir crl

echo ------------������Կ��------------
keytool -genkey -alias serverkey -keystore YuchBerrySvr.key

echo ------------����֤��ǩ������------------
keytool -certreq -alias serverkey -keystore YuchBerrySvr.key -file YuchBerrySvr.csr

echo ------------����CA����ǩ��֤��------------
openssl req -new -x509 -keyout YuchBerryClient.key -out YuchBerryClient.crt -config openssl.conf

echo ------------��CA˽Կ����ǩ��------------
openssl ca -in YuchBerrySvr.csr -out tmp.crt -cert YuchBerryClient.crt -keyfile YuchBerryClient.key -notext -config openssl.conf

echo ------------�������ε�CA��֤�鵽keystore------------
keytool -import -v -alias clientkey -file YuchBerryClient.crt -keystore YuchBerrySvr.key

echo ------------��CAǩ�����֤�鵼�뵽keystore------------
keytool -import -v -trustcacerts -alias serverkey -file tmp.crt -keystore YuchBerrySvr.key

del tmp.crt

pause