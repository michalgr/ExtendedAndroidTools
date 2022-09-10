# Copyright (c) Meta Platforms, Inc. and affiliates.

ANT_VERSION = 1.9.16

BUCK_HOST_DEPS = python
$(eval $(call project-define,buck))

$(BUCK_HOST): \
	export PATH:=$(abspath $(BUCK_HOST_BUILD_DIR))/bin:$(PATH)
$(BUCK_HOST):
	cd $(BUCK_SRCS) && $(abspath $(BUCK_HOST_BUILD_DIR)/apache-ant-$(ANT_VERSION)/bin/ant)
	cd $(BUCK_SRCS) && ./bin/buck build buck --out=$(abspath $(HOST_OUT_DIR)/bin/buck)
	touch $@

$(BUCK_HOST_BUILD_DIR): $(DOWNLOADS_DIR)/apache-ant-$(ANT_VERSION)-bin.zip
	mkdir $@
	mkdir $@/bin
	ln -s $(abspath $(HOST_OUT_DIR)/bin/python3) $@/bin/python
	cd $@ && unzip $(abspath $(DOWNLOADS_DIR)/apache-ant-$(ANT_VERSION)-bin.zip)

ANT_URL = https://dlcdn.apache.org//ant/binaries/apache-ant-$(ANT_VERSION)-bin.zip
$(DOWNLOADS_DIR)/apache-ant-$(ANT_VERSION)-bin.zip:
	wget -q -P $(DOWNLOADS_DIR) $(ANT_URL)

BUCK_REPO = https://github.com/facebook/buck.git
BUCK_VERSION = v2022.05.05.01
projects/buck/sources:
	git clone $(BUCK_REPO) --depth 1 \
		--branch $(BUCK_VERSION) \
		$@
