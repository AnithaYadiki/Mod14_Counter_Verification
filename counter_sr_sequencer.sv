class counter_sequencer extends uvm_sequencer#(source_xtn);
	`uvm_component_utils(counter_sequencer)

function new (string name="counter_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction
endclass
