interface count_if(input bit clock);

  // Interface Signals
  logic [3:0] data_in;
  logic [3:0] data_out;
  logic       load;
  logic       mode;
  logic       reset_n;

  // Driver Clocking Block
  clocking dr_cb @(posedge clock);
    default input #1 output #1;
    output data_in;
    output load;
    output mode;
    output reset_n;
  endclocking

  // Write monitor clocking block
  clocking wr_cb @(posedge clock);
    default input #1 output #1;
    input data_in;
    input load;
    input mode;
    input reset_n;
  endclocking

  // Read monitor clocking block
  clocking rd_cb @(posedge clock);
    default input #1 output #1;
    input data_out;
  endclocking

  // Driver
  modport DRV(clocking dr_cb);

  // Write Monitor
  modport WR_MON(clocking wr_cb);

  // Read Monitor
  modport RD_MON(clocking rd_cb);

endinterface

