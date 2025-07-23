class counter_dest_monitor extends uvm_monitor;
	`uvm_component_utils(counter_dest_monitor)
	dest_config dest_cfg;
	virtual count_if.RD_MON vif;
	dest_xtn item;

function new (string name="counter_dest_monitor",uvm_component parent);
	super.new(name,parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	item = dest_xtn::type_id::create("item");
	
		if(!uvm_config_db#(dest_config)::get(this,"","dest_config",dest_cfg))
			`uvm_fatal("CONFIG_LOAD","cannot get the configaration object")
	
endfunction
function void connect_phase(uvm_phase phase);
	vif=dest_cfg.vif;
endfunction	
task run_phase(uvm_phase phase);
	forever
	begin
	collect_data();
	end
endtask
task collect_data();
	@(vif.rd_cb);
	item.data_out<=vif.rd_cb.data_out;
	@(vif.rd_cb);
	`uvm_info("DES_MONITOR",$sformatf("monitor data \n %s",item.sprint()),UVM_MEDIUM)
endtask
	

endclass


