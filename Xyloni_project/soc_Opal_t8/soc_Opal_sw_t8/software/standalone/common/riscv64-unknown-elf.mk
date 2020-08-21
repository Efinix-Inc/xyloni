RISCV_BIN ?= riscv-none-embed-
RISCV_CC=${RISCV_BIN}gcc
RISCV_OBJCOPY=${RISCV_BIN}objcopy
RISCV_OBJDUMP=${RISCV_BIN}objdump

MARCH := rv32i
BENCH ?= no
DEBUG?=no
DEBUG_OG?=no

ifeq ($(RV_M),yes)
	MARCH := $(MARCH)m
endif

#ifeq ($(RV_A),yes)
#	MARCH := $(MARCH)a
#else ifeq ($(RV_C),yes)
#	MARCH := $(MARCH)ac
#endif

ifeq ($(RV_C),yes)
	MARCH := $(MARCH)ac
endif


ifeq ($(DEBUG),yes)
ifneq ($(DEBUG_OG),yes)
	CFLAGS += -g3 -O0
else
	CFLAGS += -g3 -Og
endif
endif

ifneq ($(DEBUG),yes)
ifneq ($(BENCH),yes)
	CFLAGS += -Os
else
	CFLAGS += -O3
endif
endif

CFLAGS += -march=$(MARCH) -mabi=ilp32 -DUSE_GP
LDFLAGS += -march=$(MARCH) -mabi=ilp32

