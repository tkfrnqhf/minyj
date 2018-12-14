#!/bin/bash

#if [ "$PLATFORM" == "" ]; then
#  echo "Please provide $PLATFORM"
#  exit
#fi

#if [ "$VERSION" == "" ]; then
#  echo "Please provide $SDK"
#  exit
#fi

#echo VERSION $VERSION
#echo PLATFORM $PLATFORM

#adb connect localhost:7401

DEVICE_SERIAL="0715f7f091320404"
connectUrl=$(node ./stf/stf_connect.js $DEVICE_SERIAL)
echo $connectUrl
# Run appium server
echo "Run appium server"
(appium &) > /dev/null 2>&1
sleep 15


appium_ps=$(ps -ef | grep -c 'appium')

if [ $appium_ps -eq "2" ]
then
  echo "appium alived"
else
  echo "appium not alived"
  exit
fi

# Run tests
echo "Run test script"
cd testscript
ls -al
pwd
#./gradlew --debug --stacktrace clean test -DTID=$TID -DUDID=$UDID -DMODEL=$MODEL -DVERSION=$VERSION -DPLATFORM=$PLATFORM -DSDK=$SDK -DDEVICESERIAL=$DEVICE_SERIAL
mvn clean install 
#-DVERSION=$VERSION -DPLATFORM=$PLATFORM
