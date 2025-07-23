class counter_driver extends uvm_driver#(source_xtn);
	`uvm_component_utils(counter_driver)
	source_config sr_cfg;
	virtual count_if.DRV vif;

function new (string name="counter_driver",uvm_component parent);
	super.new(name,parent);
endfunction
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
		if(!uvm_config_db#(source_config)::get(this,"","source_config",sr_cfg))
			`uvm_fatal("CONFIG_LOAD","cannot get the configaration object")
endfunction
function void connect_phase(uvm_phase phase);
	vif=sr_cfg.vif;
endfunction	
task run_phase(uvm_phase phase);
	@(vif.dr_cb)
		vif.dr_cb.reset_n<=1'b1;
	//repeat(2)
		@(vif.dr_cb);

	vif.dr_cb.reset_n<=1'b0;
	forever
		begin
	seq_item_port.get_next_item(req);
	send_to_dut(req);
	seq_item_port.item_done();
		end
endtask
task send_to_dut(source_xtn req);
	@(vif.dr_cb);
	vif.dr_cb.mode<=req.mode;
	vif.dr_cb.load<=req.load;
	@(vif.dr_cb);
	
	vif.dr_cb.data_in<=req.data_in;
	@(vif.dr_cb);
	`uvm_info("SR_DRIVER",$sformatf("driver data \n %s",req.sprint()),UVM_MEDIUM)

endtask
	
endclass
