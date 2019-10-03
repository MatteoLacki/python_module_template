def make_setup(package_name,
               url,
               author='Mateusz Krzysztof Łącki',
               email='matteo.lacki@gmail.com',
               version='0.0.1',
               description='',
               long_description='',
               keywords=['Make Code Great Again', 'Good Coder', 'Devel Inside'],
               classifiers=['Development Status :: 1 - Planning',
                            'License :: OSI Approved :: BSD License',
                            'Intended Audience :: Science/Research',
                            'Topic :: Scientific/Engineering :: Chemistry',
                            'Programming Language :: Python :: 3.6',
                            'Programming Language :: Python :: 3.7'],
               install_requires=['numpy',
                                 'networkx',
                                 'pandas',
                                 'scipy']):
    return f"""# This Python file uses the following encoding: utf-8
    from setuptools import setup, find_packages

    setup(
        name='{package_name}',
        packages=find_packages(),
        version={version},
        description='{description}',
        long_description='{long_description}',
        author='{author}',
        author_email='{email}',
        url='{url}',
        keywords={repr(keywords)},
        classifiers={repr(classifiers)},
        install_requires={repr(install_requires)}
    )
    """