#! /bin/tcsh -f
java -classpath log4j-1.2.12.jar:harvester2.jar:xalan.jar ORG.oclc.oai.harvester2.app.RawWrite http://crdo.vjf.cnrs.fr:8080/crdo_servlet/oai-pmh -metadataPrefix olac -setSpec Lacito -out metadata_lacito.xml
