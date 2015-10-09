VENV=.venv-lcmap
PY=$(VENV)/bin/python3.4
PIP=$(VENV)/bin/pip
JUP=$(VENV)/bin/jupyter
PIP_INSTALLER=get-pip.py
PIP_INSTALLER_URL=https://raw.githubusercontent.com/pypa/pip/develop/contrib/$(PIP_INSTALLER)
GET_PIP=python/$(PIP_INSTALLER)
GET_CLOJUP=clojure/clojupyter

$(VENV):
	python3.4 -m venv --without-pip $(VENV)

$(GET_PIP):
	wget $(PIP_INSTALLER_URL) && \
	mv $(PIP_INSTALLER) python/$(PIP_INSTALLER)

$(PIP): $(GET_PIP)
	. $(VENV)/bin/activate && \
	$(PY) python/$(PIP_INSTALLER)

jupyter-setup: $(VENV) $(VENV)/bin/pip
	. $(VENV)/bin/activate && \
	$(PIP) install jupyter

py-setup: $(VENV) $(VENV)/bin/pip jupyter-setup
	. $(VENV)/bin/activate && \
	$(PIP) install numpy pandas matplotlib scikit-image
	. $(VENV)/bin/activate && \
	$(PIP) install git+https://github.com/USGS-EROS/lcmap-ingest-py.git
	. $(VENV)/bin/activate && \
	$(PIP) freeze > python/requirements.txt

py-run: py-setup
	. $(VENV)/bin/activate && \
	PYTHONPATH=. $(JUP) notebook --notebook-dir=./notebooks
	. $(VENV)/bin/activate && \

$(GET_CLOJUP):
	git clone https://github.com/roryk/clojupyter $(GET_CLOJUP)

clj-setup: jupyter-setup $(GET_CLOJUP)
	. $(VENV)/bin/activate && \
	cd $(GET_CLOJUP) && \
	make

clj-run: clj-setup
	. $(VENV)/bin/activate && \
	PYTHONPATH=. $(JUP) notebook --notebook-dir=./notebooks --kernel=clojure

clean:
	-find python -type d -name "__pycache__" -exec rm -rf {} \;
	rm $(PIP_INSTALLER)

