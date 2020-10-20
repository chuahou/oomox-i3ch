# SPDX-License-Identifier: MIT
# Copyright (c) 2020 Chua Hou

# input
COLOUR_DIR := colour
COLOURS    := i3ch i3ch-dark
COLOURS    := $(COLOURS:%=$(COLOUR_DIR)/%)

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
		-o $$(basename $@) $(shell pwd)/$<
	mkdir -p $$(dirname $@)
	cp -r $$HOME/.icons/$$(basename $@) $@

# remove output
clean:
	if [ -d $(THEMES_DIR) ]; then rm $(THEMES_DIR) -rf; fi
	if [ -d $(ICONS_DIR)  ]; then rm $(ICONS_DIR)  -rf; fi

# installation
PREFIX ?= /usr/local
TGT := $(DESTDIR)$(PREFIX)/share
install: $(THEMES) $(ICONS)
	mkdir -p $(TGT)/themes
	cp -r $(THEMES_DIR)/* $(TGT)/themes
	mkdir -p $(TGT)/icons
	cp -r $(ICONS_DIR)/* $(TGT)/icons
uninstall:
	rm $(TGT)/themes/oomox-i3ch \
		$(TGT)/themes/oomox-i3ch-dark \
		$(TGT)/icons/oomox-i3ch \
		$(TGT)/icons/oomox-i3ch-dark -rf

.PHONY: all clean install uninstall
