class source_config extends uvm_object;
	`uvm_object_utils(source_config)
	uvm_active_passive_enum is_active=UVM_ACTIVE;
	virtual count_if vif;
function new(string name="source_config");
	super.new(name);
endfunction
endclass

