module counter(clock,reset_n,load,mode,data_in,data_out);
      input clock;
      input reset_n;
      input load;
      input mode;
      input [3:0]data_in;
      output reg[3:0]data_out;

  always@(posedge clock)
       begin
	       if(reset_n)
                     begin
		       data_out <= 4'b0000;
                     end
	      	else if(load)
		       data_out<=data_in;
	       else if(mode)
	       begin
		       if(data_out ==13)
			       data_out<=4'b0;
		        else
		             data_out<=data_out+1'b1;
		end
            else
	       begin
		       if(data_out ==4'b0)
		          data_out<=4'd13;
		       else
			       data_out<=data_out-1'b1;
		end
       end
   endmodule


