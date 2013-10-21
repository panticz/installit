#!/bin/bash

sudo apt-add-repository -y ppa:chromium-daily/stable

sudo apt-get update -y -qq

sudo apt-get install -y chromium-browser
