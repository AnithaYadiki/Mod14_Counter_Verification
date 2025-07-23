class test extends uvm_test;
	`uvm_component_utils(test)
	 counter_env env_h;
	 env_config m_cfg;
	 source_config sr_cfg;
	 dest_config  dest_cfg;
function new(string name="test",uvm_component parent);
	super.new(name,parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	m_cfg=env_config::type_id::create("m_cfg");
	sr_cfg=source_config::type_id::create("sr_cfg");
	if(!uvm_config_db#(virtual count_if)::get(this,"","sr_if",sr_cfg.vif))
		`uvm_fatal("FATAL","cannot get the interface")
	dest_cfg=dest_config::type_id::create("dest_cfg");
	if(!uvm_config_db#(virtual count_if)::get(this,"","dest_if",dest_cfg.vif))
		`uvm_fatal("FATAL","cannot get the interface")

	m_cfg.sr_cfg=sr_cfg;
	m_cfg.dest_cfg=dest_cfg;

	uvm_config_db#(env_config)::set(this,"*","env_config",m_cfg);
	env_h=counter_env::type_id::create("env_h",this);
endfunction
function void end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction
endclass
class up_test extends test;
	`uvm_component_utils(up_test)
	up_sequence u_seq;
function new(string name ="up_test",uvm_component parent);
	super.new(name,parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction
task run_phase(uvm_phase phase);
	u_seq=up_sequence::type_id::create("u_seq");
	//repeat(10)
//	begin
	phase.raise_objection(this);
	u_seq.start(env_h.sr_agt.seqr);
	#150;
	phase.drop_objection(this);
//	end
endtask
endclass
class down_test extends test;
	`uvm_component_utils(down_test)
	down_sequence d_seq;
function new(string name ="down_test",uvm_component parent);
	super.new(name,parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction
task run_phase(uvm_phase phase);
	d_seq=down_sequence::type_id::create("d_seq");
	phase.raise_objection(this);
	d_seq.start(env_h.sr_agt.seqr);
	#50;
	phase.drop_objection(this);
endtask
endclass

