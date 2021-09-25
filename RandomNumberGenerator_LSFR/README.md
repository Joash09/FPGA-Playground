Here lies an 8 bit pseudo-random number generator. Finite and Galois fields were a significant aspect of my Masters thesis and I hope to include a deeper explanation to how this works some time in the future. 

The polynomial I used for the psuedo-random generation was found in the following documentation.

https://www.xilinx.com/support/documentation/application_notes/xapp052.pdf

As always the code to get running is as follows:

```
docker run -it --rm -v $PWD:/work -w /work hdlc/ghdl ghdl -a lsfr.vhd
docker run -it --rm -v $PWD:/work -w /work hdlc/ghdl ghdl -a lsfr.vhd
docker run -it --rm -v $PWD:/work -w /work hdlc/ghdl ghdl -r lsfr --vcd=lsfr.vcd --stop-time=50ns
gtkwave lsfr.vcd
```

![Simulation](https://raw.githubusercontent.com/Joash09/FPGA-Playground/main/RandomNumberGenerator_LSFR/Results/sim_results.png)
