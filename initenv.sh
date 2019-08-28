#!/bin/bash
# create virtual env if necessary
# else activate virtualenv
if [ ! -d .venv ]; then
echo "Create .venv"
python3 -m venv .venv
source .venv/bin/activate
# Install Jupyter with extensions enabled
# This installs some node stuff
# Set up password.
if [ -f requirements.txt ]; then
echo "Install from requirements file"
pip install -r requirements.txt
else
echo "Install latest versions"
pip install notebook
pip install ipywidgets
pip install jupyterlab
pip install jupyter_nbextensions_configurator
pip install jupyter_contrib_nbextensions
pip install nbdime
fi
jupyter nbextensions_configurator enable --user
jupyter contrib nbextensions install --user
jupyter labextension install jupyterlab-python-bytecode
jupyter labextension install @jupyterlab/toc 
jupyter nbextension enable --py widgetsnbextension
jupyter labextension install @jupyter-widgets/jupyterlab-manager
nbdime extensions --enable
if [ ! -f ~/.jupyter/jupyter_notebook_config.py ]; then
jupyter notebook --generate-config
echo "Generating notebook password. Please enter desired password."
cat << EOF | jupyter notebook password
letmein
letmein
EOF
pip freeze > requirements.txt
fi
else
echo "Activate virtualenv"
source .venv/bin/activate
fi
