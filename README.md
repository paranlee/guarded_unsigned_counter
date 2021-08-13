# unsigned counter with guardian bits

Counter with guardian who count each bit even or odd.

This repository is summarizing on verilog review.

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
