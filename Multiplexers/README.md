Here lies a simple 4 to 1 multiplexer. Each input is 4 bits wide. If you have Docker installed you can run the following comands to compile and simulate the component.

```
docker run -it --rm -v $PWD:/work -w /work hdlc/ghdl ghdl -a multiplexer.vhd
docker run -it --rm -v $PWD:/work -w /work hdlc/ghdl ghdl -a mux_tb.vhd
docker run -it --rm -v $PWD:/work -w /work hdlc/ghdl ghdl -r mux_tb --vcd=mux.vcd --stop-time=50ns
gtkwave mux.vcd
```

![Simulation](https://raw.githubusercontent.com/Joash09/FPGA-Playground/main/Results/sim_results.png)
