module counter_top();
	import uvm_pkg::*;
	import counter_test_pkg::*;
	`include "uvm_macros.svh"
	

	bit clock;
always
	#5 clock=~clock;
	
	count_if sr_if(clock);
	count_if dest_if(clock);
	
	counter DUV(.clock(clock),
		    .reset_n(sr_if.reset_n),
		    .load(sr_if.load),
	            .mode(sr_if.mode),
		    . data_in(sr_if.data_in),
		     .data_out(dest_if.data_out));

			initial
			begin
			`ifdef VCS
         		$fsdbDumpvars(0, counter_top);
        		`endif

				uvm_config_db#(virtual count_if)::set(null,"*","sr_if",sr_if);
				uvm_config_db#(virtual count_if)::set(null,"*","dest_if",dest_if);
				

				run_test("test");
			end
endmodule

