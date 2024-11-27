.PHONY: clean setup roles autolint test
test ?= tests/functional

PROJ_NAME := $(shell basename `pwd`)
export virt_name := ${PROJ_NAME}

clean:
	rm -rf env/
	$(MAKE) setup

setup:
	python3 -m venv --prompt "|> $$virt_name  >" env
	env/bin/pip install --upgrade pip
	env/bin/pip install -r requirements.txt
	@echo
	@echo "VirtualENV Setup Complete. Now run: source env/bin/activate"
	@echo

autolint:
	ansible-lint --fix

test:
	APP_ENV=dev pytest -v --disable-warnings -s --durations=100 $(test)
