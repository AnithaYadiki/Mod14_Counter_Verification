class env_config extends uvm_object;
	`uvm_object_utils(env_config)
	 bit has_scoreboard=1;
	 bit has_virtual_sequencer=1;
	 bit has_source_agent=1;
	 bit has_dest_agent=1;
	 source_config sr_cfg;
	 dest_config  dest_cfg;
	 uvm_active_passive_enum is_active = UVM_ACTIVE;
function new(string name ="env_config");
	super.new(name);
endfunction
endclass
	
