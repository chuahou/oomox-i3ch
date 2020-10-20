# SPDX-License-Identifier: MIT
# Copyright (c) 2020 Chua Hou

# input
COLOUR_DIR := colour
COLOURS    := $(shell find $(COLOUR_DIR) -maxdepth 1 -type f)

# output
THEMES_DIR := themes
ICONS_DIR  := icons
THEMES     := $(COLOURS:$(COLOUR_DIR)/%=$(THEMES_DIR)/oomox-%)
ICONS      := $(COLOURS:$(COLOUR_DIR)/%=$(ICONS_DIR)/oomox-%)

# oomox installation
OOMOX ?= /opt/oomox

# build everything
all: $(THEMES) $(ICONS)

# build themes
$(THEMES_DIR)/oomox-%: $(COLOUR_DIR)/%
	oomox-cli -o $$(basename $@) -t $$(realpath $(THEMES_DIR)) $$(realpath $<)

# build icons
$(ICONS_DIR)/oomox-%: $(COLOUR_DIR)/%
	cd $(OOMOX) && \
		exec ./plugins/icons_papirus/change_color.sh \
		-o tmp_icons $(shell pwd)/$<
	mkdir -p $$(dirname $@)
	mv $$HOME/.icons/tmp_icons $@

# remove output
clean:
	if [ -d $(THEMES_DIR) ]; then rm $(THEMES_DIR) -rf; fi
	if [ -d $(ICONS_DIR)  ]; then rm $(ICONS_DIR)  -rf; fi
