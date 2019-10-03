#!/bin/bash

PROJECT_NAME=${1:-test_repo}
USER=${2-MatteoLacki}
EMAIL=${3-matteo.lacki@gmail.com}

echo "PROJECT_NAME:" $PROJECT_NAME
echo "user:" $USER
echo "email:" $EMAIL

# Let github know we are up to something
curl -u $USER https://api.github.com/user/repos -d '{"name":"'"$PROJECT_NAME"'"}'

# Create project structure
mkdir -p $PROJECT_NAME/$PROJECT_NAME
echo "### "$PROJECT_NAME"" >> $PROJECT_NAME/README.md
touch $PROJECT_NAME/__init__.py
touch $PROJECT_NAME/$PROJECT_NAME/__init__.py

# Create setup.py and other module intended files
cat >> $PROJECT_NAME/setup.py << EOF
# This Python file uses the following encoding: utf-8
from setuptools import setup, find_packages

setup(  name='$PROJECT_NAME',
        packages=find_packages(),
        version='0.0.1',
        description='Description.',
        long_description='Long description.',
        author='$USER',
        author_email='$EMAIL',
        url='https://github.com/$USER/$PROJECT_NAME.git',
        keywords=['Great module', 'Devel Inside'],
        classifiers=['Development Status :: 1 - Planning',
                     'License :: OSI Approved :: BSD License',
                     'Intended Audience :: Science/Research',
                     'Topic :: Scientific/Engineering :: Chemistry',
                     'Programming Language :: Python :: 3.6',
                     'Programming Language :: Python :: 3.7'],
        install_requires=['numpy',
                          'networkx',
                          'pandas',
                          'scipy'])
EOF

cat >> $PROJECT_NAME/setup.cfg << EOF
[metadata]
description-file = README.md
EOF

cat >> $PROJECT_NAME/Makefile << EOF
make:
	echo "hello"
test_pip:
	twine -r test blablabla
update_pip:
	twine blablabla
EOF

# Create git repo and push the code there
cd $PROJECT_NAME
git init
git add README.md setup.py setup.cfg Makefile __init__.py $PROJECT_NAME/__init__.py
git commit -m "first commit"
git remote add origin https://github.com/$USER/$PROJECT_NAME.git
git push -u origin master
