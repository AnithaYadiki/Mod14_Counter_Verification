class counter_monitor extends uvm_monitor;
	`uvm_component_utils(counter_monitor)
	source_config sr_cfg;
	virtual count_if.WR_MON vif;
	source_xtn item;
function new (string name="counter_monitor",uvm_component parent);
	super.new(name,parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	item = source_xtn::type_id::create("item");
		if(!uvm_config_db#(source_config)::get(this,"","source_config",sr_cfg))
			`uvm_fatal("CONFIG_LOAD","cannot get the configaration object")
endfunction
function void connect_phase(uvm_phase phase);
	vif=sr_cfg.vif;
endfunction	
task run_phase(uvm_phase phase);
	forever
	begin
	collect_data();
	end
endtask
task collect_data();
	@(vif.wr_cb);
	item.mode<=vif.wr_cb.mode;
	item.load<=vif.wr_cb.load;
	@(vif.wr_cb);
	
	item.data_in<=vif.wr_cb.data_in;
	@(vif.wr_cb);
	`uvm_info("SR_MONITOR",$sformatf("monitor data \n %s",item.sprint()),UVM_MEDIUM)
endtask
	

endclass
