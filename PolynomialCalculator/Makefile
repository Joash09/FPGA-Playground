DOCKER_COMMAND=docker run -it --rm -v $(PWD):/work -w /work hdlc/ghdl
GHDL_COMMAND=ghdl -i *.vhd
GHDL_MAKE_COMMAND=ghdl -m 

TESTBENCH=polynomial_tb
STOP_TIME=50ns

SIM_OPTS=--stop-time=$(STOP_TIME)
GHDL_SIM_COMMAND=ghdl -r $(TESTBENCH) --vcd=$(TESTBENCH).vcd $(SIM_OPTS)
WAVE_TOOL=gtkwave

compile:
	$(DOCKER_COMMAND) $(GHDL_COMMAND)
	$(DOCKER_COMMAND) $(GHDL_MAKE_COMMAND) $(TESTBENCH)

sim:
	$(DOCKER_COMMAND) $(GHDL_SIM_COMMAND)
	$(WAVE_TOOL) $(TESTBENCH).vcd

.PHONY: clean
clean:
	@rm *.vcd
