NAME=hello_rust

ifndef KERNELRELEASE
ifndef KDIR
KDIR:=~/asahi-linux
endif
PWD := $(shell pwd)

rust_flags=CROSS_COMPILE=aarch64-linux-gnu- HOSTRUSTC=rustc RUSTC=rustc BINDGEN=bindgen RUSTFMT=rustfmt RUST_TARGET=aarch64-unknown-none RUSTFLAGS="--target aarch64-unknown-none" RUST_LIB_SRC=$(shell rustc --print sysroot)/lib/rustlib/src/rust/library

all:
	@$(MAKE) $(rust_flags) -C $(KDIR) M=$(PWD) modules

install:
	@$(MAKE) $(rust_flags) -C $(KDIR) M=$(PWD) modules_install

clean:
	@rm -f *.o *.ko *.mod* .*.cmd *.d Module.symvers modules.order
	@rm -rf .tmp_versions

else
obj-m := $(NAME).o
endif
