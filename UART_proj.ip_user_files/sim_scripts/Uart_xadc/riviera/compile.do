vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/xil_defaultlib
vlib riviera/microblaze_v11_0_2
vlib riviera/lmb_v10_v3_0_10
vlib riviera/lmb_bram_if_cntlr_v4_0_17
vlib riviera/blk_mem_gen_v8_4_4
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/mdm_v3_2_17
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/lib_pkg_v1_0_2
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/axi_uartlite_v2_0_24

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib
vmap microblaze_v11_0_2 riviera/microblaze_v11_0_2
vmap lmb_v10_v3_0_10 riviera/lmb_v10_v3_0_10
vmap lmb_bram_if_cntlr_v4_0_17 riviera/lmb_bram_if_cntlr_v4_0_17
vmap blk_mem_gen_v8_4_4 riviera/blk_mem_gen_v8_4_4
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap mdm_v3_2_17 riviera/mdm_v3_2_17
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_24 riviera/axi_uartlite_v2_0_24

vlog -work xpm  -sv2k12 "+incdir+../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/4fba" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/4fba" \
"../../../bd/Uart_xadc/sim/Uart_xadc.v" \

vcom -work microblaze_v11_0_2 -93 \
"../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/f871/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Uart_xadc/ip/Uart_xadc_microblaze_0_0/sim/Uart_xadc_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_10 -93 \
"../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/2e88/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Uart_xadc/ip/Uart_xadc_dlmb_v10_0/sim/Uart_xadc_dlmb_v10_0.vhd" \
"../../../bd/Uart_xadc/ip/Uart_xadc_ilmb_v10_0/sim/Uart_xadc_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_17 -93 \
"../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/db6f/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Uart_xadc/ip/Uart_xadc_dlmb_bram_if_cntlr_0/sim/Uart_xadc_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/Uart_xadc/ip/Uart_xadc_ilmb_bram_if_cntlr_0/sim/Uart_xadc_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/4fba" \
"../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/4fba" \
"../../../bd/Uart_xadc/ip/Uart_xadc_lmb_bram_0/sim/Uart_xadc_lmb_bram_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work mdm_v3_2_17 -93 \
"../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/f9aa/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Uart_xadc/ip/Uart_xadc_mdm_1_0/sim/Uart_xadc_mdm_1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/4fba" \
"../../../bd/Uart_xadc/ip/Uart_xadc_clk_wiz_1_0/Uart_xadc_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/Uart_xadc/ip/Uart_xadc_clk_wiz_1_0/Uart_xadc_clk_wiz_1_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Uart_xadc/ip/Uart_xadc_rst_clk_wiz_1_100M_0/sim/Uart_xadc_rst_clk_wiz_1_100M_0.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_24 -93 \
"../../../../UART_proj.srcs/sources_1/bd/Uart_xadc/ipshared/d8db/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Uart_xadc/ip/Uart_xadc_axi_uartlite_0_1/sim/Uart_xadc_axi_uartlite_0_1.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

