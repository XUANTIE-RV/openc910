
`ifdef FPGA 
`define SYSMAP_BASE_ADDR0  28'h01000
`define SYSMAP_FLG0        5'b01111

`define SYSMAP_BASE_ADDR1  28'h02000
`define SYSMAP_FLG1        5'b10000

`define SYSMAP_BASE_ADDR2  28'hd0000
`define SYSMAP_FLG2        5'b10000

`define SYSMAP_BASE_ADDR3  28'heffff
`define SYSMAP_FLG3        5'b01101

`define SYSMAP_BASE_ADDR4  28'hfffff
`define SYSMAP_FLG4        5'b01111

`define SYSMAP_BASE_ADDR5  28'h4000000
`define SYSMAP_FLG5        5'b01111

`define SYSMAP_BASE_ADDR6  28'h5000000 
`define SYSMAP_FLG6        5'b10000

`define SYSMAP_BASE_ADDR7  28'hfffffff 
`define SYSMAP_FLG7        5'b01111
`else
`define SYSMAP_BASE_ADDR0  28'h01000
`define SYSMAP_FLG0        5'b01111

`define SYSMAP_BASE_ADDR1  28'h02000
`define SYSMAP_FLG1        5'b10000

`define SYSMAP_BASE_ADDR2  28'hd0000
`define SYSMAP_FLG2        5'b10000

`define SYSMAP_BASE_ADDR3  28'heffff
`define SYSMAP_FLG3        5'b01101

`define SYSMAP_BASE_ADDR4  28'hfffff
`define SYSMAP_FLG4        5'b01111

`define SYSMAP_BASE_ADDR5  28'h4000000
`define SYSMAP_FLG5        5'b01111

`define SYSMAP_BASE_ADDR6  28'h5000000 
`define SYSMAP_FLG6        5'b10000

`define SYSMAP_BASE_ADDR7  28'hfffffff 
`define SYSMAP_FLG7        5'b01111
`endif

