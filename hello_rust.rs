// SPDX-License-Identifier: GPL-2.0

//! Rust hello world example.

use kernel::prelude::*;

module! {
    type: HelloRust,
    name: "hello_rust",
    author: "Andrea Righi <andrea.righi@canonical.com>",
    description: "Rust hello world example",
    license: "GPL",
}

struct HelloRust {
}

impl kernel::Module for HelloRust {
    fn init(_module: &'static ThisModule) -> Result<Self> {
        pr_info!("Hello from Rust\n");
        Ok(HelloRust { })
    }
}

impl Drop for HelloRust {
    fn drop(&mut self) {
        pr_info!("Goodbye from Rust\n");
    }
}
