`ifdef ADOBE_Q100
	`define	DHT_BST_MIF		"../mif/adobe/adobe_dht_bst.memh"
	`define	Y_DC_CW_MIF		"../mif/t8/adobe_y_dc_codeword.memb"
	`define	Y_AC_CW_MIF		"../mif/adobe/adobe_y_ac_codeword.memb"
	`define	Y_S1_MIF		"../mif/adobe/adobe_y_symbol1.memh"
	`define	C_DC_CW_MIF		"../mif/t8/adobe_y_dc_codeword.memb"
	`define	C_AC_CW_MIF		"../mif/adobe/adobe_c_ac_codeword.memb"
	`define	C_S1_MIF		"../mif/adobe/adobe_c_symbol1.memh"
	`define	DQT_MIF			"../mif/adobe/adobe_dqt.memh"
	`define	Y_XI_SUBSAMPLE	1
	`define	Y_YI_SUBSAMPLE	1
	`define	C_XI_SUBSAMPLE	1
	`define	C_YI_SUBSAMPLE	1
	`define	Y_XO_SUBSAMPLE	1
	`define	Y_YO_SUBSAMPLE	1
	`define	C_XO_SUBSAMPLE	2
	`define	C_YO_SUBSAMPLE	2
	`define	LINE			8
`endif

`ifdef ADOBE_WEB_Q80
	`define	DHT_BST_MIF		"../mif/adobe_web/q80/adobe_web_dht_bst.memh"
	`define	Y_DC_CW_MIF		"../mif/t8/adobe_web_q80_y_dc_codeword.memb"
	`define	Y_AC_CW_MIF		"../mif/adobe_web/q80/adobe_web_y_ac_codeword.memb"
	`define	Y_S1_MIF		"../mif/adobe_web/q80/adobe_web_y_symbol1.memh"
	`define	C_DC_CW_MIF		"../mif/t8/adobe_web_q80_y_dc_codeword.memb"
	`define	C_AC_CW_MIF		"../mif/adobe_web/q80/adobe_web_c_ac_codeword.memb"
	`define	C_S1_MIF		"../mif/adobe_web/q80/adobe_web_c_symbol1.memh"
	`define	DQT_MIF			"../mif/adobe_web/q80/adobe_web_dqt.memh"
	`define	Y_XI_SUBSAMPLE	1
	`define	Y_YI_SUBSAMPLE	1
	`define	C_XI_SUBSAMPLE	1
	`define	C_YI_SUBSAMPLE	1
	`define	Y_XO_SUBSAMPLE	1
	`define	Y_YO_SUBSAMPLE	1
	`define	C_XO_SUBSAMPLE	2
	`define	C_YO_SUBSAMPLE	2
	`define	LINE			8
`endif

`ifdef MSPAINT
	`define	DHT_BST_MIF		"../mif/mspaint/mspaint_dht_bst.memh"
	`define	Y_DC_CW_MIF		"../mif/t8/mspaint_y_dc_codeword.memb"
	`define	Y_AC_CW_MIF		"../mif/mspaint/mspaint_y_ac_codeword.memb"
	`define	Y_S1_MIF		"../mif/mspaint/mspaint_y_symbol1.memh"
	`define	C_DC_CW_MIF		"../mif/t8/mspaint_y_dc_codeword.memb"
	`define	C_AC_CW_MIF		"../mif/mspaint/mspaint_c_ac_codeword.memb"
	`define	C_S1_MIF		"../mif/mspaint/mspaint_c_symbol1.memh"
	`define	DQT_MIF			"../mif/mspaint/mspaint_dqt.memh"
	`define	Y_XI_SUBSAMPLE	1
	`define	Y_YI_SUBSAMPLE	1
	`define	C_XI_SUBSAMPLE	2
	`define	C_YI_SUBSAMPLE	2
	`define	Y_XO_SUBSAMPLE	1
	`define	Y_YO_SUBSAMPLE	1
	`define	C_XO_SUBSAMPLE	2
	`define	C_YO_SUBSAMPLE	2
	`define	LINE			16
`endif

`ifndef	MAX_HRES
	`define	MAX_HRES	512
	`define	MAX_VRES	1024
`endif
