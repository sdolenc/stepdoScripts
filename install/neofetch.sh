#!/bin/bash

set -xe

# packages
sudo add-apt-repository -y ppa:dawidd0811/neofetch
sudo apt update
sudo apt install -y neofetch

neofetch
