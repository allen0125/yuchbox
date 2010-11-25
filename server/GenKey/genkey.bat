@echo off
mkdir newcerts
mkdir certs
mkdir crl

echo ------------������Կ��------------
keytool -keystore YuchBerrySvr.key -genkeypair -alias serverkey

echo ------------����֤��ǩ������------------
keytool -keystore YuchBerrySvr.key -certreq -alias serverkey -file YuchBerrySvr.csr

echo ------------����CA����ǩ��֤��------------
openssl req -new -x509 -keyout ca.key -out ca.crt -config openssl.conf

echo ------------��CA˽Կ����ǩ��-------------
openssl ca -in YuchBerrySvr.csr -out YuchBerryClient.crt -cert ca.crt -keyfile ca.key -notext -config openssl.conf

echo ------------�������ε�CA��֤�鵽keystore-------------
keytool -import -v -trustcacerts  -alias my_ca_root -file ca.crt -keystore YuchBerrySvr.key

echo ------------�����ɵ�֤�鵼�뵽keystore------------
keytool -keystore YuchBerrySvr.key -importcert -alias clientkey -file YuchBerryClient.crt

pause