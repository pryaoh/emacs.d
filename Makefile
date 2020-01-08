## Make
## CopyRight (C) 2008-2020 Younan oh

## Author: Younan Oh <pryaoh@gmail.com>
## This file is not part of GNU Emacs.
##
## License: MIT


EMACS = emacs
EMACS_DIR = $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

BATCH_ARGS = --batch -q -l .emacs.t/init.el
EMACS_BATCH = $(EMACS) $(BATCH_ARGS)

BUTTERCUP_FLAGS = -f buttercop-run-dicover


SRCS = $(wildcard core/*.el)
TEST_SRCS = $(wildcard tests/*.el)

OBJS = $(SRCS:.el=.elc)
BACKUPS = $(SRCS:.el=.el~) $(TEST_SRCS:.el=.el~)

.PHONY: test


setup:
	$(EMACS_BATCH)

version:



test: setup
	$(EMACS_BATCH) $(BUTTERCUP_FLAGS)

clean:
	rm -f $(OBJS) $(BACKUPS)

remove: clean
	rm -rf .emacs.t/elpa .emacs.t/quelpa .emacs.t/.emacs-custom.el*
