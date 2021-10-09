usage:
	@echo "Usage: " && grep '^.PHONY' Makefile | awk '{print "  make "' $$2}'

.PHONY: setup-dev
setup-dev:
	rustup component add rustfmt clippy rust-src rls rust-analysis
	rustup component list --installed
	@echo "--------------------"
	rustup --version
	cargo install cargo-watch cargo-edit

.PHONY: setup-repl
setup-repl:
	cargo install evcxr_repl --version 0.11.0

.PHONY: setup-pacakge
setup-package:
	rustup target add x86_64-apple-darwin
	rustup target add aarch64-apple-darwin

.PHONY: test
test:
	cargo test

.PHONY: test-watch
test-watch:
	cargo watch -x test

.PHONY: build
build:
	cargo build

.PHONY: build-release
build-release:
	cargo build --release

.PHONY: format
format:
	cargo fmt
.PHONY: f
f: format

.PHONY: lint
lint:
	cargo clippy
.PHONY: l
l: lint

.PHONY: fix
fix:
	cargo fix

.PHONY: clean
clean:
	rm -rf target dist

.PHONY: repl
repl:
	evcxr
