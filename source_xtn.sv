class source_xtn extends uvm_sequence_item;
	`uvm_object_utils(source_xtn)
	rand bit load;
	rand bit mode;
	rand bit[3:0] data_in;
constraint c1{ data_in inside{[0:13]};}
constraint c2{mode dist {1:=50,0:=50};}
constraint c3{load dist {1:=20,0:=80};}
function new(string name ="source_xtn");
	super.new(name);
endfunction
function void do_print(uvm_printer printer);
	printer.print_field("Load",this.load,1,UVM_DEC);
	printer.print_field("Mode",this.mode,1,UVM_DEC);
	printer.print_field("data_in",this.data_in,4,UVM_DEC);
endfunction
endclass


