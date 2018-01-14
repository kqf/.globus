TARGET = usercert.pem userkey.pem
INPUT = myCertificate.p12

$(TARGET): $(INPUT)
	openssl pkcs12 -in $(INPUT) -out usercert.pem -clcerts -nokeys
	openssl pkcs12 -in $(INPUT) -out userkey.pem -nocerts -nodes
	chmod 0600 userkey.pem

PHONY.: upload


upload: $(TARGET)
	scp *.pem $(user)@lxplus.cern.ch:~/.globus/
	scp *.p12 $(user)@lxplus.cern.ch:~/.globus/
