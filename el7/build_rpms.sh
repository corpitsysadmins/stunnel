#!/bin/bash

yum -y install rpmdevtools yum-utils

rpmdev-setuptree

for spec_files in *.spec; do
	
	if [ -e "$spec_files" ]; then
		mv *.spec rpmbuild/SPECS/
	else
		echo "No new specs files were found"
	fi
    
    break
done

yum-builddep -y rpmbuild/SPECS/stunnel.spec
spectool -g -R rpmbuild/SPECS/stunnel.spec
rpmbuild -ba rpmbuild/SPECS/stunnel.spec
s