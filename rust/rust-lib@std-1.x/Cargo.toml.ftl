[package]
name = "${app.name}"
version = "${version!"0.0.1"}"
edition = "2024"

[lib]
name = "${app.name}"
path = "src/lib.rs"
crate-type = ["rlib", "staticlib"]