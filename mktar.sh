#!/bin/sh
ls *.pl *.txt *.psql *.sh >cicsrdo.files
tar chzvf cicsrdo.backup.tar.gz --files-from=cicsrdo.files 
rm cicsrdo.files
