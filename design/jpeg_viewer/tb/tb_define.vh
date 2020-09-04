`ifdef test_pattern_01
	`define	MSPAINT
	`define	JPG_FILE	"jpg_in/yuv420/test_pattern_01.jpg"
	`define	BMP_FILE	"bmp_out/test_pattern_01_fpga.bmp"
	`define	REF_MTX_Y	""
	`define	REF_MTX_U	""
	`define	REF_MTX_V	""
	`define	JPG_AS		1024
	`define	BMP_AS		1024
	`define	MAX_HRES	512
	`define	MAX_VRES	1024
`endif

`ifdef test_pattern_03
	`define	MSPAINT
	`define	JPG_FILE	"jpg_in/yuv420/test_pattern_03.jpg"
	`define	BMP_FILE	"bmp_out/test_pattern_03_fpga.bmp"
	`define	REF_MTX_Y	""
	`define	REF_MTX_U	""
	`define	REF_MTX_V	""
	`define	JPG_AS		1024
	`define	BMP_AS		1024
	`define	MAX_HRES	512
	`define	MAX_VRES	1024
`endif

`ifdef test_pattern_04
	`define	MSPAINT
	`define	JPG_FILE	"jpg_in/yuv420/test_pattern_04.jpg"
	`define	BMP_FILE	"bmp_out/test_pattern_04_fpga.bmp"
	`define	REF_MTX_Y	""
	`define	REF_MTX_U	""
	`define	REF_MTX_V	""
	`define	JPG_AS		1024
	`define	BMP_AS		1024
	`define	MAX_HRES	512
	`define	MAX_VRES	1024
`endif

`ifdef test_pattern_05
	`define	MSPAINT
	`define	JPG_FILE	"jpg_in/yuv420/test_pattern_05.jpg"
	`define	BMP_FILE	"bmp_out/test_pattern_05_fpga.bmp"
	`define	REF_MTX_Y	""
	`define	REF_MTX_U	""
	`define	REF_MTX_V	""
	`define	JPG_AS		2*1024
	`define	BMP_AS		4*1024
	`define	MAX_HRES	512
	`define	MAX_VRES	1024
`endif

`ifdef innovation_banner
	`define	MSPAINT
	`define	JPG_FILE	"jpg_in/yuv420/innovation-banner-80x200_s.jpg"
	`define	BMP_FILE	"bmp_out/innovation-banner-80x200_fpga.bmp"
	`define	REF_MTX_Y	"jpg_in/yuv420/mtx_ref/innovation-banner-80x200_s_Y.txt"
	`define	REF_MTX_U	"jpg_in/yuv420/mtx_ref/innovation-banner-80x200_s_U.txt"
	`define	REF_MTX_V	"jpg_in/yuv420/mtx_ref/innovation-banner-80x200_s_V.txt"
//	`define	JPG_AS		147*1024
//	`define	BMP_AS		3*1024*1024
	`define	JPG_AS		63*1024
	`define	BMP_AS		650*1024
	`define	MAX_HRES	512
	`define	MAX_VRES	1024
`endif

`ifdef planes_banner
	`define	MSPAINT
	`define	JPG_FILE	"jpg_in/yuv420/retractable-banner-planes_s.jpg"
	`define	BMP_FILE	"bmp_out/retractable-banner-planes_fpga.bmp"
	`define	REF_MTX_Y	""
	`define	REF_MTX_U	""
	`define	REF_MTX_V	""
//	`define	JPG_AS		136*1024
//	`define	BMP_AS		3*1024*1024
	`define	JPG_AS		58*1024
	`define	BMP_AS		650*1024
	`define	MAX_HRES	512
	`define	MAX_VRES	1024
`endif

`ifdef trion_poster
	`define	MSPAINT
	`define	JPG_FILE	"jpg_in/yuv420/trion-poster-80x200-hires_s.jpg"
	`define	BMP_FILE	"bmp_out/trion-poster-80x200-hires_fpga.bmp"
	`define	REF_MTX_Y	"jpg_in/yuv420/mtx_ref/trion-poster-80x200-hires_s_Y.txt"
	`define	REF_MTX_U	"jpg_in/yuv420/mtx_ref/trion-poster-80x200-hires_s_U.txt"
	`define	REF_MTX_V	"jpg_in/yuv420/mtx_ref/trion-poster-80x200-hires_s_V.txt"
//	`define	JPG_AS		574*1024
//	`define	BMP_AS		11*1024*1024
	`define	JPG_AS		155*1024
	`define	BMP_AS		2*1024*1024
	`define	MAX_HRES	1024
	`define	MAX_VRES	1024
`endif

`ifdef board_test
	`define	MSPAINT
	`define	START_ADDR	'h00000
	`define	ADDR_OFFSET	'h40000
	`define	JPG_FILE	"jpg_in/yuv420/board_test.jpg"
	`define	BMP_FILE	"bmp_out/board_test_fpga.bmp"
	`define	REF_MTX_Y	"jpg_in/yuv420/mtx_ref/board_test_Y.txt"
	`define	REF_MTX_U	"jpg_in/yuv420/mtx_ref/board_test_U.txt"
	`define	REF_MTX_V	"jpg_in/yuv420/mtx_ref/board_test_V.txt"
	`define	JPG_AS		32*1024
	`define	BMP_AS		2*1024*1024
	`define	MAX_HRES	512
	`define	MAX_VRES	1024
`endif

////////////////////////////////////////////////////////////////

`ifdef test_pattern_05_q80
	`define	ADOBE_WEB_Q80
	`define	START_ADDR	'h00000
	`define	ADDR_OFFSET	'h40000
	`define	JPG_FILE	"jpg_in/yuv444/q80/test_pattern_05.jpg"
	`define	BMP_FILE	"bmp_out/test_pattern_05_fpga.bmp"
	`define	REF_MTX_Y	"jpg_in/yuv444/q80/mtx_ref/test_pattern_05_Y.txt"
	`define	REF_MTX_U	"jpg_in/yuv444/q80/mtx_ref/test_pattern_05_U.txt"
	`define	REF_MTX_V	"jpg_in/yuv444/q80/mtx_ref/test_pattern_05_V.txt"
	`define	JPG_AS		3*1024
	`define	BMP_AS		4*1024
	`define	MAX_HRES	512
	`define	MAX_VRES	1024
`endif

`ifdef efinity_web_q80
	`define	ADOBE_WEB_Q80
	`define	START_ADDR	'h00000
	`define	ADDR_OFFSET	'h40000
	`define	JPG_FILE	"jpg_in/yuv444/q80/efinity.jpg"
	`define	BMP_FILE	"bmp_out/efinity_fpga.bmp"
	`define	REF_MTX_Y	"jpg_in/yuv444/q80/mtx_ref/efinity_Y.txt"
	`define	REF_MTX_U	"jpg_in/yuv444/q80/mtx_ref/efinity_U.txt"
	`define	REF_MTX_V	"jpg_in/yuv444/q80/mtx_ref/efinity_V.txt"
	`define	JPG_AS		5*1024
	`define	BMP_AS		13*1024
	`define	MAX_HRES	512
	`define	MAX_VRES	1024
`endif

////////////////////////////////////////////////////////////////
