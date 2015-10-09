# Jupyter/IPython Notebooks

*For testing and prototyping LCMAP APIs, UX, and DX*

## Dependencies

LCMAP depends upon the [GDAL](http://www.gdal.org/)
library and this is something that needs to be installed on your system using
your package manager.

For Mac OS X:

```bash
$ brew install gdal
```

For Debian-based Linux:

```bash
$ sudo apt-get install gdal
```

## Usage

### Python

To start a Jupyter Notebook running a Python 3 kernel, run the following:

```bash
$ make py-run
```

### Clojure

To start a Jupyter Notebook running a Clojure kernel, run the following:

```bash
$ make clj-run
```
