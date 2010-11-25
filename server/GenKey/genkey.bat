@echo off
mkdir newcerts
mkdir certs
mkdir crl

echo ------------������Կ��------------
keytool -keystore YuchBerrySvr.key -genkeypair -alias serverkey

echo ------------����֤��ǩ������------------
keytool -keystore YuchBerrySvr.key -certreq -alias YuchBerrySvrKey -file YuchBerrySvr.csr

echo ------------����CA����ǩ��֤��------------
openssl req -new -x509 -keyout YuchBerryCA.key -out YuchBerryCA.crt -config openssl.conf

echo ------------��CA˽Կ����ǩ��-------------
openssl ca -in YuchBerrySvr.csr -out YuchBerryClient.cer -cert YuchBerryCA.crt -keyfile YuchBerryCA.key -notext -config openssl.conf

echo ------------�������ε�CA��֤�鵽keystore-------------
keytool -import -v -trustcacerts  -alias YuchBerryCA -file YuchBerryCA.crt -keystore YuchBerrySvr.key

echo ------------�����ɵ�֤�鵼�뵽keystore------------
keytool -keystore YuchBerrySvr.key -importcert -alias YuchBerrySvrKey -file YuchBerryClient.cer


pause