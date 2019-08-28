all : docker run
.PHONY:  clean run docker env script
current_dir = $(shell pwd)
tutorial_dir = "/home/tutorial"
clean: 
	docker system prune --volumes -f
	rm -f app/lab/*.py
	rm -f app/lab/*.html
	rm -fr .venv
	find ./app  -type d -name ".ipynb_checkpoints" -exec rm -rf {} +
	rm -fr  ~/.jupyter

run:
	docker run -it --rm -p 8888:8888 \
	--mount type=bind,source="$(current_dir)"/app,target="$(tutorial_dir)"/app \
	deep_python

docker:	Dockerfile
	docker build --tag deep_python  .

env:
	. ./initenv.sh

script:
	jupyter nbconvert --to script app/lab/*.ipynb

html:
	jupyter nbconvert app/lab/*.ipynb --to html