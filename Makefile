install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv --cov=main --cov=mylib test_*.py

format:	
	black *.py */*.py

lint:
	pylint --disable=R,C --ignore-patterns=test_.*?py *.py mylib/*.py\
	

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

checkgpu:
	echo "Checking GPU for PyTorch"
	python utils/verify_pytorch.py
	echo "Checking GPU for Tensorflow"
	python utils/verify_tf.py

refactor: format lint

deploy:
	#deploy goes here
		
all: install lint test format deploy