export DESIGN_NAME = jpeg_encoder
export PLATFORM    = tsmc65lp

export VERILOG_FILES = ./designs/src/jpeg/design.v
export SDC_FILE      = ./designs/src/jpeg/design.sdc

export MERGED_LEF = ./platforms/tsmc65lp/merged.lef
export LIB_FILES  = $(sort $(wildcard ./platforms/tsmc65lp/lib/*.lib))
export GDS_FILES  = $(sort $(wildcard ./platforms/tsmc65lp/gds/*.gds2))

# These values must be multiples of placement site
export DIE_AREA    = 0 0 1100 760.8
export CORE_AREA   = 10 12 1090 751.2
export CORE_WIDTH  = 1080
export CORE_HEIGHT = 739.2

export CLOCK_PERIOD = 4.000
export CLOCK_PORT   = clk
