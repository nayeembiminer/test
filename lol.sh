#!/bin/bash

# Colors
CYAN="\033[1;36m"; GREEN="\033[1;32m"; YELLOW="\033[1;33m"; RED="\033[1;31m"; RESET="\033[0m"

clear
echo -e "${CYAN}🚀 Verus Coin CPU Miner Installer - ccminer v3.8.3a${RESET}"

# Ask for machine name
read -p "🔧 Enter your machine name (e.g. rig1): " machinename

# Update and install dependencies
echo -e "${YELLOW}📦 Installing dependencies...${RESET}"
sudo apt update
sudo apt install -y build-essential autoconf automake libtool pkg-config \
libssl-dev libjansson-dev libcurl4-openssl-dev libz-dev

# Download ccminer
echo -e "${YELLOW}📥 Downloading ccminer...${RESET}"
wget -q https://github.com/Oink70/ccminer-verus/archive/refs/tags/v3.8.3a-CPU.tar.gz

# Extract
echo -e "${YELLOW}📂 Extracting...${RESET}"
tar -xzf v3.8.3a-CPU.tar.gz
cd ccminer-verus-3.8.3a-CPU

# Compile ccminer
echo -e "${YELLOW}🔧 Compiling ccminer (this may take a few minutes)...${RESET}"
make clean
./autogen.sh
./configure
make

# Start mining
echo -e "${GREEN}✅ Starting ccminer with 4 threads...${RESET}"
./ccminer -a verus -o stratum+tcp://na.luckpool.net:3960 -u RDu131QUrHs7Qg2PDFXaM5wKpbg81Nja6N.$machinename -p x -t 4
