#!/bin/bash

PROJECT_NAME=${1:-test_repo}
USER=${2-MatteoLacki}
EMAIL=${3-matteo.lacki@gmail.com}

echo "PROJECT_NAME:" $PROJECT_NAME
echo "user:" $USER
echo "email:" $EMAIL

# Create project structure
mkdir -p $PROJECT_NAME/$PROJECT_NAME
echo "### "$PROJECT_NAME"" >> $PROJECT_NAME/README.md
touch $PROJECT_NAME/__init__.py
touch $PROJECT_NAME/$PROJECT_NAME/__init__.py

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
                     'Programming Language :: Python :: 3.7',
                     'Programming Language :: Python :: 3.8',
                     'Programming Language :: Python :: 3.9',
                     'Programming Language :: Python :: 3.10'],
        # install_requires=['numpy','numba','pandas']
)
EOF

cat >> $PROJECT_NAME/setup.cfg << EOF
[metadata]
description-file = README.md
EOF

cat >> $PROJECT_NAME/Makefile << EOF
make:
    echo "Welcome to Project '$PROJECT_NAME'"
upload_test_pypi:
    rm -rf dist || True
    python setup.py sdist
    twine -r testpypi dist/* 
upload_pypi:
    rm -rf dist || True
    python setup.py sdist
    twine upload dist/* 
EOF
echo "Finished setting up module '$PROJECT_NAME'"
