
SHELL := /bin/bash
PRJROOT := .

setup:
	source $(PRJROOT)/tools/env_setup/env_setup.sh

tooltest:
	source $(PRJROOT)/tools/tooltest.sh

clean:
	rm -rf venv
	rm -rf $(PRJROOT)/tools/bin
