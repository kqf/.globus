TARGET = usercert.pem userkey.pem
INPUT = myCertificate.p12
FOLDER = $(shell date +"old-certificate-moved-%m.%d.%Y")	


$(TARGET): $(INPUT)
	openssl pkcs12 -in $(INPUT) -out usercert.pem -clcerts -nokeys
	openssl pkcs12 -in $(INPUT) -out userkey.pem -nocerts -nodes
	chmod 0600 userkey.pem

PHONY.: upload archive


upload: $(TARGET)
	rsync -r . $(user)@lxplus.cern.ch:~/.globus/

archive:
	mkdir -p $(FOLDER)
	mv *.pem $(FOLDER)
	mv *.p12 $(FOLDER)
