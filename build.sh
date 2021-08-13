#!/bin/bash

iverilog -o $1 $1.v $1_tb.v || exit 1
vvp $1
# gtkwave $1_tb.vcd
