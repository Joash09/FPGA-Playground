Here lies a simple (hopefully reusable) FIFO component. The testbench was written to demonstrate crossing clock domains with a FIFO.

This exercise was done with the aid of the following tutorial:

https://www.nandland.com/vhdl/modules/module-fifo-regs-with-flags.html

```
docker run -it --rm -v $PWD:/work -w /work hdlc/ghdl ghdl -a fifo.vhd
docker run -it --rm -v $PWD:/work -w /work hdlc/ghdl ghdl -a fifo_tb.vhd
docker run -it --rm -v $PWD:/work -w /work hdlc/ghdl ghdl -r fibonacci_tb --vcd=fifo.vcd --stop-time=50ns
gtkwave fifo_tb.vcd
```

![Simulation](https://raw.githubusercontent.com/Joash09/FPGA-Playground/main/FIFO/Results/sim_results.png)
