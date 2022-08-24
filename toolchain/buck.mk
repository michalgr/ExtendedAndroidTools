# Copyright (c) Meta Platforms, Inc. and affiliates.

BUCK = $(abspath $(HOST_OUT_DIR)/opt/buck)

out/ndk.buckconfig: | $(OUT_DIR)
	cp toolchain/ndk.buckconfig.template $@
	@sed -ibkp -e "s+<NDK_PATH>+$(abspath $(NDK_PATH))+g" $@

out/python.buckconfig: $(HOST_BUILD_DIR)/python.done | $(OUT_DIR)
	cp toolchain/python.buckconfig.template $@
	@sed -ibkp -e "s+<PYTHON_INTERPRETER_PATH>+$(abspath $(HOST_OUT_DIR)/bin/python3.10)+g" $@

buckconfig: out/ndk.buckconfig
buckconfig: out/python.buckconfig

setup-buck: buck-host buckconfig

.PHONY: buckconfig
