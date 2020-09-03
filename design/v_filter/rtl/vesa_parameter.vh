`ifdef	VESA_640X480_60FPS
	`define	HOR_PIXELS			12'd640		// Pixels
	`define	VER_PIXELS			12'd480		// Lines
	`define	PCLK				25			// MHz
	`define	HOR_SYNC_POLARITY	"NEGATIVE"
	`define	VER_SYNC_POLARTY	"NEGATIVE"
	`define	HOR_TOTAL_TIME		12'd800		// Pixels
	`define	HOR_RIGHT_BORDER	12'd8		// Pixels
	`define	HOR_FRONT_PORCH		12'd8		// Pixels
	`define	HOR_SYNC_TIME		12'd96		// Pixels
	`define	HOR_BACK_PORCH		12'd40		// Pixels
	`define	HOR_LEFT_BORDER		12'd8		// Pixels
	`define	VER_TOTAL_TIME		12'd525		// Lines
	`define	VER_BOTTOM_BORDER	12'd8		// Lines
	`define	VER_FRONT_PORCH		12'd2		// Lines
	`define	VER_SYNC_TIME		12'd2		// Lines
	`define	VER_BACK_PORCH		12'd25		// Lines
	`define	VER_TOP_BORDER		12'd8		// Lines
`endif

`ifdef	VESA_800X600_60FPS
	`define	HOR_PIXELS			12'd800		// Pixels
	`define	VER_PIXELS			12'd600		// Lines
	`define	PCLK				12'd40		// MHz
	`define	HOR_SYNC_POLARITY	"POSITIVE"
	`define	VER_SYNC_POLARITY	"POSITIVE"
	`define	HOR_TOTAL_TIME		12'd1056	// Pixels
	`define	HOR_RIGHT_BORDER	12'd0		// Pixels
	`define	HOR_FRONT_PORCH		12'd40		// Pixels
	`define	HOR_SYNC_TIME		12'd128		// Pixels
	`define	HOR_BACK_PORC		12'd88		// Pixels
	`define	HOR_LEFT_BORDER		12'd0		// Pixels
	`define	VER_TOTAL_TIME		12'd628		// Lines
	`define	VER_BOTTOM_BORDER	12'd0		// Lines
	`define	VER_FRONT_PORCH		12'd1		// Lines
	`define	VER_SYNC_TIME		12'd4		// Lines
	`define	VER_BACK_PORCH		12'd23		// Lines
	`define	VER_TOP_BORDER		12'd0		// Lines
`endif

`ifdef	VESA_1024X768_60FPS
	`define	HOR_PIXELS			12'd1024	// Pixels
	`define	VER_PIXELS			12'd768		// Lines
	`define	PCLK				12'd65		// MHz
	`define	HOR_SYNC_POLARITY	"NEGATIVE"
	`define	VER_SYNC_POLARITY	"NEGATIVE"
	`define	HOR_TOTAL_TIME		12'd1344	// Pixels
	`define	HOR_RIGHT_BORDER	12'd0		// Pixels
	`define	HOR_FRONT_PORCH		12'd24		// Pixels
	`define	HOR_SYNC_TIME		12'd136		// Pixels
	`define	HOR_BACK_PORC		12'd160		// Pixels
	`define	HOR_LEFT_BORDER		12'd0		// Pixels
	`define	VER_TOTAL_TIME		12'd806		// Lines
	`define	VER_BOTTOM_BORDER	12'd0		// Lines
	`define	VER_FRONT_PORCH		12'd3		// Lines
	`define	VER_SYNC_TIME		12'd6		// Lines
	`define	VER_BACK_PORCH		12'd29		// Lines
	`define	VER_TOP_BORDER		12'd0		// Lines
`endif

`ifdef	VESA_1280X720_60FPS
	`define	HOR_PIXELS			12'd1280	// Pixels
	`define	VER_PIXELS			12'd720		// Lines
	`define	PCLK				12'd74		// MHz
	`define	HOR_SYNC_POLARITY	"POSITIVE"
	`define	VER_SYNC_POLARITY	"POSITIVE"
	`define	HOR_TOTAL_TIME		12'd1650	// Pixels
	`define	HOR_RIGHT_BORDER	12'd0		// Pixels
	`define	HOR_FRONT_PORCH		12'd110		// Pixels
	`define	HOR_SYNC_TIME		12'd40		// Pixels
	`define	HOR_BACK_PORC		12'd220		// Pixels
	`define	HOR_LEFT_BORDER		12'd0		// Pixels
	`define	VER_TOTAL_TIME		12'd750		// Lines
	`define	VER_BOTTOM_BORDER	12'd0		// Lines
	`define	VER_FRONT_PORCH		12'd5		// Lines
	`define	VER_SYNC_TIME		12'd5		// Lines
	`define	VER_BACK_PORCH		12'd20		// Lines
	`define	VER_TOP_BORDER		12'd0		// Lines
`endif
