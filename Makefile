BUMP=patch

all:

new-dist:
	$(MAKE) clean bump build upload

bump-upload:
	$(MAKE) bump
	$(MAKE) upload

bump:
	bumpversion ${BUMP}

upload:
	git push --tags
	git push
	$(MAKE) clean
	$(MAKE) build
	twine upload dist/*

build:
	python3 setup.py sdist

install:
	python3 setup.py install --record files.txt

clean:
	rm -rf dist/ build/ run-and-retry.egg-info/ MANIFEST

uninstall:
	xargs rm -rf < files.txt
