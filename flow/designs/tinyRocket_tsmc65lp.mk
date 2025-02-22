export DESIGN_NAME = RocketTile
export PLATFORM    = tsmc65lp

export VERILOG_FILES = ./designs/src/tinyRocket/design.v
export SDC_FILE      = ./designs/src/tinyRocket/design.sdc

export MERGED_LEF = ./platforms/tsmc65lp/merged.lef
export LIB_FILES  = $(sort $(wildcard ./platforms/tsmc65lp/lib/*.lib))
export GDS_FILES  = $(sort $(wildcard ./platforms/tsmc65lp/gds/*.gds2))

export RUN_MACRO_PLACEMENT = 1

# These values must be multiples of placement site
export DIE_AREA    = 0 0 925 806.4
export CORE_AREA   = 10 12 915 796.8
export CORE_WIDTH  = 905
export CORE_HEIGHT = 784.8

export CLOCK_PERIOD = 5.600
export CLOCK_PORT   = clock
