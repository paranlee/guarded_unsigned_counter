#!/bin/bash

# verilog
sudo apt -y install iverilog gtkwave yosys yosys-doc

# node.js
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt -y install nodejs
sudo npm install -g netlistsvg
