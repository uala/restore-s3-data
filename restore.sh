#!/bin/sh

cd $LOCAL_DIR

rm -r lost+found > /dev/null 2>&1
[ "$(ls -A)" ] && echo "[ERROR] Directory is not empty, exit." && exit 0;

echo "download last backup...";
OBJ=`aws s3 ls $BUCKET/$S3_PATH --recursive | sort | tail -n 1 | awk '{print $4}'`;
echo "$BUCKET/$OBJ";

aws s3 cp $BUCKET/$OBJ backup;
echo "download completed.";
