# Jupyter/IPython Notebooks

*Learn how to use (and test) the LCMAP system.*

## Dependency

* Python 3.5.x

## Getting Started

Once you have Python installed, run this from a shell to create a virtual environment with Jupyter, Numpy, Pandas, Matplotlib, and scikit-image:

```
make setup
```

Start a Jupyter Notebook running a Python 3 kernel, run:

```bash
bin/run
```

Go to `http://localhost:1078/` using a web browser.

## Organization

Notebooks are organized by topic:

* Aardvark
  * Using Landsat Data
  * Curating Landsat Data
* Clownfish
  * Working with Change Detection Data
  * Deploying an Algorithm
* Other
  * Spark

## Contributing

If you need to provide additional libraries add them to requirements.txt, just
make sure you've activated this project's virtual environment first.

```bash
source .venv/bin/activate
pip freee > requirements.txt
```
