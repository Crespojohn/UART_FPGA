set_property SRC_FILE_INFO {cfile:c:/Users/cresp/FPGA_Projects/UART_proj/UART_proj.srcs/sources_1/bd/Uart_xadc/ip/Uart_xadc_clk_wiz_1_0/Uart_xadc_clk_wiz_1_0.xdc rfile:../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ip/Uart_xadc_clk_wiz_1_0/Uart_xadc_clk_wiz_1_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
