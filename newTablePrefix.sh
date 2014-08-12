#!/bin/sh
if [ -z $2 ] ;then
echo "Help: $0 SQLfilename NewPrefix OldPrefix"
exit 1
fi
needfix="^\(\/\*!40000 ALTER TABLE \`\|DROP TABLE IF EXISTS \`\|CREATE TABLE IF NOT EXISTS \`\|LOCK TABLES \`\|CREATE TABLE \`\|ALTER TABLE \`\|INSERT INTO \`\)$3"
fixto="\1$2"
sed "s/$needfix/$fixto/" $1

