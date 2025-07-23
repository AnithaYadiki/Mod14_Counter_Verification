package counter_test_pkg;


//import uvm_pkg.sv
	import uvm_pkg::*;
//include uvm_macros.sv
	`include "uvm_macros.svh"
`include "source_xtns.sv"
`include "dest_config.sv"
`include "source_config.sv"
`include "env_config.sv"
`include "counter_driver.sv"
`include "counter_monitor.sv"
`include "counter_sequencer.sv"
`include "source_agent.sv"
`include "source_seqs.sv"

`include "dest_xtn.sv"
`include "counter_monitor1.sv"
`include "counter_sequencer1.sv"
`include "counter_driver1.sv"
`include "des_agent.sv"

`include "virtual_sequencer.sv"
`include "score_board.sv"

`include "counter_env.sv"


`include "test.sv"
endpackage
