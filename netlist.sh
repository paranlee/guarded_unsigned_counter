#!/bin/bash

yosys -q -p "prep -top $1; write_json $1.json" $1.v || exit 1
netlistsvg $1.json -o $1.svg
