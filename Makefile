VENV=.venv
PY=$(VENV)/bin/python3.5
PIP=$(VENV)/bin/pip
JUP=$(VENV)/bin/jupyter
PIP_INSTALLER=get-pip.py
PIP_INSTALLER_URL=https://raw.githubusercontent.com/pypa/pip/develop/contrib/$(PIP_INSTALLER)
GET_PIP=python/$(PIP_INSTALLER)
GET_CLOJUP=clojure/clojupyter

$(VENV):
	python3.5 -m venv --without-pip $(VENV)

$(GET_PIP):
	wget $(PIP_INSTALLER_URL) && \
	mv $(PIP_INSTALLER) python/$(PIP_INSTALLER)

$(PIP): $(GET_PIP)
	. $(VENV)/bin/activate && \
	$(PY) python/$(PIP_INSTALLER)

setup-python: $(VENV) $(VENV)/bin/pip
	. $(VENV)/bin/activate && \
	$(PIP) install jupyter

setup-jupyter: $(VENV) $(VENV)/bin/pip
	. $(VENV)/bin/activate && \
	$(PIP) install numpy pandas matplotlib scikit-image
	. $(VENV)/bin/activate && \
	$(PIP) freeze > python/requirements.txt

setup: setup-python setup-jupyter

clean:
	rm -rf .venv
