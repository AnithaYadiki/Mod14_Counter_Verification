class base_sequence extends uvm_sequence#(source_xtn);
	`uvm_object_utils(base_sequence)
function new(string name="base_sequence");
	super.new(name);
endfunction
endclass
class up_sequence extends base_sequence;
	`uvm_object_utils(up_sequence)
function new(string name="up_sequence");
	super.new(name);
endfunction
task body();
	req=source_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {mode==1 & load ==1;})
	finish_item(req);
endtask
endclass
class down_sequence extends base_sequence;
	`uvm_object_utils(down_sequence)
function new(string name="down_sequence");
	super.new(name);
endfunction
task body();
	req=source_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {mode==0;})
	finish_item(req);
endtask
endclass
