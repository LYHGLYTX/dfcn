PYTHON ?= python3

.PHONY: all clean loader

all:
	"$(PYTHON)" tools/build.py

loader:
	"$(PYTHON)" tools/build.py --rebuild-loader

clean:
	"$(PYTHON)" tools/build.py --clean
