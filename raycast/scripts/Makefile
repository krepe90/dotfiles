SWIFT_SRC_DIR = src
BIN_DIR = bin
SWIFT_FILES = $(wildcard $(SWIFT_SRC_DIR)/*.swift)
BINARIES = $(patsubst $(SWIFT_SRC_DIR)/%.swift,$(BIN_DIR)/%,$(SWIFT_FILES))

.PHONY: all clean build

all: build

build: $(BINARIES)

$(BIN_DIR)/%: $(SWIFT_SRC_DIR)/%.swift
	@mkdir -p $(BIN_DIR)
	swiftc -o $@ $<

clean:
	rm -rf $(BIN_DIR)

install: build
	@echo "Binaries built in $(BIN_DIR)/"
