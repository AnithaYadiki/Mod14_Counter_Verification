class dest_xtn extends uvm_sequence_item;
	`uvm_object_utils(dest_xtn)
	bit [3:0] data_out;
function new(string name ="source_xtn");
	super.new(name);
endfunction
function void do_print(uvm_printer printer);
	printer.print_field("data_out",this.data_out,4,UVM_DEC);
endfunction
endclass

