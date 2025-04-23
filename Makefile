PROJECT      := sdio_fb
TOP_MODULE   := top
DEVICE       := xc7a35tcsg324-1
BUILD_DIR    := build
SRC_DIR      := src
XDC_FILE     := top.xdc
TCL_SCRIPT   := scripts/build.tcl

all: synth

synth:
	vivado -mode batch -source $(TCL_SCRIPT) \
		-tclargs $(PROJECT) $(TOP_MODULE) $(DEVICE) $(SRC_DIR) $(XDC_FILE) $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR) *.jou *.log *.str *.cache *.hw *.webtalk *.Xil

.PHONY: all synth clean
