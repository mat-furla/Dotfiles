#!/bin/bash

## Find version of widevine
LATEST=`curl https://dl.google.com/widevine-cdm/current.txt`

## Download and unzip
wget https://dl.google.com/widevine-cdm/$LATEST-linux-x64.zip
unzip $LATEST-linux-x64.zip

## Move files
sudo mv libwidevinecdm.so /usr/lib/chromium

## Fix permissions
sudo chmod 644 /usr/lib/chromium/libwidevinecdm.so
