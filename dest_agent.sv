class dest_agent extends uvm_agent;
	`uvm_component_utils(dest_agent)
	 counter_dest_driver dr;
	 counter_dest_monitor mon;	
	 counter_dest_sequencer seqr;
	 dest_config dest_cfg;	
	//router_config m_cfg;	
function new(string name ="dest_agent",uvm_component parent);
	super.new(name,parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
		if(!uvm_config_db#(dest_config)::get(this,"","dest_config",dest_cfg))
			`uvm_fatal("CONFIG_LOAD","cannot get the configaration object")
	
	mon=counter_dest_monitor::type_id::create("mon",this);
	if(dest_cfg.is_active)
	begin
	dr=counter_dest_driver::type_id::create("dr",this);
	seqr=counter_dest_sequencer::type_id::create("seqr",this);
	end
	
endfunction
function void connect_phase(uvm_phase phase);
	if(dest_cfg.is_active)
	begin

	dr.seq_item_port.connect(seqr.seq_item_export);
	end
endfunction

endclass

