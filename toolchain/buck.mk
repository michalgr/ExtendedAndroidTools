# Copyright (c) Meta Platforms, Inc. and affiliates.

BUCK = /opt/buck
BUCK_OUT = buck-out

clean: clean-buck-out

clean-buck-out:
	-rm -fr $(BUCK_OUT)

.PHONY: clean-buck-out

out/buckconfig: $(OUT_DIR)
	cp toolchain/buckconfig.template $@
	@sed -ibkp -e "s+<NDK_PATH>+$(abspath $(NDK_PATH))+g" $@
