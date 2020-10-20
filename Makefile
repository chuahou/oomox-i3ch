# SPDX-License-Identifier: MIT
# Copyright (c) 2020 Chua Hou

BUILD_DIR := $(shell pwd)/build

all: $(BUILD_DIR)/oomox-i3ch $(BUILD_DIR)/oomox-i3ch_dark

$(BUILD_DIR)/oomox-%: $(shell pwd)/colour/%
	oomox-cli -o $$(basename $@) -t $(BUILD_DIR) $<

clean:
	[ -d $(BUILD_DIR) ] && rm $(BUILD_DIR) -rf
