#!/usr/bin/env python

from distutils.core import setup
from Cython.Build import cythonize

setup(name='cec', version='0.1.0',
      description="Python bindings for libcec",
      ext_modules=cythonize("*.pyx"))
