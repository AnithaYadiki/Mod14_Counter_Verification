class source_agent extends uvm_agent;
	`uvm_component_utils(source_agent)
	 counter_driver dr;
	 counter_monitor mon;	
	 counter_sequencer seqr;
	source_config sr_cfg;	
	//router_config m_cfg;	
function new(string name ="source_agent",uvm_component parent);
	super.new(name,parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
		if(!uvm_config_db#(source_config)::get(this,"","source_config",sr_cfg))
			`uvm_fatal("CONFIG_LOAD","cannot get the configaration object")
	
	mon=counter_monitor::type_id::create("mon",this);
	if(sr_cfg.is_active)
	begin
	dr=counter_driver::type_id::create("dr",this);
	seqr=counter_sequencer::type_id::create("seqr",this);
	end
	
endfunction
function void connect_phase(uvm_phase phase);
	if(sr_cfg.is_active)
	begin

	dr.seq_item_port.connect(seqr.seq_item_export);
	end
endfunction
endclass

