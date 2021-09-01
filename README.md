# unsigned counter with guardian bits

Counter with two guardians who count either even or odd position bit.

This repository is summarizing on my verilog review.

Tested on Ubuntu 20.04 WSL2.

## Install Verilog Environment

I'm using iverilog and netlistsvg.

You can install from `setup.sh`.

```bash
 $ bash setup.sh
```

## Build

Build from iverilog.

We can check .vcd file waveform on GTK Wave.

```bash
 $ bash build.sh guarded_unsigned_counter
```

## Make RTL diagram

We can make nice RTL Diagram by using netlistsvg.

```bash
 $ bash netlist.sh guarded_unsigned_counter
```

![example](https://raw.githubusercontent.com/paranlee/guarded_unsigned_counter/master/guarded_unsigned_counter.svg?sanitize=true)
