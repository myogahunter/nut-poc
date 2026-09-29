dist:
	@echo "Creating dist tarball stub..."
	tar czf nut-0.0.1.tar.gz autogen.sh configure Makefile tools/ || true

dist-hash:
	@echo "Creating dist hash..."
	sha256sum nut-0.0.1.tar.gz > nut-0.0.1.tar.gz.sha256 || true

