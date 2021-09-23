Just a short mini project. The module generates the next sequence of the Fibonacci sequence every clock cycle. Run the following commands to compile and show simulation.

```
docker run -it --rm -v $PWD:/work -w /work hdlc/ghdl ghdl -a fibonacci.vhd
docker run -it --rm -v $PWD:/work -w /work hdlc/ghdl ghdl -a fibonacci_tb.vhd
docker run -it --rm -v $PWD:/work -w /work hdlc/ghdl ghdl -r fibonacci_tb --vcd=fibonacci_tb.vcd --stop-time=50ns
gtkwave fibonacci_tb.vcd
```

![Simulation](https://raw.githubusercontent.com/Joash09/FPGA-Playground/main/Fibonacci-Generator/Results/sim_results.png)
