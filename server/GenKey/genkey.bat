@echo off
mkdir newcerts
mkdir certs
mkdir crl

echo ------------������Կ��------------
keytool -keystore YuchBerrySvr.key -genkeypair -alias serverkey

echo ------------����֤��ǩ������------------
keytool -keystore YuchBerrySvr.key -certreq -alias serverkey -file YuchBerrySvr.csr

echo ------------����CA����ǩ��֤��------------
openssl req -new -x509 -keyout YuchBerryClient.key -out YuchBerryClient.crt -config openssl.conf

echo ------------��֤�鵼��֤���------------
keytool -keystore YuchBerrySvr.key -importcert -alias root -file cacert.pem

echo ------------�����ɵ�֤�鵼�뵽keystore------------
keytool -keystore YuchBerrySvr.key -importcert -alias clientkey -file YuchBerryClient.crt


pause