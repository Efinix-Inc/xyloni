`define	NOP			8'h00
`define	SWRESET		8'h01
`define	RDDID		8'h04
`define	RDDPM		8'h0A
`define	RDDMADCTL	8'h0B
`define	RDDCOLMOD	8'h0C
`define	RDDIM		8'h0D
`define	RDDSM		8'h0E
`define	RDDSDR		8'h0F
`define	SLPIN		8'h10
`define	SLPOUT		8'h11	// 00010001
`define	INVON		8'h21
`define	GAMSET		8'h26
`define	DISPOFF		8'h28
`define	DISPON		8'h29	// 00101001
`define	CASET		8'h2A
`define	RASET		8'h2B
`define	RAMWR		8'h2C
`define	RAMRD		8'h2D
`define	TEON		8'h35
`define	MADCTL		8'h36
`define	COLMOD		8'h3A
`define	RAMWRC		8'h3C	// 00111100
`define	RAMRDC		8'h3D
`define	DSTBON		8'h4F

`define	SPI_CMDH	8'h20
`define	SPI_CMDL	8'h00

`define	DES			1'b1
`define	SEL			1'b0
`define	CMD			1'b0
`define	DAT			1'b1

`define	RA0			8'h00
`define	RA1			8'h00
`define	RA2			8'h03
`define	RA3			8'h1F

`define	CA0			8'h00
`define	CA1			8'h00
`define	CA2			8'h01
`define	CA3			8'hDF

//`define	DELAY		'd2
//`define	INIT_DONE	'd21
//`define	INIT_DONE	'd4
//`define	SLEEP		'd21
//`define	EOF			'd25
`define	DELAY		'd732
`define	INIT_DONE	'd736
`define	SLEEP		'd736
`define	EOF			'd740
