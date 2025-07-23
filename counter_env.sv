class counter_env extends uvm_env;
	`uvm_component_utils(counter_env)
	 source_agent sr_agt;
	 dest_agent  dest_agt;
	 env_config m_cfg;
	 source_config sr_cfg;
	 dest_config   dest_cfg;
	 score_board sb;
	 virtual_sequencer v_seq;
function new(string name ="counter_env",uvm_component parent);
	super.new(name,parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db#(env_config)::get(this,"","env_config",m_cfg))
		`uvm_fatal("FATAL","can not get the environment config")
	if(m_cfg.has_scoreboard)
		sb=score_board::type_id::create("sb",this);
	if(m_cfg.has_virtual_sequencer)
		v_seq=virtual_sequencer::type_id::create("v_seq",this);
	if(m_cfg.has_source_agent)
		sr_agt=source_agent::type_id::create("sr_agt",this);
	if(m_cfg.has_dest_agent)
		dest_agt=dest_agent::type_id::create("dest_agt",this);
	
	
	uvm_config_db#(source_config)::set(this,"*","source_config",m_cfg.sr_cfg);
	uvm_config_db#(dest_config)::set(this,"*","dest_config",m_cfg.dest_cfg);
endfunction
endclass

