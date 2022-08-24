# Copyright (c) Meta Platforms, Inc. and affiliates.

BUCK = /opt/buck

out/buckconfig: $(OUT_DIR)
	cp toolchain/buckconfig.template $@
	@sed -ibkp -e "s+<NDK_PATH>+$(abspath $(NDK_PATH))+g" $@
