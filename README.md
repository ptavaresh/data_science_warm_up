# An in-depth look at Python.  

A series of jupyter notebooks to explore Python development.  
For convenience, a Docker image is provided.  
Running locally will create a virtual environment and install jupyter lab there. 
The lab folder contains the notebooks. Intro.ipynb is where you should start.  

Prerequisites:
* make
* docker
* python3 (to run locally)
* node (to run locally)
* git and git-flow (to contribute to repo)

Running locally:  
`. initenv.sh`  
`jupyter lab `  

Running docker image:  
`make run` 

Building docker image:  
`make build`

Prune docker images and erase produced files:  
`make clean`  

Remember to follow git-flow branch management, starting with:  
`git flow init` 